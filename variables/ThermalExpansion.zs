#modloaded crafttweaker thermalexpansion
#priority 400

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

// TL;DR Global variables need to start with "global" to be global!

global elTE as IItemStack[string][string] = {
    "cell" : {
        "lead" : <thermalexpansion:cell>,
        "invar" : <thermalexpansion:cell>.withTag({Level: 1 as byte}),
        "electrum" : <thermalexpansion:cell>.withTag({Level: 2 as byte}),
        "signalum" : <thermalexpansion:cell>.withTag({Level: 3 as byte}),
        "enderium" : <thermalexpansion:cell>.withTag({Level: 4 as byte})
    },
    "frame" : {
        "machine" : <thermalexpansion:frame>,
        "device" : <thermalexpansion:frame:64>
    },
    "cellFrame" : {
        "lead" : <thermalexpansion:frame:128>,
        "invar" : <thermalexpansion:frame:129>,
        "electrum" : <thermalexpansion:frame:130>,
        "signalum" : <thermalexpansion:frame:131>,
        "enderium" : <thermalexpansion:frame:132>
    },
    "tank" : {
        "copper" : <thermalexpansion:tank>,
        "invar" : <thermalexpansion:tank>.withTag({Level: 1 as byte}),
        "electrum" : <thermalexpansion:tank>.withTag({Level: 2 as byte}),
        "signalum" : <thermalexpansion:tank>.withTag({Level: 3 as byte}),
        "enderium" : <thermalexpansion:tank>.withTag({Level: 4 as byte})
    },
    "reservoir" : {
        "copper" : <thermalexpansion:reservoir:0>,
        "invar" : <thermalexpansion:reservoir:1>,
        "electrum" : <thermalexpansion:reservoir:2>,
        "signalum" : <thermalexpansion:reservoir:3>,
        "enderium" : <thermalexpansion:reservoir:4>
    },
    "cache" : {
        "tin" : <thermalexpansion:cache>,
        "invar" : <thermalexpansion:cache>.withTag({Level: 1 as byte}),
        "electrum" : <thermalexpansion:cache>.withTag({Level: 2 as byte}),
        "signalum" : <thermalexpansion:cache>.withTag({Level: 3 as byte}),
        "enderium" : <thermalexpansion:cache>.withTag({Level: 4 as byte})
    },
    "satchel" : {
        "tin" : <thermalexpansion:satchel:0>,
        "invar" : <thermalexpansion:satchel:1>,
        "electrum" : <thermalexpansion:satchel:2>,
        "signalum" : <thermalexpansion:satchel:3>,
        "enderium" : <thermalexpansion:satchel:4>
    },
    "capacitor" : {
        "lead" : <thermalexpansion:capacitor:0>,
        "invar" : <thermalexpansion:capacitor:1>,
        "electrum" : <thermalexpansion:capacitor:2>,
        "signalum" : <thermalexpansion:capacitor:3>,
        "enderium" : <thermalexpansion:capacitor:4>
    }
};
