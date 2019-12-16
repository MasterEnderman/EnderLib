#modloaded crafttweaker microblockcbe
#priority 400

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

// TL;DR Global variables need to start with "global" to be global!

global forgeMB as IItemStack[string][string] = {
    "spruce" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "minecraft:planks[variant=spruce]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "minecraft:planks[variant=spruce]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "minecraft:planks[variant=spruce]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "minecraft:planks[variant=spruce]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "minecraft:planks[variant=spruce]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "minecraft:planks[variant=spruce]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "minecraft:planks[variant=spruce]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "minecraft:planks[variant=spruce]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "minecraft:planks[variant=spruce]"}),
    },
    "oak" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "minecraft:planks[variant=oak]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "minecraft:planks[variant=oak]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "minecraft:planks[variant=oak]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "minecraft:planks[variant=oak]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "minecraft:planks[variant=oak]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "minecraft:planks[variant=oak]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "minecraft:planks[variant=oak]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "minecraft:planks[variant=oak]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "minecraft:planks[variant=oak]"}),
    },
    "birch" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "minecraft:planks[variant=birch]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "minecraft:planks[variant=birch]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "minecraft:planks[variant=birch]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "minecraft:planks[variant=birch]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "minecraft:planks[variant=birch]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "minecraft:planks[variant=birch]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "minecraft:planks[variant=birch]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "minecraft:planks[variant=birch]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "minecraft:planks[variant=birch]"}),
    },
    "jungle" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "minecraft:planks[variant=jungle]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "minecraft:planks[variant=jungle]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "minecraft:planks[variant=jungle]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "minecraft:planks[variant=jungle]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "minecraft:planks[variant=jungle]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "minecraft:planks[variant=jungle]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "minecraft:planks[variant=jungle]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "minecraft:planks[variant=jungle]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "minecraft:planks[variant=jungle]"}),
    },
    "acacia" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "minecraft:planks[variant=acacia]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "minecraft:planks[variant=acacia]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "minecraft:planks[variant=acacia]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "minecraft:planks[variant=acacia]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "minecraft:planks[variant=acacia]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "minecraft:planks[variant=acacia]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "minecraft:planks[variant=acacia]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "minecraft:planks[variant=acacia]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "minecraft:planks[variant=acacia]"}),
    },
    "dark_oak" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "minecraft:planks[variant=dark_oak]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "minecraft:planks[variant=dark_oak]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "minecraft:planks[variant=dark_oak]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "minecraft:planks[variant=dark_oak]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "minecraft:planks[variant=dark_oak]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "minecraft:planks[variant=dark_oak]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "minecraft:planks[variant=dark_oak]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "minecraft:planks[variant=dark_oak]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "minecraft:planks[variant=dark_oak]"}),
    }
};

global woodSlabMB as IIngredient = forgeMB["oak"]["slab"]|forgeMB["birch"]["slab"]|forgeMB["spruce"]["slab"]|forgeMB["jungle"]["slab"]|forgeMB["acacia"]["slab"]|forgeMB["dark_oak"]["slab"];
global woodPanelMB as IIngredient = forgeMB["oak"]["panel"]|forgeMB["birch"]["panel"]|forgeMB["spruce"]["panel"]|forgeMB["jungle"]["panel"]|forgeMB["acacia"]["panel"]|forgeMB["dark_oak"]["panel"];
global woodCoverMB as IIngredient = forgeMB["oak"]["cover"]|forgeMB["birch"]["cover"]|forgeMB["spruce"]["cover"]|forgeMB["jungle"]["cover"]|forgeMB["acacia"]["cover"]|forgeMB["dark_oak"]["cover"];
global woodPillarMB as IIngredient = forgeMB["oak"]["pillar"]|forgeMB["birch"]["pillar"]|forgeMB["spruce"]["pillar"]|forgeMB["jungle"]["pillar"]|forgeMB["acacia"]["pillar"]|forgeMB["dark_oak"]["pillar"];
global woodPostMB as IIngredient = forgeMB["oak"]["post"]|forgeMB["birch"]["post"]|forgeMB["spruce"]["post"]|forgeMB["jungle"]["post"]|forgeMB["acacia"]["post"]|forgeMB["dark_oak"]["post"];
global woodStripMB as IIngredient = forgeMB["oak"]["strip"]|forgeMB["birch"]["strip"]|forgeMB["spruce"]["strip"]|forgeMB["jungle"]["strip"]|forgeMB["acacia"]["strip"]|forgeMB["dark_oak"]["strip"];
global woodNotchMB as IIngredient = forgeMB["oak"]["notch"]|forgeMB["birch"]["notch"]|forgeMB["spruce"]["notch"]|forgeMB["jungle"]["notch"]|forgeMB["acacia"]["notch"]|forgeMB["dark_oak"]["notch"];
global woodCornerMB as IIngredient = forgeMB["oak"]["corner"]|forgeMB["birch"]["corner"]|forgeMB["spruce"]["corner"]|forgeMB["jungle"]["corner"]|forgeMB["acacia"]["corner"]|forgeMB["dark_oak"]["corner"];
global woodNookMB as IIngredient = forgeMB["oak"]["nook"]|forgeMB["birch"]["nook"]|forgeMB["spruce"]["nook"]|forgeMB["jungle"]["nook"]|forgeMB["acacia"]["nook"]|forgeMB["dark_oak"]["nook"];
