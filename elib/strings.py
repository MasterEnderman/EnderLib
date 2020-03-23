from elib import *

class strings(enderlib):
    pass

class stringsUnification(strings):
    pass

class stringsUnificationSettings(stringsUnification):
    head = """#priority {}

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

global modPriority as int[string] = {};\n\n"""

class stringsUnificationTools(stringsUnification):
    head = """#loader contenttweaker
#priority {}

import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Fluid;
import mods.contenttweaker.Color;
import mods.contenttweaker.Item;
import mods.contenttweaker.LocalizedNameSupplier;
import mods.contenttweaker.ResourceLocation;\n\n"""

    bodyFinite = """var {} as Item = VanillaFactory.createItem("{}");
{}.setLocalizedNameSupplier(function(itemStack) {{return "{}";}});
{}.maxDamage = {};
{}.register();\n\n"""

    bodyInfinite = """var {} as Item = VanillaFactory.createItem("{}");
{}.setLocalizedNameSupplier(function(itemStack) {{return "{}";}});
{}.register();\n\n"""

class stringsUnificationCompat(stringsUnification):

    class jei(stringsUnification):
        head = """#modloaded jei
#priority {}

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

import mods.jei.JEI;

import scripts._UNIFICATION.{}functions.getOreDict;
import scripts._UNIFICATION.{}functions.getModlist;
import scripts._UNIFICATION.{}functions.findFirstItem;

import scripts._UNIFICATION.{}options.JEIMASTER;
import scripts._UNIFICATION.{}options.JEIOres;\n\n"""

        body = """if (JEIMASTER) {
    cleanJEI(getModlist());
}

function cleanJEI(modlist as string[]) {
    for metal in metalsToUnify {
        for type in typesToUnify.keys {
            jeiHide(findFirstItem(modlist,type,metal),type,metal);
        }
        if (JEIOres) {
            jeiHide(findFirstItem(modlist,"ore",metal),"ore",metal);
        }
    }
}

function jeiHide(filter as IItemStack, type as string, metal as string) {
    for item in getOreDict(type,metal).items {
        if (item.definition.owner != filter.definition.owner) {
            JEI.removeAndHide(item);
        }
    }  
}"""

    class tconstruct(stringsUnification):
        head = """#modloaded modtweaker tconstruct
#priority {}

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

import mods.tconstruct.Alloy;
import mods.tconstruct.Casting;
import mods.tconstruct.Melting;

import scripts._UNIFICATION.{}functions.getFluid;
import scripts._UNIFICATION.{}functions.getOreDict;
import scripts._UNIFICATION.{}functions.getModlist;
import scripts._UNIFICATION.{}functions.getItemString;
import scripts._UNIFICATION.{}functions.findFirstItem;

import scripts._UNIFICATION.{}options.TiCoMASTER;

import scripts._UNIFICATION.{}options.TiCoRemoveRecipes;
import scripts._UNIFICATION.{}options.TiCoAddRecipes;

import scripts._UNIFICATION.{}options.TiCoCastRemoveRecipes;
import scripts._UNIFICATION.{}options.TiCoCastAddRecipes;

import scripts._UNIFICATION.{}options.TiCoCastGear;
import scripts._UNIFICATION.{}options.TiCoCastPlate;
import scripts._UNIFICATION.{}options.TiCoCastNugget;
import scripts._UNIFICATION.{}options.TiCoCastIngot;

import scripts._UNIFICATION.{}options.TiCoMultiplierGear;
import scripts._UNIFICATION.{}options.TiCoMultiplierPlate;\n\n"""

        body = """if (TiCoMASTER) {
    removeTiCoRecipes();
    addTiCoCastingRecipes(getModlist());
}

function removeTiCoRecipes() {
    for metal in metalsToUnify {
        if (TiCoRemoveRecipes & TiCoCastRemoveRecipes) {
            for type in typesToUnify.keys {
                for item in getOreDict(type,metal).items {
                    if (type == "block") {
                        Casting.removeBasinRecipe(item);
                    }
                    if (type == "ingot" | type == "gear" | type == "plate" | type == "nugget") {
                        Casting.removeTableRecipe(item);
                    }
                }
            }
        }
    }
}

function addTiCoCastingRecipes(modlist as string[]) {
    for metal in metalsToUnify {
        if (TiCoAddRecipes & TiCoCastAddRecipes) {
            Casting.addBasinRecipe(
                findFirstItem(modlist,"block",metal),
                null,
                getFluid(metal),
                unification_liquidToIngot * 9
            );
            Casting.addTableRecipe(
                findFirstItem(modlist,"ingot",metal),
                getItemString(TiCoCastIngot),
                getFluid(metal),
                unification_liquidToIngot
            );
            Casting.addTableRecipe(
                findFirstItem(modlist,"nugget",metal),
                getItemString(TiCoCastNugget),
                getFluid(metal),
                unification_liquidToIngot / 9
            );
            Casting.addTableRecipe(
                findFirstItem(modlist,"plate",metal),
                getItemString(TiCoCastPlate),
                getFluid(metal),
                unification_liquidToIngot * TiCoMultiplierPlate
            );
            Casting.addTableRecipe(
                findFirstItem(modlist,"gear",metal),
                getItemString(TiCoCastGear),
                getFluid(metal),
                unification_liquidToIngot * TiCoMultiplierGear
            );
        }
    }
}"""
    
    class immersiveengineering(stringsUnification):
        head = """#modloaded immersiveengineering
#priority {}

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

import mods.immersiveengineering.AlloySmelter;
import mods.immersiveengineering.ArcFurnace;
import mods.immersiveengineering.BlastFurnace;
import mods.immersiveengineering.Crusher;
import mods.immersiveengineering.MetalPress;

import scripts._UNIFICATION.{}functions.getOreDict;
import scripts._UNIFICATION.{}functions.getModlist;
import scripts._UNIFICATION.{}functions.getItemString;
import scripts._UNIFICATION.{}functions.findFirstItem;

import scripts._UNIFICATION.{}options.IEMASTER;

import scripts._UNIFICATION.{}options.IESlagItem;

import scripts._UNIFICATION.{}options.IEArcFurnaceRemoveRecipes;
import scripts._UNIFICATION.{}options.IEArcFurnaceAddRecipes;
import scripts._UNIFICATION.{}options.IEArcFurnaceEnergy;

import scripts._UNIFICATION.{}options.IEArcFurnaceAddSmelt;
import scripts._UNIFICATION.{}options.IEArcFurnaceTimeSmelt;

import scripts._UNIFICATION.{}options.IEArcFurnaceAddOre;
import scripts._UNIFICATION.{}options.IEArcFurnaceTimeOre;
import scripts._UNIFICATION.{}options.IEArcFurnaceMultiplierOre;

import scripts._UNIFICATION.{}options.IEArcFurnaceAddSteel;
import scripts._UNIFICATION.{}options.IEArcFurnaceTimeSteel;

import scripts._UNIFICATION.{}options.IEArcFurnaceAddAlloy;
import scripts._UNIFICATION.{}options.IEArcFurnaceTimeAlloy;

import scripts._UNIFICATION.{}options.IEBlastFurnaceRemoveRecipes;
import scripts._UNIFICATION.{}options.IEBlastFurnaceAddRecipes;
import scripts._UNIFICATION.{}options.IEBlastFurnaceTime;

import scripts._UNIFICATION.{}options.IECrusherRemoveRecipes;
import scripts._UNIFICATION.{}options.IECrusherAddRecipes;
import scripts._UNIFICATION.{}options.IECrusherEnergy;
import scripts._UNIFICATION.{}options.IECrusherMultiplier;

import scripts._UNIFICATION.{}options.IEKilnRemoveRecipes;
import scripts._UNIFICATION.{}options.IEKilnAddRecipes;
import scripts._UNIFICATION.{}options.IEKilnTime;

import scripts._UNIFICATION.{}options.IEMetalPressRemoveRecipes;
import scripts._UNIFICATION.{}options.IEMetalPressAddRecipes;
import scripts._UNIFICATION.{}options.IEMetalPressEnergy;

import scripts._UNIFICATION.{}options.IEMetalPressMoldPlate;
import scripts._UNIFICATION.{}options.IEMetalPressMoldPlateAmountInput;
import scripts._UNIFICATION.{}options.IEMetalPressMoldPlateAmountOutput;

import scripts._UNIFICATION.{}options.IEMetalPressMoldStick;
import scripts._UNIFICATION.{}options.IEMetalPressMoldStickAmountInput;
import scripts._UNIFICATION.{}options.IEMetalPressMoldStickAmountOutput;

import scripts._UNIFICATION.{}options.IEMetalPressMoldGear;
import scripts._UNIFICATION.{}options.IEMetalPressMoldGearAmountInput;
import scripts._UNIFICATION.{}options.IEMetalPressMoldGearAmountOutput;\n\n"""

        body = """
if (IEMASTER) {
    removeIERecipes();
    addIECrusherRecipes(getModlist());
    addIEKilnRecipes(getModlist());
    addIEMetalPressRecipes(getModlist());
    addIEArcFurnaceRecipes(getModlist());
    addIEBlastFurnaceRecipes(getModlist());
}

function removeIERecipes() {
    for metal in metalsToUnify {
        if (IECrusherRemoveRecipes) {
            for item in getOreDict("dust",metal).items {
                Crusher.removeRecipe(item);
            }
        }
        if (alloyDict.keys in metal & IEKilnRemoveRecipes) {
            for item in getOreDict("ingot",metal).items {
                AlloySmelter.removeRecipe(item);
            }
        }
        if (IEMetalPressRemoveRecipes) {
            for item in getOreDict("plate",metal).items {
                MetalPress.removeRecipe(item);
            }
            for item in getOreDict("stick",metal).items {
                MetalPress.removeRecipe(item);
            }
            for item in getOreDict("gear",metal).items {
                MetalPress.removeRecipe(item);
            }
        }
        if (IEArcFurnaceRemoveRecipes) {
            for item in getOreDict("ingot",metal).items {
                ArcFurnace.removeRecipe(item);
            }
        }
    }
    if (IEBlastFurnaceRemoveRecipes) {
        for item in getOreDict("ingot","steel").items {
            BlastFurnace.removeRecipe(item);
        }
        for item in getOreDict("block","steel").items {
            BlastFurnace.removeRecipe(item);
        }
    }
}

function addIECrusherRecipes(modlist as string[]) {
    for metal in metalsToUnify {
        if (IECrusherAddRecipes) {
            if (getOreDict("ore",metal).items.length >= 1 & getOreDict("dust",metal).items.length >= 1) {
                Crusher.addRecipe(findFirstItem(modlist,"dust",metal) * IECrusherMultiplier,getOreDict("ore",metal),IECrusherEnergy);
            }
            if (getOreDict("ingot",metal).items.length >= 1 & getOreDict("dust",metal).items.length >= 1) {
                Crusher.addRecipe(findFirstItem(modlist,"dust",metal),getOreDict("ingot",metal),IECrusherEnergy);
            }
        }
    }
}

function addIEKilnRecipes(modlist as string[]) {
    for metal in alloyDict.keys {
        var alloyInputs as string[] = [];
        var amount as int = 0;
        for input, quantity in alloyDict[metal] {
            alloyInputs += input;
            amount += quantity;
        }
        if (alloyInputs.length == 2 & IEKilnAddRecipes) {
            AlloySmelter.addRecipe(
                findFirstItem(modlist,"ingot",metal) * amount,
                getOreDict("ingot",alloyInputs[0]) * alloyDict[metal][alloyInputs[0]],
                getOreDict("ingot",alloyInputs[1]) * alloyDict[metal][alloyInputs[1]],
                IEKilnTime
            );
            AlloySmelter.addRecipe(
                findFirstItem(modlist,"ingot",metal) * amount,
                getOreDict("dust",alloyInputs[0]) * alloyDict[metal][alloyInputs[0]],
                getOreDict("dust",alloyInputs[1]) * alloyDict[metal][alloyInputs[1]],
                IEKilnTime
            );
            AlloySmelter.addRecipe(
                findFirstItem(modlist,"ingot",metal) * amount,
                getOreDict("dust",alloyInputs[0]) * alloyDict[metal][alloyInputs[0]],
                getOreDict("ingot",alloyInputs[1]) * alloyDict[metal][alloyInputs[1]],
                IEKilnTime
            );
            AlloySmelter.addRecipe(
                findFirstItem(modlist,"ingot",metal) * amount,
                getOreDict("ingot",alloyInputs[0]) * alloyDict[metal][alloyInputs[0]],
                getOreDict("dust",alloyInputs[1]) * alloyDict[metal][alloyInputs[1]],
                IEKilnTime
            );
        }
    }
}

function addIEMetalPressRecipes(modlist as string[]) {
    for metal in metalsToUnify {
        if (getOreDict("ingot",metal).items.length >= 1 & getOreDict("plate",metal).items.length >= 1 & IEMetalPressAddRecipes) {
            MetalPress.addRecipe(
                findFirstItem(modlist,"plate",metal) * IEMetalPressMoldPlateAmountOutput,
                getOreDict("ingot",metal),
                getItemString(IEMetalPressMoldPlate),
                IEMetalPressEnergy,
                IEMetalPressMoldPlateAmountInput
            );
        }
        if (getOreDict("ingot",metal).items.length >= 1 & getOreDict("stick",metal).items.length >= 1 & IEMetalPressAddRecipes) {
            MetalPress.addRecipe(
                findFirstItem(modlist,"stick",metal) * IEMetalPressMoldStickAmountOutput,
                getOreDict("ingot",metal),
                getItemString(IEMetalPressMoldStick),
                IEMetalPressEnergy,
                IEMetalPressMoldStickAmountInput
            );
        }
        if (getOreDict("ingot",metal).items.length >= 1 & getOreDict("gear",metal).items.length >= 1 & IEMetalPressAddRecipes) {
            MetalPress.addRecipe(
                findFirstItem(modlist,"gear",metal) * IEMetalPressMoldGearAmountOutput,
                getOreDict("ingot",metal),
                getItemString(IEMetalPressMoldGear),
                IEMetalPressEnergy,
                IEMetalPressMoldGearAmountInput
            );
        }
    }
}

function addIEArcFurnaceRecipes(modlist as string[]) {
    for metal in metalsToUnify {
        if (IEArcFurnaceAddRecipes & IEArcFurnaceAddSmelt & getOreDict("ingot",metal).items.length >= 1 & getOreDict("dust",metal).items.length >= 1) {
            ArcFurnace.addRecipe(
                findFirstItem(modlist,"ingot",metal),
                getOreDict("dust",metal),
                null,
                IEArcFurnaceTimeSmelt,
                IEArcFurnaceEnergy
            );
        }
        if (IEArcFurnaceAddRecipes & IEArcFurnaceAddOre & getOreDict("ingot",metal).items.length >= 1 & getOreDict("ore",metal).items.length >= 1) {
            ArcFurnace.addRecipe(
                findFirstItem(modlist,"ingot",metal) * IEArcFurnaceMultiplierOre,
                getOreDict("ore",metal),
                getItemString(IESlagItem),
                IEArcFurnaceTimeOre,
                IEArcFurnaceEnergy,
                [],
                "Ores"
            );
        }
    }
    for metal in alloyDict.keys {
        var alloyInputs as string[] = [];
        var amount as int = 0;
        for input, quantity in alloyDict[metal] {
            alloyInputs += input;
            amount += quantity;
        }
        if (alloyInputs.length == 2 & IEArcFurnaceAddAlloy & getOreDict("ingot",metal).items.length >= 1) {
            ArcFurnace.addRecipe(
                findFirstItem(modlist,"ingot",metal) * amount,
                getOreDict("ingot",alloyInputs[0]) * alloyDict[metal][alloyInputs[0]],
                null,
                IEArcFurnaceTimeAlloy,
                IEArcFurnaceEnergy,
                [
                    getOreDict("ingot",alloyInputs[1]) * alloyDict[metal][alloyInputs[1]]
                ],
                "Alloying"
            );
            ArcFurnace.addRecipe(
                findFirstItem(modlist,"ingot",metal) * amount,
                getOreDict("dust",alloyInputs[0]) * alloyDict[metal][alloyInputs[0]],
                null,
                IEArcFurnaceTimeAlloy,
                IEArcFurnaceEnergy,
                [
                    getOreDict("dust",alloyInputs[1]) * alloyDict[metal][alloyInputs[1]]
                ],
                "Alloying"
            );
            ArcFurnace.addRecipe(
                findFirstItem(modlist,"ingot",metal) * amount,
                getOreDict("dust",alloyInputs[0]) * alloyDict[metal][alloyInputs[0]],
                null,
                IEArcFurnaceTimeAlloy,
                IEArcFurnaceEnergy,
                [
                    getOreDict("ingot",alloyInputs[1]) * alloyDict[metal][alloyInputs[1]]
                ],
                "Alloying"
            );
            ArcFurnace.addRecipe(
                findFirstItem(modlist,"ingot",metal) * amount,
                getOreDict("ingot",alloyInputs[0]) * alloyDict[metal][alloyInputs[0]],
                null,
                IEArcFurnaceTimeAlloy,
                IEArcFurnaceEnergy,
                [
                    getOreDict("dust",alloyInputs[1]) * alloyDict[metal][alloyInputs[1]]
                ],
                "Alloying"
            );
        }
    }
    if (IEArcFurnaceAddRecipes & IEArcFurnaceAddSteel & getOreDict("ingot","steel").items.length >= 1) {
        ArcFurnace.addRecipe(
            findFirstItem(modlist,"ingot","steel"),
            getOreDict("ingot","iron"),
            getItemString(IESlagItem),
            IEArcFurnaceTimeSteel,
            IEArcFurnaceEnergy,
            [
                getOreDict("dust","coke")
            ]
        );
        ArcFurnace.addRecipe(
            findFirstItem(modlist,"ingot","steel"),
            getOreDict("dust","iron"),
            getItemString(IESlagItem),
            IEArcFurnaceTimeSteel,
            IEArcFurnaceEnergy,
            [
                getOreDict("dust","coke")
            ]
        );
    } 
}

function addIEBlastFurnaceRecipes(modlist as string[]) {
    if (IEBlastFurnaceAddRecipes & getOreDict("ingot","steel").items.length >= 1) {
        BlastFurnace.addRecipe(
            findFirstItem(modlist,"ingot","steel"),
            getOreDict("ingot","iron"),
            IEBlastFurnaceTime,
            getItemString(IESlagItem)
        );
    }
    if (IEBlastFurnaceAddRecipes & getOreDict("block","steel").items.length >= 1) {
        BlastFurnace.addRecipe(
            findFirstItem(modlist,"block","steel"),
            getOreDict("block","iron"),
            IEBlastFurnaceTime * 9,
            getItemString(IESlagItem)
        );
    }
}"""

