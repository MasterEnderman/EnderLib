#modloaded crafttweaker
#priority 400

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

import scripts.EnderLib.functions.misc.toString;

function elRename(map as string[IItemStack]) {
	for item, name in map {
		item.displayName = name;
		if logging {
			var itemname as string = toString(item);
			print("Change name of "~itemname~" to "~name);
		}
	}
}