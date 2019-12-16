#modloaded crafttweaker forestry
#priority 400

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

// TL;DR Global variables need to start with "global" to be global!

global tubeCopper as IItemStack = <forestry:thermionic_tubes:0>;
global tubeTin as IItemStack = <forestry:thermionic_tubes:1>;
global tubeBronze as IItemStack = <forestry:thermionic_tubes:2>;
global tubeIron as IItemStack = <forestry:thermionic_tubes:3>;
global tubeGold as IItemStack = <forestry:thermionic_tubes:4>;
global tubeDiamond as IItemStack = <forestry:thermionic_tubes:5>;
global tubeObsidian as IItemStack = <forestry:thermionic_tubes:6>;
global tubeBlazing as IItemStack = <forestry:thermionic_tubes:7>;
global tubeRubber as IItemStack = <forestry:thermionic_tubes:8>;
global tubeEmerald as IItemStack = <forestry:thermionic_tubes:9>;
global tubeApatite as IItemStack = <forestry:thermionic_tubes:10>;
global tubeLapis as IItemStack = <forestry:thermionic_tubes:11>;
global tubeEnder as IItemStack = <forestry:thermionic_tubes:12>;
global tubeRedstone as IItemStack = <forestry:thermionic_tubes:13>;

global casingSturdy as IItemStack = <forestry:sturdy_machine>;
global casingHardened as IItemStack = <forestry:hardened_machine>;
global casingImpregnated as IItemStack = <forestry:impregnated_casing>;
global casingFlexible as IItemStack = <forestry:flexible_casing>;

global circuitTin as IItemStack = <forestry:chipsets>;
global circuitBronze as IItemStack = <forestry:chipsets:1>;
global circuitIron as IItemStack = <forestry:chipsets:2>;
global circuitGold as IItemStack = <forestry:chipsets:3>;

global elForestry as IItemStack[string][string] = {
    "tube" : {
        "copper" : tubeCopper,
        "tin" : tubeTin,
        "bronze" : tubeBronze,
        "iron" : tubeIron,
        "gold" : tubeGold,
        "diamond" : tubeDiamond,
        "obsidian" : tubeObsidian,
        "blaze" : tubeBlazing,
        "rubber" : tubeRubber,
        "emerald" : tubeEmerald,
        "apatite" : tubeApatite,
        "lapis" : tubeLapis,
        "ender" : tubeEnder,
        "redstone" : tubeRedstone
    },
    "casing" : {
        "sturdy" : casingSturdy,
        "hardened" : casingHardened,
        "impregnated" : casingImpregnated,
        "flexible" : casingFlexible
    },
    "circuit" : {
        "tin" : circuitTin,
        "bronze" : circuitBronze,
        "iron" : circuitIron,
        "gold" : circuitGold
    }
};
