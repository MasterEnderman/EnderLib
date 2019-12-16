#modloaded crafttweaker rftools
#priority 400

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

// TL;DR Global variables need to start with "global" to be global!

global elRfT as IItemStack[string][string] = {
    "meta" : {
        "frame" : <rftools:machine_frame>,
        "base" : <rftools:machine_base>
    }
};
