#modloaded crafttweaker
#priority 400

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

import scripts.EnderLib.functions.misc.toString;

function elAddShaped(recipeMap as IIngredient[][][][amount as int][output as IItemStack]) {
	var index_0 as int = 0;
	var index_1 as int = 0;
	for output, data1 in recipeMap {
		index_0 = 0;
		index_1 = 0;
		var outputName as string = toString(output);
		recipes.removeShaped(output);
		if logging {
			print("Removing all shaped recipes for "~outputName);
		}
		for amount, data2 in data1 {
			for entry in data2 {
				var recipeName as string = outputName~"_"~index_0~"_"~index_1;
				recipe.addShaped(recipeName, output * amount, entry);
				if logging {
					print("Adding shaped recipe "~recipeName);
				}
				index_1 += 1;
			}
			index_0 += 1;
		}
	}
}

function elAddShapeless(recipeMap as IIngredient[][][amount as int][output as IItemStack]) {
	var index_0 as int = 0;
	var index_1 as int = 0;
	for output, data1 in recipeMap {
		index_0 = 0;
		index_1 = 0;
		var outputName as string = toString(output);
		recipes.removeShapeless(output);
		if logging {
			print("Removing all shapeless recipes for "~outputName);
		}
		for amount, data2 in data1 {
			for entry in data2 {
				var recipeName as string = outputName~"_"~index_0~"_"~index_1;
				recipe.addShapeless(recipeName, output * amount, entry);
				if logging {
					print("Adding shapeless recipe "~recipeName);
				}
				index_1 += 1;
			}
			index_0 += 1;
		}
	}
}