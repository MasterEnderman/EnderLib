#modloaded crafttweaker immersiveengineering
#priority 400

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

// TL;DR Global variables need to start with "global" to be global!

global elIE as IIngredient[string][string] = {
    "treated" : {
        "fence" : <ore:fenceTreatedWood>,
        "plank" : <ore:plankTreatedWood>,
        "scaffold" : <ore:scaffoldingTreatedWood>,
        "slab" : <ore:slabTreatedWood>,
        "stair" : <ore:stairTreatedWood>,
        "stick" : <ore:stickTreatedWood>
    },
    "coil" : {
        "copper" : <immersiveengineering:wirecoil:0>,
        "electrum" : <immersiveengineering:wirecoil:1>,
        "aluminum" : <immersiveengineering:wirecoil:2>,
        "hemp" : <immersiveengineering:wirecoil:3>,
        "steel" : <immersiveengineering:wirecoil:4>,
        "redstone" : <immersiveengineering:wirecoil:5>
    },
    "coilI" : {
        "copper" : <immersiveengineering:wirecoil:6>,
        "electrum" : <immersiveengineering:wirecoil:7>
    },
    "coilB" : {
        "copper" : <immersiveengineering:metal_decoration0>,
        "electrum" : <immersiveengineering:metal_decoration0:1>,
        "steel" : <immersiveengineering:metal_decoration0:2>
    },
    "wire" : {
        "copper" : <immersiveengineering:material:20>,
        "electrum" : <immersiveengineering:material:21>,
        "aluminum" : <immersiveengineering:material:22>,
        "steel" : <immersiveengineering:material:23>
    },
    "sheetmetal" : {
        "copper" : <immersiveengineering:sheetmetal:0>,
        "aluminum" : <immersiveengineering:sheetmetal:1>,
        "lead" : <immersiveengineering:sheetmetal:2>,
        "silver" : <immersiveengineering:sheetmetal:3>,
        "nickel" : <immersiveengineering:sheetmetal:4>,
        "uranium" : <immersiveengineering:sheetmetal:5>,
        "constantan" : <immersiveengineering:sheetmetal:6>,
        "electrum" : <immersiveengineering:sheetmetal:7>,
        "steel" : <immersiveengineering:sheetmetal:8>,
        "iron" : <immersiveengineering:sheetmetal:9>,
        "gold" : <immersiveengineering:sheetmetal:10>
    },
    "brick" : {
        "coke" : <immersiveengineering:stone_decoration>,
        "blast" : <immersiveengineering:stone_decoration:1>,
        "steel" : <immersiveengineering:stone_decoration:2>,
        "kiln" : <immersiveengineering:stone_decoration:10>
    },
    "hemp" : {
        "fiber" : <ore:fiberHemp>,
        "fabric" : <ore:fabricHemp>
    },
    "mold" : {
        "plate" : <immersiveengineering:mold>,
        "gear" : <immersiveengineering:mold:1>,
        "stick" : <immersiveengineering:mold:2>,
        "bullet" : <immersiveengineering:mold:3>,
        "wire" : <immersiveengineering:mold:4>,
        "pack2" : <immersiveengineering:mold:5>,
        "pack3" : <immersiveengineering:mold:6>,
        "unpack" : <immersiveengineering:mold:7>
    },
    "component" : {
        "iron" : <immersiveengineering:material:8>,
        "steel" : <immersiveengineering:material:9>
    },
    "meta" : {
        "slag" : <immersiveengineering:material:7>
    }
};
