#modloaded crafttweaker actuallyadditions
#priority 400

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

// TL;DR Global variables need to start with "global" to be global!

global crystalRedstone as IItemStack = <actuallyadditions:item_crystal:0>;
global crystalLapis as IItemStack = <actuallyadditions:item_crystal:1>;
global crystalDiamond as IItemStack = <actuallyadditions:item_crystal:2>;
global crystalCoal as IItemStack = <actuallyadditions:item_crystal:3>;
global crystalEmerald as IItemStack = <actuallyadditions:item_crystal:4>;
global crystalIron as IItemStack = <actuallyadditions:item_crystal:5>;

global crystalBlockRedstone as IItemStack = <actuallyadditions:block_crystal:0>;
global crystalBlockLapis as IItemStack = <actuallyadditions:block_crystal:1>;
global crystalBlockDiamond as IItemStack = <actuallyadditions:block_crystal:2>;
global crystalBlockCoal as IItemStack = <actuallyadditions:block_crystal:3>;
global crystalBlockEmerald as IItemStack = <actuallyadditions:block_crystal:4>;
global crystalBlockIron as IItemStack = <actuallyadditions:block_crystal:5>;

global crystalEmpoweredRedstone as IItemStack = <actuallyadditions:item_crystal_empowered:0>;
global crystalEmpoweredLapis as IItemStack = <actuallyadditions:item_crystal_empowered:1>;
global crystalEmpoweredDiamond as IItemStack = <actuallyadditions:item_crystal_empowered:2>;
global crystalEmpoweredCoal as IItemStack = <actuallyadditions:item_crystal_empowered:3>;
global crystalEmpoweredEmerald as IItemStack = <actuallyadditions:item_crystal_empowered:4>;
global crystalEmpoweredIron as IItemStack = <actuallyadditions:item_crystal_empowered:5>;

global crystalBlockEmpoweredRedstone as IItemStack = <actuallyadditions:block_crystal_empowered:0>;
global crystalBlockEmpoweredLapis as IItemStack = <actuallyadditions:block_crystal_empowered:1>;
global crystalBlockEmpoweredDiamond as IItemStack = <actuallyadditions:block_crystal_empowered:2>;
global crystalBlockEmpoweredCoal as IItemStack = <actuallyadditions:block_crystal_empowered:3>;
global crystalBlockEmpoweredEmerald as IItemStack = <actuallyadditions:block_crystal_empowered:4>;
global crystalBlockEmpoweredIron as IItemStack = <actuallyadditions:block_crystal_empowered:5>;

global casingWood as IItemStack = <actuallyadditions:block_misc:4>;
global casingIron as IItemStack = <actuallyadditions:block_misc:9>;
global casingEnder as IItemStack = <actuallyadditions:block_misc:8>;

global blackQuartz as IIngredient = <ore:gemQuartzBlack>;

global coilBasic as IItemStack = <actuallyadditions:item_misc:7>;
global coilAdvanced as IItemStack = <actuallyadditions:item_misc:8>;

global elAA as IItemStack[string][string] = {
    "coil" : {
        "basic" : coilBasic,
        "advanced" : coilAdvanced
    },
    "casing" : {
        "wood" : casingWood,
        "iron" : casingIron,
        "ender" : casingEnder
    },
    "crystal" : {
        "redstone" : crystalRedstone,
        "lapis" : crystalLapis,
        "diamond" : crystalDiamond,
        "coal" : crystalCoal,
        "emerald" : crystalEmerald,
        "iron" : crystalIron
    },
    "crystalB" : {
        "redstone" : crystalBlockRedstone,
        "lapis" : crystalBlockLapis,
        "diamond" : crystalBlockDiamond,
        "coal" : crystalBlockCoal,
        "emerald" : crystalBlockEmerald,
        "iron" : crystalBlockIron
    },
    "crystalPower" : {
        "redstone" : crystalEmpoweredRedstone,
        "lapis" : crystalEmpoweredLapis,
        "diamond" : crystalEmpoweredDiamond,
        "coal" : crystalEmpoweredCoal,
        "emerald" : crystalEmpoweredEmerald,
        "iron" : crystalEmpoweredIron
    },
    "crystalPowerB" : {
        "redstone" : crystalBlockEmpoweredRedstone,
        "lapis" : crystalBlockEmpoweredLapis,
        "diamond" : crystalBlockEmpoweredDiamond,
        "coal" : crystalBlockEmpoweredCoal,
        "emerald" : crystalBlockEmpoweredEmerald,
        "iron" : crystalBlockEmpoweredIron
    }
};
