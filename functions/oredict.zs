#modloaded crafttweaker
#priority 300

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

import scripts.EnderLib.functions.misc.toString;

function elOreDictManager(map as IItemStack[][string][IOreDictEntry]) {
	for oredict, data in map {
		for key, items in data {
			for item in items {
				var itemname as string = toString(item);
				if (key == "remove") {
					oredict.remove(item);
					if logging {
						print("Remove "~itemname~" from an OreDict.");
					}
				}
				if (key == "add") {
					oredict.add(item);
					if logging {
						print("Adding "~itemname~" to an OreDict.")
					}
				}
			}
		}
	}
}