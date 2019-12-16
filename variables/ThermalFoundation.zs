#modloaded crafttweaker thermalfoundation
#priority 400

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

// TL;DR Global variables need to start with "global" to be global!

global elTF as IIngredient[string][string] = {
    "coil" : {
        "gold" : <thermalfoundation:material:513>,
        "silver" : <thermalfoundation:material:514>,
        "electrum" : <thermalfoundation:material:515>
    },
    "dust" : {
        "pyro" : <ore:dustPyrotheum>,
        "cryo" : <ore:dustCryotheum>,
        "aero" : <ore:dustAerotheum>,
        "petro" : <ore:dustPetrotheum>,
        "mana" : <ore:dustMana>
    },
    "hardenedGlass" : {
        "any" : <ore:blockGlassHardened>,
        "copper" : <thermalfoundation:glass:0>,
        "tin" : <thermalfoundation:glass:1>,
        "silver" : <thermalfoundation:glass:2>,
        "lead" : <thermalfoundation:glass:3>,
        "aluminum" : <thermalfoundation:glass:4>,
        "nickel" : <thermalfoundation:glass:5>,
        "platinum" : <thermalfoundation:glass:6>,
        "iridium" : <thermalfoundation:glass:7>,
        "mithril" : <thermalfoundation:glass:8>,
        "steel" : <thermalfoundation:glass_alloy:0>,
        "electrum" : <thermalfoundation:glass_alloy:1>,
        "invar" : <thermalfoundation:glass_alloy:2>,
        "bronze" : <thermalfoundation:glass_alloy:3>,
        "constantan" : <thermalfoundation:glass_alloy:4>,
        "signalum" : <thermalfoundation:glass_alloy:5>,
        "lumium" : <thermalfoundation:glass_alloy:6>,
        "enderium" : <thermalfoundation:glass_alloy:7>
    },
    "meta" : {
        "servo" : <thermalfoundation:material:512>
    }
};
