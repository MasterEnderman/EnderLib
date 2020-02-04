#modloaded crafttweaker
#priority 400

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

import scripts.EnderLib.functions.misc.toString;

function elReplaceIngredient(map as IItemStack[][IIngredient]) {
	for new, old in map {
		for entry in old {
			recipes.replaceAllOccurences(old, entry);
			if logging {
				var newname as string = toString(new);
				var oldname as string = toString(old);
				print("Replace "~oldname~" with "~newname);
			}
		}
	}
}

function elReplaceIngredientFilter(old as IItemStack, new as IIngredient, filter as IItemStack) {
	recipes.replaceAllOccurences(old, new, <*>.only(function(item) {
		return !isNull(item) & !filter.matches(item);
	}));
	if logging {
		var oldname as string = toString(old);
		var newname as string = toString(new);
		var filtername as string = toString(filter);
		print("Replace "~oldname~" with "~newname~", except "~filtername);
	}
}