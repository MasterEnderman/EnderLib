#modloaded jei
#priority 9999

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

import mods.jei.JEI;

import scripts.EnderLib.unification.uni_functions.getOreDict;
import scripts.EnderLib.unification.uni_functions.getModlist;
import scripts.EnderLib.unification.uni_functions.findFirstItem;

import scripts.EnderLib.unification.uni_options.JEIMASTER;
import scripts.EnderLib.unification.uni_options.JEIOres;

if (JEIMASTER) {
    cleanJEI(getModlist());
}

function cleanJEI(modlist as string[]) {
    for metal in metalsToUnify {
        for type in typesToUnify.keys {
            jeiHide(findFirstItem(modlist,type,metal),type,metal);
        }
        if (JEIOres) {
            jeiHide(findFirstItem(modlist,"ore",metal),"ore",metal);
        }
    }
}

function jeiHide(filter as IItemStack, type as string, metal as string) {
    for item in getOreDict(type,metal).items {
        if (item.definition.owner != filter.definition.owner) {
            JEI.removeAndHide(item);
        }
    }  
}