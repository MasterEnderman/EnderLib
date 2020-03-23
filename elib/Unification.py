import os
import shutil

from elib import *
from elib.strings import *
from elib.utils import *

class unificationOptions(enderlib):

    logging = False
    defaultPath = r"/.minecraft/scripts/_UNIFICATION/"
    compatPath = r"/mod_compat/"
    prefix = "_UNIFICATION_"
    priority = 10000

    class master(enderlib):
        
        master = True
        removeRecipes = True
        furnace = True
        crafting = True

    class tools(enderlib):

        useTools = False

    class jei(enderlib):

        master = True
        ores = True

    class immersiveengineering(enderlib):

        master = True
        slagItem = "immersiveengineering:material:7"

        class crusher(enderlib):

            remove = True
            add = True
            energy = 2048
            multiplier = 2

        class kiln(enderlib):

            remove = True
            add = True
            time = 200

        class metalPress(enderlib):

            remove = True
            add = True
            energy = 1024

            class moldPlate(enderlib):

                item = "immersiveengineering:mold:0"
                amountIn = 1
                amountOut = 1

            class moldStick(enderlib):

                item = "immersiveengineering:mold:2"
                amountIn = 1
                amountOut = 2

            class moldGear(enderlib):

                item = "immersiveengineering:mold:1"
                amountIn = 4
                amountOut = 1
        
        class arcFurnace(enderlib):
            
            remove = True
            add = True
            energy = 512

            class smelt(enderlib):

                add = True
                time = 100

            class ore(enderlib):

                add = True
                time = 200
                multiplier = 2

            class steel(enderlib):

                add = True
                time = 400

            class alloy(enderlib):

                add = True
                time = 200

        class blastFurnace(enderlib):

            remove = True
            add = True
            time = 1200

    class tconstruct(enderlib):

        master = True
        remove = True
        add = True

        class cast(enderlib):

            remove = True
            add = True

            gear = "tconstruct:cast_custom:4"
            plate = "tconstruct:cast_custom:3"
            nugget = "tconstruct:cast_custom:1"
            ingot = "tconstruct:cast_custom"

        class multiplier(enderlib):

            gear = 4
            plate = 1

class unificationSettings(enderlib):
    PRIORITIES = {
        "contenttweaker" : 1000,
        "minecraft" : 900,
        "immersiveengineering" : 800,
        "ic2" : 700,
        "gregtech" : 950
    }

    METALS = [
        "iron",
        "gold",
        "steel",
        "copper",
        "bronze",
        "invar",
        "nickel",
        "aluminum",
        "tin",
        "silver",
        "lead",
        "iridium",
        "platinum",
        "constantan",
        "electrum",
        "uranium",
    ]

    ALLOY = {
        "invar" : {
            "iron" : 2,
            "nickel" : 1
        },
        "bronze" : {
            "copper" : 3,
            "tin" : 1
        },
        "constantan" : {
            "copper" : 1,
            "nickel" : 1
        },
        "electrum" : {
            "gold" : 1,
            "silver" : 1
        }
    }

    TOOLS = {
        "UNI_wrench" : "<base:wrench>.reuse()"
    }

    TYPES = {
        "ingot" : {
            1 : [
                [
                    ["nugget","nugget","nugget"],
                    ["nugget","nugget","nugget"],
                    ["nugget","nugget","nugget"]
                ]
            ],
            9 : [
                [
                    ["block"]
                ]
            ]
        },
        "plate" : {
            1 : [
                [
                    ["ingot","ingot"],
                    ["ingot","ingot"]
                ],
                [
                    ["UNI_hammer"],
                    ["ingot"],
                    ["ingot"]
                ]
            ]
        },
        "gear" : {
            1 : [
                [
                    ["stick","plate","stick"],
                    ["plate","UNI_wrench","plate"],
                    ["stick","plate","stick"]
                ]
            ]
        },
        "stick" : {
            4 : [
                [
                    ["ingot"],
                    ["ingot"]
                ]
            ]
        },
        "dust" : {
            1 : [
                [
                    ["UNI_hammer"],
                    ["ingot"]
                ],
                [
                    ["dirtyDust"],
                    ["FLUID_water"]
                ]
            ]
        },
        "nugget" : {
            9 : [
                [
                    ["ingot"]
                ]
            ]
        },
        "block" : {
            1 : [
                [
                    ["ingot","ingot","ingot"],
                    ["ingot","ingot","ingot"],
                    ["ingot","ingot","ingot"]
                ]
            ]
        },
        "plateDense" : {
            1 : [
                [
                    ["plate","plate","plate"],
                    ["plate","plate","plate"],
                    ["plate","plate","plate"]
                ]
            ]
        },
        "casing" : {
            2 : [
                [
                    ["UNI_hammer"],
                    ["plate"]
                ]
            ]
        },
        "beam" : {
            1 : [
                [
                    ["null","stick","plate"],
                    ["stick","plate","stick"],
                    ["plate","stick","null"]
                ]
            ]
        },
        "bolt" : {
            4 : [
                [
                    ["UNI_hammer"],
                    ["plate"],
                    ["stick"]
                ]
            ]
        },
        "dirtyDust" : {
            2 : [
                [
                    ["UNI_hammer"],
                    ["ore"]
                ]
            ]
        }
    }

