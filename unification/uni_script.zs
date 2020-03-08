#priority 9999

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

import scripts.unification.uni_functions.getModlist;
import scripts.unification.uni_functions.removeAllRecipes;
import scripts.unification.uni_functions.addFurnaceRecipes;
import scripts.unification.uni_functions.addCraftingRecipes;

import scripts.EnderLib.unification.uni_options.UNIFICATIONMASTER;

if (UNIFICATIONMASTER) {
    removeAllRecipes();
    addFurnaceRecipes(getModlist());
    addCraftingRecipes(getModlist());
}
