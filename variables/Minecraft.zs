#modloaded crafttweaker minecraft
#priority 400

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

// TL;DR Global variables need to start with "global" to be global!

global elMC as IIngredient[string][string] = {
    "wood" : {
        "log" : <ore:logWood>,
        "plank" : <ore:plankWood>,
        "stick" : <ore:stickWood>,
        "slab" : <ore:slabWood>,
        "chest" : <ore:chestWood>,
        "fence" : <ore:fenceWood>,
        "gate" : <ore:fenceGateWood>
    },
    "redstone" : {
        "dust" : <ore:dustRedstone>,
        "block" : <ore:blockRedstone>
    },
    "glowstone" : {
        "dust" : <ore:dustGlowstone>,
        "block" : <ore:blockGlowstone>
    },
    "diamond" : {
        "gem" : <ore:gemDiamond>,
        "block" : <ore:blockDiamond>,
        "dust" : <ore:dustDiamond>
    },
    "emerald" : {
        "gem" : <ore:gemEmerald>,
        "block" : <ore:blockEmerald>,
        "dust" : <ore:dustEmerald>
    },
    "quartz" : {
        "gem" : <ore:gemQuartz>,
        "block" : <ore:blockQuartz>,
        "dust" : <ore:dustQuartz>
    },
    "coal" : {
        "gem" : <ore:coal>,
        "block" : <ore:dustCoal>,
        "dust" : <ore:blockCoal>
    },
    "charcoal" : {
        "gem" : <ore:charcoal>,
        "block" : <ore:dustCharcoal>,
        "dust" : <ore:blockCharcoal>
    },
    "glass" : {
        "any" : <ore:blockGlass>
    },
    "meta" : {
        "piston" : <minecraft:piston>,
        "pistonS" : <minecraft:sticky_piston>,
        "hopper" : <minecraft:hopper>,
        "obsidian" : <ore:obsidian>,
        "pearl" : <ore:enderpearl>
    },
    "brick" : {
        "clay" : <ore:ingotBrick>,
        "nether" : <ore:ingotBrickNether>
    }
};
