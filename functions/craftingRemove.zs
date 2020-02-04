#modloaded crafttweaker
#priority 400

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

import scripts.EnderLib.functions.misc.toString;

if rmAll {
	recipes.removeAll();
}

function elRmAll(items as IIngredient[]) {
	for entry in items {
		recipes.remove(entry);
		if logging {
			var name as string = toString(entry);
			print("Remove all Recipes for "~name);
		}
	}
}

function elRmShaped(items as IIngredient[]) {
	for entry in items {
		recipes.removeShaped(entry);
		if logging {
			var name as string = toString(entry);
			print("Removed Shaped Recipes for "~name);
		}
	}
}

function elRmShapeless(items as IIngredient[]) {
	for entry in items {
		recipes.removeShapeless(entry);
		if logging {
			var name as string = toString(entry);
			print("Removed Shapeless Recipes for "~name);
		}
	}
}

function elRmMod(ids as string[]) {
	for mod in ids {
		recipes.removeByMod(mod);
		if logging {
			print("Removed all Recipes for "~mod);
		}
	}
}

function elRmName(names as string[]) {
	for entry in names {
		recipes.removeByName(entry);
		if logging {
			print("Removed Recipe "~entry);
		}
	}
}