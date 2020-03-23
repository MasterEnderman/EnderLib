import os
import shutil

from elib import *
from elib.strings import *
from elib.utils import *

class triumphOptions(enderlib):

    modpack = "testpack"
    logging = False
    removeDefaultConfigs = True
    removeDefaultFilter = []
    defaultPath = r"/.minecraft/config/triumph/script/triumph/"

    def __init__(self):
        self.removeDefaultFilter.append(self.modpack)

class triumphQuests(enderlib):

    ending = ".txt"

    QUESTLIST = {
        'chapter0': {
            'root': {
                #filename // title // description // icon // background // unlock [criteriaType,criteria]
                'root': ["Title chapter0", "welcome to a new pack", "<minecraft:furnace>", "minecraft:textures/blocks/dirt.png", ["location", "minecraft:location"]]
            },
            'items': {
                #filename // title // description // type [TASK,CHALLENGE,GOAL] // parents {chapter : name}// items
                'flint': ['Feuerstein', 'Sammel Feuerstein!', 'TASK', {'chapter0':['root']}, ['<minecraft:flint>']],
                'stick': ['Stöcker', 'Sammel Stöcker!', 'CHALLENGE', {'chapter0':['flint'],'chapter1':['root']}, ['<minecraft:stick>','<minecraft:cobblestone>']],
            }
        },
        'chapter1': {
            'root': {
                'root': ["TestTest","testtesttest","<minecraft:cobblestone>","minecraft:textures/blocks/dirt.png", ["location", "minecraft:location"]]
            },
            'items': {

            }
        }
    }

    def getElement(chapter,category,name,index):
        return triumphQuests.QUESTLIST[chapter][category][name][index]

    def getChapters():
        return triumphQuests.QUESTLIST.keys()
    
    def getCategories(chapter):
        return triumphQuests.QUESTLIST[chapter].keys()

    def getEntries(chapter,category):
        return triumphQuests.QUESTLIST[chapter][category].items()

class triumphRoot(triumphQuests):

    name = "root"
    category  = "root"
    toast = "false"
    chat = "false"

    def __init__(self, chapter):
        self.chapter = chapter
        self.title = triumphQuests.getElement(self.chapter,self.category,self.name,0)
        self.localize = triumphQuests.getElement(self.chapter,self.category,self.name,1)
        self.icon = triumphQuests.getElement(self.chapter,self.category,self.name,2)
        self.background = triumphQuests.getElement(self.chapter,self.category,self.name,3)
        self.unlock = triumphQuests.getElement(self.chapter,self.category,self.name,4)

class triumphItems(triumphQuests):

    requirements = "all"
    
    def __init__(self, chapter, category, name):
        self.chapter = chapter
        self.category = category
        self.name = name
        self.localize = triumphQuests.getElement(self.chapter,self.category,self.name,0)
        self.description = triumphQuests.getElement(self.chapter,self.category,self.name,1)
        self.face = triumphQuests.getElement(self.chapter,self.category,self.name,2)
        self.parents = triumphQuests.getElement(self.chapter,self.category,self.name,3)
        self.content = triumphQuests.getElement(self.chapter,self.category,self.name,4)
        self.icon = self.content[0]

def createObject(chapter,category,name):
    """creates triumphObjects"""
    if (category == 'items'):
        return triumphItems(chapter,category,name)
    if (category == 'root'):
        return triumphRoot(chapter)

def removeDefaultFiles(check,keep):
    """function to remove the ununsed examples of triumph"""
    for d in os.listdir(completePath(triumphOptions.defaultPath)):
        if d not in keep:
            shutil.rmtree(completePath(triumphOptions.defaultPath+"/"+d))

def registerQuest(file,quest):
    """registers a new quest depending on the quest category"""
    if (quest.category == "root"):
        file.write(
            """
            setIcon({})
            setTitle("{}")
            setDescription("{}")
            setBackground("{}")
            setShowToast({})
            setAnnounceToChat({})
            addCriteria("{}", "{}")
            """.format(
                quest.icon,
                quest.title,
                quest.localize,
                quest.background,
                quest.toast,
                quest.chat,
                quest.unlock[0],
                quest.unlock[1]
            ).replace("    ","")
        )
    elif (quest.category == "items"):
        file.write(
            """
            setIcon({})
            setTitle("{}")
            setDescription("{}")
            setFrameType("{}")
            setRequirements({})
            setRequiresParents()
            drawDirectLines()
            """.format(
                quest.icon,
                quest.localize,
                quest.description,
                quest.face,
                quest.requirements
            ).replace("    ","")
            
        )
        for chapter in quest.parents.keys():
            for name in quest.parents[chapter]:
                file.write(
                    """
                    addParent("triumph:{}/{}/{}")
                    """.format(
                        triumphOptions.modpack,
                        chapter,
                        name
                    ).replace("    ","")
                )
        index = 0
        for item in quest.content:
            file.write(
                """
                criteria_{} = addCriteria("obtain {}", "minecraft:inventory_changed")
                criteria_{}.addItem({})
                """.format(
                    str(index),
                    item.replace("<","").replace(">",""),
                    str(index),
                    item
                ).replace("    ","")
            )
            index += 1

def runTriumphGenerator():
    """Triggers the Advancement Generator"""
    removeDefaultFiles(triumphOptions.removeDefaultConfigs,triumphOptions.removeDefaultFilter)
    for chapter in triumphQuests.getChapters():
        checkDirectory(triumphOptions.defaultPath+triumphOptions.modpack+"/"+chapter+"/",triumphOptions.logging)
        if (len(os.listdir(completePath(triumphOptions.defaultPath+triumphOptions.modpack+"/"+chapter+"/"))) >= 1):
            for file in os.listdir(completePath(triumphOptions.defaultPath+triumphOptions.modpack+"/"+chapter+"/")):
                os.remove(completePath(triumphOptions.defaultPath+triumphOptions.modpack+"/"+chapter+"/"+file))
                if (triumphOptions.logging):
                    print("Removed {} in chapter {}".format(file,chapter))
        if not ("root" in triumphQuests.getCategories(chapter)):
            exit("No ROOT entry in chapter {}".format(chapter))
        for category in triumphQuests.getCategories(chapter):
            for name, data in triumphQuests.getEntries(chapter,category):
                quest = createObject(chapter,category,name)
                with open(completePath(triumphOptions.defaultPath+triumphOptions.modpack+"/"+chapter+"/"+quest.name+triumphQuests.ending), "w+", encoding="UTF-8") as f:
                    f.truncate(0)
                    registerQuest(f,quest)
                    if (triumphOptions.logging):
                        print("Generated {}{} in chapter {}".format(quest.name,triumphQuests.ending,chapter))

