#modloaded crafttweaker
#priority 400

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

// TL;DR Global variables need to start with "global" to be global!

global dyeWhite as IIngredient = <ore:dyeWhite>;
global dyeOrange as IIngredient = <ore:dyeOrange>;
global dyeMagenta as IIngredient = <ore:dyeMagenta>;
global dyeLightBlue as IIngredient = <ore:dyeLightBlue>;
global dyeYellow as IIngredient = <ore:dyeYellow>;
global dyeLime as IIngredient = <ore:dyeLime>;
global dyePink as IIngredient = <ore:dyePink>;
global dyeGray as IIngredient = <ore:dyeGray>;
global dyeLightGray as IIngredient = <ore:dyeLightGray>;
global dyeCyan as IIngredient = <ore:dyeCyan>;
global dyePurple as IIngredient = <ore:dyePurple>;
global dyeBlue as IIngredient = <ore:dyeBlue>;
global dyeBrown as IIngredient = <ore:dyeBrown>;
global dyeGreen as IIngredient = <ore:dyeGreen>;
global dyeRed as IIngredient = <ore:dyeRed>;
global dyeBlack as IIngredient = <ore:dyeBlack>;

global dye as IIngredient[string] = {
    "white" : dyeWhite,
    "orange" : dyeOrange,
    "magenta" : dyeMagenta,
    "light_blue" : dyeLightBlue,
    "yellow" : dyeYellow,
    "lime" : dyeLime,
    "pink" : dyePink,
    "gray" : dyeGray,
    "light_gray" : dyeLightGray,
    "cyan" : dyeCyan,
    "purple" : dyePurple,
    "blue" : dyeBlue,
    "brown" : dyeBrown,
    "green" : dyeGreen,
    "red" : dyeRed,
    "black" : dyeBlack,
};