class stringsUnificationOptions(stringsUnification):
    head = """#priority {}

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;\n\n"""

    master = """// Enable Unification Scripts?
static UNIFICATIONMASTER as bool = {};
static UNIFICATIONremoveRecipes as bool = {};
static UNIFICATIONfurnace as bool = {};
static UNIFICATIONcrafting as bool = {};\n\n"""

    tools = """// Use tools in recipes?
static useTools as bool = {};\n\n"""

    jei = """//JEI
static JEIMASTER as bool = {};
static JEIOres as bool = {};\n\n"""

    immersiveengineering = """//Immersive Engineering
static IEMASTER as bool = {};

static IESlagItem as string = "{}";

static IECrusherRemoveRecipes as bool = {};
static IECrusherAddRecipes as bool = {};
static IECrusherEnergy as int  = {};
static IECrusherMultiplier as int = {};

static IEKilnRemoveRecipes as bool = {};
static IEKilnAddRecipes as bool = {};
static IEKilnTime as int = {};

static IEMetalPressRemoveRecipes as bool = {};
static IEMetalPressAddRecipes as bool = {};
static IEMetalPressEnergy as int = {};

static IEMetalPressMoldPlate as string = "{}";
static IEMetalPressMoldPlateAmountInput as int = {};
static IEMetalPressMoldPlateAmountOutput as int = {};

static IEMetalPressMoldStick as string = "{}";
static IEMetalPressMoldStickAmountInput as int = {};
static IEMetalPressMoldStickAmountOutput as int = {};

static IEMetalPressMoldGear as string = "{}";
static IEMetalPressMoldGearAmountInput as int = {};
static IEMetalPressMoldGearAmountOutput as int = {};

static IEArcFurnaceRemoveRecipes as bool = {};
static IEArcFurnaceAddRecipes as bool = {};
static IEArcFurnaceEnergy as int = {};

static IEArcFurnaceAddSmelt as bool = {};
static IEArcFurnaceTimeSmelt as int = {};

static IEArcFurnaceAddOre as bool = {};
static IEArcFurnaceTimeOre as int = {};
static IEArcFurnaceMultiplierOre as int = {};

static IEArcFurnaceAddSteel as bool = {};
static IEArcFurnaceTimeSteel as int = {};

static IEArcFurnaceAddAlloy as bool = {};
static IEArcFurnaceTimeAlloy as int = {};

static IEBlastFurnaceRemoveRecipes as bool = {};
static IEBlastFurnaceAddRecipes as bool = {};
static IEBlastFurnaceTime as int = {};\n\n"""

    tconstruct = """// Tinker's Construct

static TiCoMASTER as bool = {};

static TiCoRemoveRecipes as bool = {};
static TiCoAddRecipes as bool = {};

static TiCoCastRemoveRecipes as bool = {};
static TiCoCastAddRecipes as bool = {};

static TiCoCastGear as string = "{}";
static TiCoCastPlate as string = "{}";
static TiCoCastNugget as string = "{}";
static TiCoCastIngot as string = "{}";

static TiCoMultiplierGear as int = {};
static TiCoMultiplierPlate as int = {};\n\n"""