class unificationFunctions(enderlib):

    liquidToIngotRatio = 144

class unificationTools(enderlib):

    TOOLS = {
        "hammer" : {
            "name" : "Hammer",
            "durability" : 20,
            "use" : 1
        }
    }

    def __init__(self,tag,data):
        if len(data.keys()) == 3:
            self.tag = tag
            self.name = data["name"]
            self.durability = data["durability"]
            self.use = data["use"]
            self.TOOLS.update({
                self.tag : {
                    "name" : self.name,
                    "durability" : self.durability,
                    "use" : self.use
                }
            })
        else:
            print("Not enough data!")
            exit()

def generateTools():
    """Creates tools.zs"""
    with open(completePath(unificationOptions.defaultPath+unificationOptions.prefix+"tools.zs"), "w+", encoding="UTF-8") as f:
        f.write(
            stringsUnificationTools.head.format(
                unificationOptions.priority
            )
        )
        for tool in unificationTools.TOOLS.keys():
            if unificationTools.TOOLS[tool]["use"] <= 0:
                unificationSettings.TOOLS.update(
                    {
                        "UNI_{}".format(tool) : "<contenttweaker:{}>.reuse()".format(
                            tool
                        )
                    }
                )
            else:
                unificationSettings.TOOLS.update(
                    {
                        "UNI_{}".format(tool) : "<contenttweaker:{}>.transformDamage({})".format(
                            tool,unificationTools.TOOLS[tool]["use"]
                        )
                    }
                )
            if unificationTools.TOOLS[tool]["durability"] <= 0:
                f.write(
                    stringsUnificationTools.bodyInfinite.format(
                        tool,
                        tool,
                        tool,
                        unificationTools.TOOLS[tool]["name"],
                        tool
                    )
                )
            else:
                f.write(
                    stringsUnificationTools.bodyFinite.format(
                        tool,
                        tool,
                        tool,
                        unificationTools.TOOLS[tool]["name"],
                        tool,
                        unificationTools.TOOLS[tool]["durability"],
                        tool
                    )
                )

