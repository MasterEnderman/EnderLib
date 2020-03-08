#modloaded modtweaker tconstruct
#priority 9999

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

import mods.tconstruct.Alloy;
import mods.tconstruct.Casting;
import mods.tconstruct.Melting;

import scripts.EnderLib.unification.uni_functions.getFluid;
import scripts.EnderLib.unification.uni_functions.getOreDict;
import scripts.EnderLib.unification.uni_functions.getModlist;
import scripts.EnderLib.unification.uni_functions.getItemString;
import scripts.EnderLib.unification.uni_functions.findFirstItem;

import scripts.EnderLib.unification.uni_options.TiCoMASTER;

import scripts.EnderLib.unification.uni_options.TiCoRemoveRecipes;
import scripts.EnderLib.unification.uni_options.TiCoAddRecipes;

import scripts.EnderLib.unification.uni_options.TiCoCastRemoveRecipes;
import scripts.EnderLib.unification.uni_options.TiCoCastAddRecipes;

import scripts.EnderLib.unification.uni_options.TiCoCastGear;
import scripts.EnderLib.unification.uni_options.TiCoCastPlate;
import scripts.EnderLib.unification.uni_options.TiCoCastNugget;
import scripts.EnderLib.unification.uni_options.TiCoCastIngot;

import scripts.EnderLib.unification.uni_options.TiCoMultiplierGear;
import scripts.EnderLib.unification.uni_options.TiCoMultiplierPlate;

if (TiCoMASTER) {
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
}