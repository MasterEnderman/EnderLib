#modloaded immersiveengineering
#priority 9999

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

import scripts.EnderLib.unification.uni_functions.getOreDict;
import scripts.EnderLib.unification.uni_functions.getModlist;
import scripts.EnderLib.unification.uni_functions.getItemString;
import scripts.EnderLib.unification.uni_functions.findFirstItem;

import scripts.EnderLib.unification.uni_options.IEMASTER;

import scripts.EnderLib.unification.uni_options.IESlagItem;

import scripts.EnderLib.unification.uni_options.IEArcFurnaceRemoveRecipes;
import scripts.EnderLib.unification.uni_options.IEArcFurnaceAddRecipes;
import scripts.EnderLib.unification.uni_options.IEArcFurnaceEnergy;

import scripts.EnderLib.unification.uni_options.IEArcFurnaceAddSmelt;
import scripts.EnderLib.unification.uni_options.IEArcFurnaceTimeSmelt;

import scripts.EnderLib.unification.uni_options.IEArcFurnaceAddOre;
import scripts.EnderLib.unification.uni_options.IEArcFurnaceTimeOre;
import scripts.EnderLib.unification.uni_options.IEArcFurnaceMultiplierOre;

import scripts.EnderLib.unification.uni_options.IEArcFurnaceAddSteel;
import scripts.EnderLib.unification.uni_options.IEArcFurnaceTimeSteel;

import scripts.EnderLib.unification.uni_options.IEArcFurnaceAddAlloy;
import scripts.EnderLib.unification.uni_options.IEArcFurnaceTimeAlloy;

import scripts.EnderLib.unification.uni_options.IEBlastFurnaceRemoveRecipes;
import scripts.EnderLib.unification.uni_options.IEBlastFurnaceAddRecipes;
import scripts.EnderLib.unification.uni_options.IEBlastFurnaceTime;

import scripts.EnderLib.unification.uni_options.IECrusherRemoveRecipes;
import scripts.EnderLib.unification.uni_options.IECrusherAddRecipes;
import scripts.EnderLib.unification.uni_options.IECrusherEnergy;
import scripts.EnderLib.unification.uni_options.IECrusherMultiplier;

import scripts.EnderLib.unification.uni_options.IEKilnRemoveRecipes;
import scripts.EnderLib.unification.uni_options.IEKilnAddRecipes;
import scripts.EnderLib.unification.uni_options.IEKilnTime;

import scripts.EnderLib.unification.uni_options.IEMetalPressRemoveRecipes;
import scripts.EnderLib.unification.uni_options.IEMetalPressAddRecipes;
import scripts.EnderLib.unification.uni_options.IEMetalPressEnergy;

import scripts.EnderLib.unification.uni_options.IEMetalPressMoldPlate;
import scripts.EnderLib.unification.uni_options.IEMetalPressMoldPlateAmountInput;
import scripts.EnderLib.unification.uni_options.IEMetalPressMoldPlateAmountOutput;

import scripts.EnderLib.unification.uni_options.IEMetalPressMoldStick;
import scripts.EnderLib.unification.uni_options.IEMetalPressMoldStickAmountInput;
import scripts.EnderLib.unification.uni_options.IEMetalPressMoldStickAmountOutput;

import scripts.EnderLib.unification.uni_options.IEMetalPressMoldGear;
import scripts.EnderLib.unification.uni_options.IEMetalPressMoldGearAmountInput;
import scripts.EnderLib.unification.uni_options.IEMetalPressMoldGearAmountOutput;

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
}