def generateSettings():
    """Creates settings.zs"""
    generateTools()
    with open(completePath(unificationOptions.defaultPath+unificationOptions.prefix+"settings.zs"), "w+", encoding="UTF-8") as f:
        f.write(
            stringsUnificationSettings.head.format(
                unificationOptions.priority+1,
                str(unificationSettings.PRIORITIES)
                    .replace(", '",",\n    '")
                    .replace("{","{\n    ")
                    .replace("}","\n}")
                    .replace(": "," : ")
            )
            + "global metalsToUnify as string[] = {};\n\n".format(
                str(unificationSettings.METALS)
                    .replace("[","[\n    ")
                    .replace(", ",",\n    ")
                    .replace("]","\n]")
            )
            + "global alloyDict as int[string][string] = {};\n\n".format(
                str(unificationSettings.ALLOY)
                    .replace("{'","{\n    '",1)
                    .replace("}, ","\n    },\n    ")
                    .replace(": {",": {\n        ")
                    .replace(", ",",\n        ")
                    .replace("}}","\n    }\n}")
                    .replace(": "," : ")
            )
            + "global unificationTools as IIngredient[string] = {};\n\n".format(
                str(unificationSettings.TOOLS)
                    .replace("{","{\n    ")
                    .replace(", ",",\n    ")
                    .replace("}","\n}")
                    .replace("'<","<")
                    .replace(">'",">")
                    .replace(")'",")")
                    .replace(": "," : ")
            )
            + "global typesToUnify as string[][][][int][string] = {};\n\n".format(
                str(unificationSettings.TYPES)
                    .replace("{'","{\n    '",1)
                    .replace("]}}","]\n    }\n}",1)
                    .replace(": "," : ")
                    .replace(": {",": {\n        ")
                    .replace("},","\n    },\n   ")
                    .replace("[['","\n            [\n                ['")
                    .replace("']]","']\n            ]")
                    .replace("]]","]\n        ]")
                    .replace("'], ['","'],\n                ['")
                    .replace("], ","],\n        ")
            )
        )

def generateScript():
    """Creates script.zs"""
    with open(completePath(unificationOptions.defaultPath+unificationOptions.prefix+"script.zs"), "w+", encoding="UTF-8") as f:
        f.write(
            stringsUnificationScript.head.format(
                unificationOptions.priority-1,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix
            ) + stringsUnificationScript.body
        )

def generateFunctions():
    """Generates functions.zs"""
    with open(completePath(unificationOptions.defaultPath+unificationOptions.prefix+"functions.zs"), "w+", encoding="UTF-8") as f:
        f.write(
            stringsUnificationFunctions.head.format(
                unificationOptions.priority+1,
                unificationOptions.prefix,
                unificationFunctions.liquidToIngotRatio
            ) + stringsUnificationFunctions.body
        )

