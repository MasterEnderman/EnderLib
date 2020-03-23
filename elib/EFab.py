import os
import shutil

from elib import *
from elib.strings import *
from elib.utils import *

class efabOptions(enderlib):

    logging = False
    defaultPath = r"/.minecraft/scripts/EFab/"
    priority = 100

class efabRecipe(enderlib):

    MAP = {
        "chapter0": {
            "minecraft:cobblestone": {
                "amount": 3,
                "energy": 10,
                "time": 20,
                "tier": ["UPGRADE_ARMORY","GEARBOX","COMPUTING"],
                "fluid": {
                    "water": 200,
                    "lava": 120
                },
                "recipe": [
                    ["null","minecraft:stick","null"],
                    ["minecraft:cobblestone","minecraft:furnace","null"],
                    ["minecraft:stone:2","ore:gearIron","null"]
                ]
            }
        }
    }

    TIERS = [
        "STEAM",
        "GEARBOX",
        "ADVANCED_GEARBOX",
        "RF",
        "LIQUID",
        "MANA",
        "COMPUTING",
        "UPGRADE_ARMORY",
        "UPGRADE_MAGIC",
        "UPGRADE_POWER",
        "UPGRADE_DIGITAL"
    ]

    def __init__(self, file, output):

        self.file   =   file
        self.output =   output
        
        if ("recipe" in self.mapKeys(file,output)):
            self.recipe =   self.mapData(file,output,"recipe")

        if ("fluid" in self.mapKeys(file,output)):
            self.fluid  =   self.mapData(file,output,"fluid")

        if ("amount" in self.mapKeys(file,output)):
            self.amount =   self.mapData(file,output,"amount")

        if ("energy" in self.mapKeys(file,output)):
            self.energy =   self.mapData(file,output,"energy")

        if ("time" in self.mapKeys(file,output)):
            self.time   =   self.mapData(file,output,"time")

        if ("tier" in self.mapKeys(file,output)):
            self.tier   =   self.mapData(file,output,"tier")

        if ("mana" in self.mapKeys(file,output)):
            self.mana   =   self.mapData(file,output,"mana")

    def mapKeys(self,file,output):
        """Returns all keys of an output"""
        return self.MAP[file][output].keys()

    def mapData(self,file,output,key):
        """Returns data from a key"""
        return self.MAP[file][output][key]

    def getAttributes(self):
        """Returns all keys of an object"""
        return self.__dict__.keys()

    def getDataFromAttribute(self,attribute):
        """Returns the data for a specific Attribute"""
        if attribute in self.getAttributes():
            return self.__getattribute__(attribute)
        else:
            print(
                "Can't find {} Attribute in {}!"
                    .format(attribute,self)
            )

    def registerAttribute(self,file,attribute):
        """Checks the given Attribute and registers it"""
        if attribute in self.getAttributes():
            if (attribute == "recipe"):
                self.registerAttributeRecipe(file)
            if (attribute == "time"):
                self.registerAttributeTime(file)
            if (attribute == "tier"):
                self.registerAttributeTier(file)
            if (attribute == "energy"):
                self.registerAttributeEnergy(file)
            if (attribute == "mana"):
                self.registerAttributeMana(file)
            if (attribute == "fluid"):
                self.registerAttributeFluid(file)

    def registerAttributeRecipe(self,file):
        """Registers recipe attribute"""
        string = "EFabRecipe.shaped({} * {},{})"
        if ("amount" in self.getAttributes()):
            new_string = string.format(
                self.getDataFromAttribute("output"),
                self.getDataFromAttribute("amount"),
                self.getDataFromAttribute("recipe")
            )
        else:
            new_string = string.format(
                self.getDataFromAttribute("output"),
                1,
                self.getDataFromAttribute("recipe")
            )
        file.write(
            new_string.replace("'","").replace("[[","[\n    [").replace("], ","]\n    ")
        )

    def registerAttributeTime(self,file):
        """Registers time attribute"""
        file.write(
            "\n    .time({})".format(self.getDataFromAttribute("time"))
        )

    def registerAttributeTier(self,file):
        """Regsiters tier attribute"""
        for entry in self.getDataFromAttribute("tier"):
            if entry.upper() in self.TIERS:
                file.write(
                    '\n    .tier("{}")'.format(entry.upper())
                )
            else:
                print("Can't find tier {}!".format(entry))

    def registerAttributeEnergy(self,file):
        """Registers energy attribute"""
        file.write(
            "\n    .rfPerTick({})".format(self.getDataFromAttribute("energy"))
        )

    def registerAttributeMana(self,file):
        """Registers mana attribute"""
        file.write(
            "\n    .manaPerTick({})".format(self.getDataFromAttribute("mana"))
        )

    def registerAttributeFluid(self,file):
        """Registers fluid attribute"""
        for fluid, amount in self.getDataFromAttribute("fluid").items():
            file.write(
                "\n    .fluid(<liquid:{}> * {})".format(fluid,amount)
            )
                
def runEFab():
    """Triggers the EFab script generator"""
    for file in efabRecipe.MAP.keys():
        with open(completePath(efabOptions.defaultPath+file+".zs"), "w+", encoding="UTF-8") as f:
            f.write(
                "#modloaded efab efabct\n#priority {}\n\nimport mods.efabct.EFabRecipe;\n\n"
                    .format(efabOptions.priority)
            )
            for output in efabRecipe.MAP[file].keys():
                recipe = efabRecipe(file,output)
                for att in recipe.getAttributes():
                    recipe.registerAttribute(f,att)
                    if efabOptions.logging:
                        print("{} : {}".format(att,recipe.getDataFromAttribute(att)))
                f.write(";\n\n")