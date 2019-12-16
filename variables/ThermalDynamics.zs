#modloaded crafttweaker thermaldynamics
#priority 400

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

// TL;DR Global variables need to start with "global" to be global!

global elTD as IItemStack[string][string] = {
    "duct" : {
        "lead" : <thermaldynamics:duct_0:0>,
        "invar" : <thermaldynamics:duct_0:1>,
        "electrum" : <thermaldynamics:duct_0:2>,
        "signalum" : <thermaldynamics:duct_0:3>,
        "enderium" : <thermaldynamics:duct_0:4>
    }
};
