#modloaded crafttweaker tconstruct
#priority 400

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

// TL;DR Global variables need to start with "global" to be global!

global elTiCO as IIngredient[string][string] = {
    "brick" : {
        "seared" : <ore:ingotBrickSeared>,
        "mud" : <tconstruct:materials:1>,
        "clay" : <tconstruct:materials:2>
    },
    "block" : {
        "seared" : <ore:blockSeared>
    }
};