def generateOptions():
    """Generates options.zs"""
    with open(completePath(unificationOptions.defaultPath+unificationOptions.prefix+"options.zs"), "w+", encoding="UTF-8") as f:
        f.write(
            (
                stringsUnificationOptions.head.format(
                    unificationOptions.priority+1
                )
                + stringsUnificationOptions.master.format(
                    unificationOptions.master.master,
                    unificationOptions.master.removeRecipes,
                    unificationOptions.master.furnace,
                    unificationOptions.master.crafting
                )
                + stringsUnificationOptions.tools.format(
                    unificationOptions.tools.useTools
                )
                + stringsUnificationOptions.jei.format(
                    unificationOptions.jei.master,
                    unificationOptions.jei.ores
                )
                + stringsUnificationOptions.immersiveengineering.format(
                    unificationOptions.immersiveengineering.master,
                    unificationOptions.immersiveengineering.slagItem,
                    unificationOptions.immersiveengineering.crusher.remove,
                    unificationOptions.immersiveengineering.crusher.add,
                    unificationOptions.immersiveengineering.crusher.energy,
                    unificationOptions.immersiveengineering.crusher.multiplier,
                    unificationOptions.immersiveengineering.kiln.remove,
                    unificationOptions.immersiveengineering.kiln.add,
                    unificationOptions.immersiveengineering.kiln.time,
                    unificationOptions.immersiveengineering.metalPress.remove,
                    unificationOptions.immersiveengineering.metalPress.add,
                    unificationOptions.immersiveengineering.metalPress.energy,
                    unificationOptions.immersiveengineering.metalPress.moldPlate.item,
                    unificationOptions.immersiveengineering.metalPress.moldPlate.amountIn,
                    unificationOptions.immersiveengineering.metalPress.moldPlate.amountOut,
                    unificationOptions.immersiveengineering.metalPress.moldStick.item,
                    unificationOptions.immersiveengineering.metalPress.moldStick.amountIn,
                    unificationOptions.immersiveengineering.metalPress.moldStick.amountOut,
                    unificationOptions.immersiveengineering.metalPress.moldGear.item,
                    unificationOptions.immersiveengineering.metalPress.moldGear.amountIn,
                    unificationOptions.immersiveengineering.metalPress.moldGear.amountOut,
                    unificationOptions.immersiveengineering.arcFurnace.remove,
                    unificationOptions.immersiveengineering.arcFurnace.add,
                    unificationOptions.immersiveengineering.arcFurnace.energy,
                    unificationOptions.immersiveengineering.arcFurnace.smelt.add,
                    unificationOptions.immersiveengineering.arcFurnace.smelt.time,
                    unificationOptions.immersiveengineering.arcFurnace.ore.add,
                    unificationOptions.immersiveengineering.arcFurnace.ore.time,
                    unificationOptions.immersiveengineering.arcFurnace.ore.multiplier,
                    unificationOptions.immersiveengineering.arcFurnace.steel.add,
                    unificationOptions.immersiveengineering.arcFurnace.steel.time,
                    unificationOptions.immersiveengineering.arcFurnace.alloy.add,
                    unificationOptions.immersiveengineering.arcFurnace.alloy.time,
                    unificationOptions.immersiveengineering.blastFurnace.remove,
                    unificationOptions.immersiveengineering.blastFurnace.add,
                    unificationOptions.immersiveengineering.blastFurnace.time
                )
                + stringsUnificationOptions.tconstruct.format(
                    unificationOptions.tconstruct.master,
                    unificationOptions.tconstruct.remove,
                    unificationOptions.tconstruct.add,
                    unificationOptions.tconstruct.cast.remove,
                    unificationOptions.tconstruct.cast.add,
                    unificationOptions.tconstruct.cast.gear,
                    unificationOptions.tconstruct.cast.plate,
                    unificationOptions.tconstruct.cast.nugget,
                    unificationOptions.tconstruct.cast.ingot,
                    unificationOptions.tconstruct.multiplier.gear,
                    unificationOptions.tconstruct.multiplier.plate
                )
            ).replace("True","true").replace("False","false")
        )

def generateModCompat():
    """Generates mod compat files"""
    checkDirectory(unificationOptions.defaultPath+unificationOptions.compatPath,unificationOptions.logging)
    generateIE()
    generateJEI()
    generateTiCo()

def generateIE():
    """Generates IE compat files"""
    with open(completePath(unificationOptions.defaultPath+unificationOptions.compatPath+unificationOptions.prefix+"IE.zs"), "w+", encoding="UTF-8") as f:
        f.write(
            stringsUnificationCompat.immersiveengineering.head.format(
                unificationOptions.priority-1,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix
            )
            + stringsUnificationCompat.immersiveengineering.body
        )

def generateJEI():
    """Generates JEI compat files"""
    with open(completePath(unificationOptions.defaultPath+unificationOptions.compatPath+unificationOptions.prefix+"JEI.zs"), "w+", encoding="UTF-8") as f:
        f.write(
            stringsUnificationCompat.jei.head.format(
                unificationOptions.priority-1,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix
            )
            + stringsUnificationCompat.jei.body
        )

def generateTiCo():
    """Generates TiCo compat files"""
    with open(completePath(unificationOptions.defaultPath+unificationOptions.compatPath+unificationOptions.prefix+"TiCo.zs"), "w+", encoding="UTF-8") as f:
        f.write(
            stringsUnificationCompat.tconstruct.head.format(
                unificationOptions.priority-1,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix,
                unificationOptions.prefix
            )
            + stringsUnificationCompat.tconstruct.body
        )

def runUnification():
    """Creates all UNIFICATION scripts"""
    checkDirectory(unificationOptions.defaultPath,unificationOptions.logging)
    generateScript()
    generateFunctions()
    generateOptions()
    generateSettings()
    generateModCompat()
    