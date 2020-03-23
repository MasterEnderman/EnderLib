import os
import shutil

from elib import *
from elib.strings import *
from elib.utils import *

class msOptions(enderlib):

    logging = False;
    removeCoTFiles = False;
    defaultPath = r"/.minecraft/scripts/ContentTweaker/MaterialSystem/"
    fileDefinition = "MS_Definition.zs"
    fileRegistration = "MS_Registration.zs"

    PARTLIST = []

    MATERIALLIST = [ #Custom Materials you want to add have to be specified here
        #Type // Material name // Localized Name // Color (hex) // Crafting(Ingot,Plate),Processing(Dust,Ore),Fluid
        ["metal","aluminum", "Aluminum", "#f76e45", True, True, True],
        ["metal","iron", "Iron", "#808080", True, True, True],
        ["metal","nickel", "Nickel", "#c69da2", True, True, True],
        ["metal","copper", "Copper", "#ff9a1e", True, True, True],
        ["metal","silver", "Silver", "#e2d9ce", True, True, True],
        ["metal","tin", "Tin", "#84a1ce", True, True, True],
        ["metal","iridium", "Iridium", "#d7f2ee", True, True, True],
        ["metal","platinum", "Platinum", "#72cae5", True, True, True],
        ["metal","gold", "Gold", "#ffff00", True, True, True],
        ["metal","lead", "Lead", "#ba87c1", True, True, True],
        ["metal","uranium", "Uranium", "#5db213", True, True, True],
        #Alloy
        ["metal","bronze", "Bronze", "#ECC458", True, False, True],
        ["metal","constantan", "Constantan", "#CD8E7F", True, False, True],
        ["metal","electrum", "Electrum", "#FFEB90", True, False, True],
        ["metal","invar", "Invar", "#BDB7B1", True, False, True],
        ["metal","steel", "Steel", "#9AA3A3", True, False, True],
    ]

class msParts(enderlib):

    partsCrafting = [
        ["block","block"],
        ["nugget","nugget"],
        ["ingot","ingot"],
        ["plate","plate"],
        ["dense_plate","plateDense"],
        ["gear","gear"],
        ["beam","beam"],
        ["bolt","bolt"],
        ["casing","casing"],
        ["rod","rod"],
        ["dust","dust"]
    ]

    partsCraftingCustom = []

    partsProcessing = [
        ["cluster","cluster"],
        ["clump","clump"],
        ["crushed_ore","oreCrushed"],
        ["dirty_dust","dustDirty"],
        ["crystal","crystal"],
        ["shard","shard"],
        ["ore","ore"],
    ]

    partsProcessingCustom = []

    partsGem = [
        ["ore","ore"]
    ]

    partsGemCustom = []

    def __init__(self, name, oreDict, tag):
        self.name = name
        self.oreDict = oreDict
        self.tag = tag

        if (self.tag == "CRAFTING"):
            self.partsCrafting.append([self.name,self.oreDict])
            self.partsCraftingCustom.append([self.name,self.oreDict])
        elif (self.tag == "PROCESSING"):
            self.partsProcessing.append([self.name,self.oreDict])
            self.partsProcessingCustom.append([self.name,self.oreDict])
        elif (self.tag == "GEM"):
            self.partsGem.append([self.name,self.oreDict])
            self.partsGemCustom.append([self.name,self.oreDict])

    def info(self):
        return "Name: {}\noreDict: {}\nTag: {}".format(self.name,self.oreDict,self.tag)

    def getAllCrafting(self):
        return self.partsCrafting
    
    def getAllCraftingCustom(self):
        return self.partsCraftingCustom

    def getAllProcessing(self):
        return self.partsProcessing
    
    def getAllProcessingCustom(self):
        return self.partsProcessingCustom

    def getAllGem(self):
        return self.partsGem
    
    def getAllGemCustom(self):
        return self.partsGemCustom

class msMaterials(enderlib):

    materials = []

    def __init__(self, material, name, localize, color, registerCrafting, registerProcessing, registerFluid):
        self.material = material
        self.name = name
        self.localize = localize
        self.color = color
        self.registerCrafting = registerCrafting
        self.registerProcessing = registerProcessing
        self.registerFluid = registerFluid

        self.materials.append(self.name)

    def info(self):
        return "Type: {}\nName: {}\nColor: {}\n".format(self.material,self.name,self.color)

    def getAllMaterials(self):
        return self.materials

def registerParts(file,array):
    """used to iterate through a list to register custom parts"""
    for i in range(len(array)):
        file.write(
            "var " + array[i][0] + ' = mods.contenttweaker.MaterialSystem.getPartBuilder().setName("' +
            array[i][0] + '").setPartType(mods.contenttweaker.MaterialSystem.getPartType("item")).setOreDictName("' +
            array[i][1] + '").build();\n'
        )
        if (msOptions.logging):
            print("Part: {}\noreDict: {}\n".format(array[i][0],array[i][1]))

