#modloaded crafttweaker
#priority 400

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

import scripts.EnderLib.functions.misc.toString;

function elFurnaceRemove(result as IIngredient[]) {
	for item in outputs {
		furnace.remove(item);
		if logging {
			var itemname as string = toString(item);
			print("Remove Furnace Recipe for "~itemname);
		}
	}
}

function elFurnaceRemoveFilter(map as IIngredient[][Ingredient]) {
	for output, inputs in map {
		for item in inputs {
			furnace.remove(output, item);
			if logging {
				var inputname as string = toString(item);
				var outputname as string = toString(output);
				print("Remove Furnace Recipe for "~outputname~" with "~inputname);
			}
		}
	}
}

function elFurnaceAdd(furnaceMap as IIngredient[][double][int][IItemStack][string]) {
	for overwrite, data_0 in furnaceMap {
		for output, data_1 in data_0 {
			var outputname as string = toString(output);
			if (overwrite == "true") {
				furnace.remove(output);
				if logging {
					print("Remove Furnace Recipe for "~outputname);
				}
			}
			for amount, data_2 in data_1 {
				for xp, inputs in data_2 {
					for item in inputs {
						var inputname as string = toString(item);
						furnace.addRecipe(output * amount, item, xp);
						if logging {
							print("Adding Furnace Recipe for "~outputname~" with "~inputname);
						}
					}
				}
			}
		}
	}
}

function elFurnaceFuel(fuelMap as IIngredient[][int]) {
	for time, fuels in fuelMap {
		for item in fuels {
			furnace.setFuel(item, fuel);
			if logging {
				var itemname as string = toString(item);
				print("Set Burntime for "~itemname~" to "~time);
			}
		}
	}
}