#modloaded crafttweaker gtadditions
#priority 400

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

// TL;DR Global variables need to start with "global" to be global!

global craftingToolBendingCylinder as IItemStack = <gtadditions:ga_meta_tool>;
global craftingToolSmallBendingCylinder as IItemStack = <gtadditions:ga_meta_tool:1>;