def getPartsArray(material):
    """returns a array with all items that should be registered"""
    array = []
    if (material.material == "metal"):
        if material.registerCrafting:
            for entry in msParts.getAllCrafting(msParts):
                array.append(entry[0])
        if material.registerProcessing:
            for entry in msParts.getAllProcessing(msParts):
                array.append(entry[0])
    if (material.material == "gem"):
        for entry in msParts.getAllGem(msParts):
            array.append(entry[0])
    return array

def removeCoT():
    """Removes the files generated ContentTweaker"""
    shutil.rmtree(completePath("/.minecraft/config/acronym/saved/"))
    if (msOptions.logging):
        print("Removed CoT Files")

MS_Definition = """#priority 100000
#loader contenttweaker

import mods.contenttweaker.Color;
import mods.contenttweaker.Material;
import mods.contenttweaker.MaterialPartData;
import mods.contenttweaker.MaterialSystem;

print("Loading MS_Definition");\n
"""

MS_Registration = """#priority 99999
#loader contenttweaker

import mods.contenttweaker.Material;
import mods.contenttweaker.MaterialPartData;
import mods.contenttweaker.MaterialSystem;

import scripts.ContentTweaker.MaterialSystem.MS_Definition.addDefaultMoltenData;
import scripts.ContentTweaker.MaterialSystem.MS_Definition.addDefaultOreData;
import scripts.ContentTweaker.MaterialSystem.MS_Definition.materials;

print("Loading MS_Registration");\n
"""

funtions = """function addDefaultMoltenData(moltenData as MaterialPartData) {
	moltenData.addDataValue("density", "4000");
	moltenData.addDataValue("viscosity", "3000");
	moltenData.addDataValue("temperature", "1500");
	moltenData.addDataValue("vaporize", "false");
}

function addDefaultOreData(oreData as MaterialPartData) {
	oreData.addDataValue("variants", "minecraft:stone");
	oreData.addDataValue("hardness", "5");
	oreData.addDataValue("resistance", "15");
	oreData.addDataValue("harvestTool", "pickaxe");
	oreData.addDataValue("harvestLevel", "1");
}
"""

space = "    "

def runCoTMS():
    """Triggers the CoT_MS Generator"""

    if (msOptions.removeCoTFiles):
        removeCoT()

    checkDirectory(msOptions.defaultPath,msOptions.logging)

    if len(msOptions.PARTLIST) > 0:
        for part in msOptions.PARTLIST:
            msParts(part[0],part[1],part[2])

    with open(completePath(msOptions.defaultPath+msOptions.fileDefinition), "w+", encoding="UTF-8") as f:
        f.truncate(0)
        f.write(
            MS_Definition
        )
        registerParts(f,msParts.getAllCraftingCustom(msParts))
        registerParts(f,msParts.getAllProcessingCustom(msParts))
        registerParts(f,msParts.getAllGemCustom(msParts))
        if len(msOptions.MATERIALLIST) > 0:
            f.write(
                "\nstatic materials as Material[string] = {\n"
            )
            for entry in msOptions.MATERIALLIST:
                material = msMaterials(entry[0],entry[1],entry[2],entry[3],entry[4],entry[5],entry[6])
                if material.name == msOptions.MATERIALLIST[-1][1]:
                    f.write(
                        space+'"'+material.name+'": MaterialSystem.getMaterialBuilder().setName("'+
                        material.localize+'").setColor('+str(int(material.color.replace(r"#",""),16))+
                        ').build()\n'
                    )
                else:
                    f.write(
                        space+'"'+material.name+'": MaterialSystem.getMaterialBuilder().setName("'+
                        material.localize+'").setColor('+str(int(material.color.replace(r"#",""),16))+
                        ').build(),\n'
                    )
                if (msOptions.logging):
                    print(material.info())
            f.write(
                "};\n"
            )
        f.write(
            "\n"+funtions
        )

    with open(completePath(msOptions.defaultPath+msOptions.fileRegistration), "w+", encoding="UTF-8") as f:
        f.truncate(0)
        f.write(MS_Registration)
        for entry in msOptions.MATERIALLIST:
            material = msMaterials(entry[0],entry[1],entry[2],entry[3],entry[4],entry[5],entry[6])
            f.write(
                "\n//"+material.name+"\n\n"
            )
            partRegister = getPartsArray(material)
            if ("ore" in partRegister):
                f.write(
                    "var " + material.name+"OreData as MaterialPartData = " +
                    "materials." + material.name+'.registerPart("ore").getData();\n'
                )
                f.write(
                    "addDefaultOreData(" + material.name + "OreData);\n\n"
                )
                partRegister.remove("ore")
            if (material.registerFluid):
                f.write(
                    "var " + material.name + "FluidData as MaterialPartData = " +
                    "materials." + material.name + '.registerPart("molten").getData();\n'
                )
                f.write(
                    "addDefaultMoltenData(" + material.name + "FluidData);\n\n"
                )
            if len(partRegister) > 0:
                f.write(
                    'materials.' + material.name+'.registerParts(' +
                    str(partRegister).replace("'", '"') + ' as string[]);\n'
                )
