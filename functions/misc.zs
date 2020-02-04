#modloaded crafttweaker
#priority 500

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

function toString(item as IIngredient) {
	var name as string = item.commandString.replace("<","").replace(">","");
	return name;
}