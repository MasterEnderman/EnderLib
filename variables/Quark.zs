#modloaded crafttweaker quark
#priority 400

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

// TL;DR Global variables need to start with "global" to be global!

global elQuark as IItemStack[string][string] = {
    "shard" : {
        "white" : <quark:glass_shards:1>,
        "orange" : <quark:glass_shards:2>,
        "magenta" : <quark:glass_shards:3>,
        "light_blue" : <quark:glass_shards:4>,
        "yellow" : <quark:glass_shards:5>,
        "lime" : <quark:glass_shards:6>,
        "pink" : <quark:glass_shards:7>,
        "gray" : <quark:glass_shards:8>,
        "light_gray" : <quark:glass_shards:9>,
        "cyan" : <quark:glass_shards:10>,
        "purple" : <quark:glass_shards:11>,
        "blue" : <quark:glass_shards:12>,
        "brown" : <quark:glass_shards:13>,
        "green" : <quark:glass_shards:14>,
        "red" : <quark:glass_shards:15>,
        "black" : <quark:glass_shards:16>,
    },
    "rune" : {
        "white" : <quark:rune>,
        "orange" : <quark:rune:1>,
        "magenta" : <quark:rune:2>,
        "light_blue" : <quark:rune:3>,
        "yellow" : <quark:rune:4>,
        "lime" : <quark:rune:5>,
        "pink" : <quark:rune:6>,
        "gray" : <quark:rune:7>,
        "light_gray" : <quark:rune:8>,
        "cyan" : <quark:rune:9>,
        "purple" : <quark:rune:10>,
        "blue" : <quark:rune:11>,
        "brown" : <quark:rune:12>,
        "green" : <quark:rune:13>,
        "red" : <quark:rune:14>,
        "black" : <quark:rune:15>,
    }
};