class stringsUnificationScript(stringsUnification):
    head = """#priority {}

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

import scripts._UNIFICATION.{}functions.getModlist;
import scripts._UNIFICATION.{}functions.removeAllRecipes;
import scripts._UNIFICATION.{}functions.addFurnaceRecipes;
import scripts._UNIFICATION.{}functions.addCraftingRecipes;

import scripts._UNIFICATION.{}options.UNIFICATIONMASTER;
import scripts._UNIFICATION.{}options.UNIFICATIONremoveRecipes;
import scripts._UNIFICATION.{}options.UNIFICATIONfurnace;
import scripts._UNIFICATION.{}options.UNIFICATIONcrafting;\n"""

    body = """
if (UNIFICATIONMASTER) {
    if (UNIFICATIONremoveRecipes) {
        removeAllRecipes();
    }
    if (UNIFICATIONfurnace) {
        addFurnaceRecipes(getModlist());
    }
    if (UNIFICATIONcrafting) {
        addCraftingRecipes(getModlist());
    }
}"""

class stringsUnificationFunctions(stringsUnification):
    head = """#priority {}

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

import scripts._UNIFICATION.{}options.useTools;

// External Variables

global unification_recipeCheck as bool = true;
global unification_liquidToIngot as int = {};"""

    body = """
// Functions

function toString(item as IIngredient) as string {
	return item.commandString.replace("<","").replace(">","");
}

function getOreDict(dict as string, material as string) as IIngredient {
    if (dict == "null" | material == "null") {
        return null;
    } else {
        return oreDict.get(dict~material.substring(0,1).toUpperCase()~material.substring(1).toLowerCase());
    }
}

function getItem(mod as string, item as string) as IItemStack {
    return itemUtils.getItem(mod~":"~item);
}

function getItemAny(mod as string, item as string) as IItemStack {
    return itemUtils.getItem(mod~":"~item,32767);
}

function getItemMeta(mod as string, item as string, meta as int) as IItemStack {
    return itemUtils.getItem(mod~":"~item,meta);
}

function getItemString(input as string) as IItemStack {
    var counter as int = 0;
    var star as int = 0;
    var mod as string = "";
    var item as string = "";
    var meta as string = "";
    for symbol in getArrayString(input) {
        if (symbol == ":") {
            counter += 1;
        }
        if (symbol == "*") {
            star += 1;
        }
        if (counter == 0 & symbol != ":") {
            mod += symbol;
        }
        if (counter == 1 & symbol != ":") {
            item += symbol;
        }
        if (counter == 2 & symbol != ":") {
            meta += symbol;
        }
    }
    if (star >= 1) {
        return getItemAny(mod,item);
    }
    if (counter == 1) {
        return getItem(mod,item);
    } else {
        return getItemMeta(mod,item,meta as int);
    }
}

function getArrayString(line as string) as string[] {
    var array as string[] = [];
    for i in 0 .. line.length {
        array += line[i];
    }
    return array;
}

function getFluid(fluid as string) as ILiquidStack {
    var bucket as IItemStack = <minecraft:bucket>;

    if (fluid == "water") {
        bucket = <minecraft:water_bucket>;
    }
    if (fluid == "lava") {
        bucket = <minecraft:lava_bucket>;
    }
    if (fluid != "lava" & fluid != "water") {
        bucket = <forge:bucketfilled>.withTag({FluidName: fluid, Amount: 1000});
    }

    for liquid in bucket.liquids {
        return liquid.definition * 1;
    }  
}

function getBucket(fluid as string, bucket as IItemStack) as IItemStack {
    return bucket.withTag({FluidName: fluid, Amount: 1000});
}

function getBucketDefault(fluid as string) as IItemStack {
    if (fluid == "water") {
        return <minecraft:water_bucket>;
    }
    if (fluid == "lava") {
        return <minecraft:lava_bucket>;
    }
    if (fluid != "water" & fluid != "lava") {
        return getBucket(fluid, <forge:bucketfilled>);
    }
}

function getModlist() as string[] {
    return sortBig(modPriority);
}

function removeAllRecipes() {
    for metal in metalsToUnify {
        for type in typesToUnify.keys {
            recipes.remove(getOreDict(type,metal));
        }
        furnace.remove(getOreDict("ingot",metal));
        furnace.remove(getOreDict("nugget",metal));
    }
}

function findFirstItem(modlist as string[], type as string, metal as string) as IItemStack {
    for mod in modlist {
        for item in getOreDict(type,metal).items {
            if (mod == item.definition.owner) {
                return item;
            }
        }
    }
}

function addFurnaceRecipes(modlist as string[]) {
    for metal in metalsToUnify {
        if (getOreDict("ore",metal).items.length >= 1) {
            furnace.addRecipe(findFirstItem(modlist, "ingot", metal), getOreDict("ore",metal));
        }
        if (getOreDict("dust",metal).items.length >= 1) {
            furnace.addRecipe(findFirstItem(modlist, "ingot", metal), getOreDict("dust",metal));
        }
    }
}

function addCraftingRecipes(modlist as string[]) {
    for metal in metalsToUnify {
        for type, data in typesToUnify {
            if (getOreDict(type,metal).items.length >= 1) {
                for amount, data_2 in data {
                    var index as int = 0;
                    for craft in data_2 {
                        unification_recipeCheck = true;
                        registerRecipe(modlist,index,type,metal,amount,craft);
                        index += 1;
                    }
                }
            } else {
                print("[UNIFICATION] Did not find an Item for "~type~"_"~metal);
            }
        }
    }
}

function registerRecipe(modlist as string[], index as int, type as string, metal as string, amount as int, craft as string[][]) {
    var recipe = getRecipeArray(index,type,metal,amount,craft);
    if (unification_recipeCheck) {
        var name as string = "unification_"~type~"_"~metal~"_"~amount~"_"~index;
        recipes.addShaped(name,findFirstItem(modlist, type, metal) * amount,recipe);
    }
}

function getRecipeArray(index as int, type as string, metal as string, amount as int, grid as string[][]) as IIngredient[][] {
    var shape = getShape(grid);
    if (shape == "100-000-000") {
        return [
            [checkIngredient(amount,index,0,0,type,metal)]
        ];
    }
    if (shape == "111-111-111") {
        return [
            [checkIngredient(amount,index,0,0,type,metal),checkIngredient(amount,index,0,1,type,metal),checkIngredient(amount,index,0,2,type,metal)],
            [checkIngredient(amount,index,1,0,type,metal),checkIngredient(amount,index,1,1,type,metal),checkIngredient(amount,index,1,2,type,metal)],
            [checkIngredient(amount,index,2,0,type,metal),checkIngredient(amount,index,2,1,type,metal),checkIngredient(amount,index,2,2,type,metal)]
        ];
    }
    if (shape == "110-110-000") {
        return [
            [checkIngredient(amount,index,0,0,type,metal),checkIngredient(amount,index,0,1,type,metal)],
            [checkIngredient(amount,index,1,0,type,metal),checkIngredient(amount,index,1,1,type,metal)]
        ];
    }
    if (shape == "100-100-100") {
        return [
            [checkIngredient(amount,index,0,0,type,metal)],
            [checkIngredient(amount,index,1,0,type,metal)],
            [checkIngredient(amount,index,2,0,type,metal)]
        ];
    }
    if (shape == "100-100-000") {
        return [
            [checkIngredient(amount,index,0,0,type,metal)],
            [checkIngredient(amount,index,1,0,type,metal)]
        ];
    }
    print("[UNIFICATION] Did not found a matching recipe array template for "~type~"!");
}

function getShape(grid as string[][]) as string {
    var space1 as int = 0;
    var space2 as int = 0;
    var space3 as int = 0;
    var space4 as int = 0;
    var space5 as int = 0;
    var space6 as int = 0;
    var space7 as int = 0;
    var space8 as int = 0;
    var space9 as int = 0;
    if (grid.length >= 1) {
        if (grid[0].length >= 1) {
            space1 = 1;
        }
        if (grid[0].length >= 2) {
            space2 = 1;
        }
        if (grid[0].length >= 3) {
            space3 = 1;
        }

        if (grid.length >= 2) {
            if (grid[1].length >= 1) {
                space4 = 1;
            }
            if (grid[1].length >= 2) {
                space5 = 1;
            }
            if (grid[1].length >= 3) {
                space6 = 1;
            }

            if (grid.length >= 3) {
                if (grid[2].length >= 1) {
                    space7 = 1;
                }
                if (grid[2].length >= 2) {
                    space8 = 1;
                }
                if (grid[2].length >= 3) {
                    space9 = 1;
                }
            }
        }
    }
    return space1~space2~space3~"-"~space4~space5~space6~"-"~space7~space8~space9;
}

function checkIngredient(amount as int, index as int, pos1 as int, pos2 as int, type as string, metal as string) as IIngredient {
    if (typesToUnify[type][amount][index][pos1][pos2] == "null") {
        return null;
    }
    if (typesToUnify[type][amount][index][pos1][pos2] in "FLUID_") {
        return getBucketDefault(typesToUnify[type][amount][index][pos1][pos2].substring(6));
    }
    if (typesToUnify[type][amount][index][pos1][pos2] in "UNI_") {
        if (useTools) {
            return unificationTools[typesToUnify[type][amount][index][pos1][pos2]];
        } else {
            return null;
        }
    }
    if (typesToUnify[type][amount][index][pos1][pos2] in ":") {
        return itemUtils.getItem(typesToUnify[type][amount][index][pos1][pos2]);
    } else {
        if (getOreDict(typesToUnify[type][amount][index][pos1][pos2],metal).items.length >= 1) {
            return getOreDict(typesToUnify[type][amount][index][pos1][pos2],metal);
        } else {
            unification_recipeCheck = false;
        }
    }
}

function sortBig(list as int[string]) as string[] {
    var nums as int[] = [];
    var nums_mod as int[] = [];
    var sort as int[] = [];
    var mods as string[] = [];
    var i as int = 0;
    for mod, prio in list {
        if (loadedMods in mod) {
            nums += prio;
        }
    }
    nums_mod = nums;
    while (nums.length != 0) {
        nums = [];
        for entry in nums_mod {
            if (entry != i) {
                nums += entry;
            }
        }
        i = 0;
        for entry in nums {
            if (entry > i) {
                i = entry;
            }
        }
        sort += i;
        nums_mod = nums;
    }
    for entry in sort {
        for key, value in list {
            if (entry == value) {
                mods += key;
            }
        }
    }
    return mods;
}

function sortSmall(list as int[string]) as string[] {
    var nums as int[] = [];
    var nums_mod as int[] = [];
    var sort as int[] = [];
    var mods as string[] = [];
    var i as int = 0;
    for mod, prio in list {
        if (loadedMods in mod) {
            nums += prio;
        }
    }
    nums_mod = nums;
    while (nums.length != 0) {
        nums = [];
        for entry in nums_mod {
            if (entry != i) {
                nums += entry;
            }
        }
        i = 2147483;
        for entry in nums {
            if (entry < i) {
                i = entry;
            }
        }
        sort += i;
        nums_mod = nums;
    }
    for entry in sort {
        for key, value in list {
            if (entry == value) {
                mods += key;
            }
        }
    }
    return mods;
}"""