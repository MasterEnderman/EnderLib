#modloaded crafttweaker microblockcbe rustic
#priority 400

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

// TL;DR Global variables need to start with "global" to be global!

global rusticMB as IItemStack[string][string] = {
    "olive" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "rustic:planks[variant=olive]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "rustic:planks[variant=olive]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "rustic:planks[variant=olive]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "rustic:planks[variant=olive]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "rustic:planks[variant=olive]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "rustic:planks[variant=olive]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "rustic:planks[variant=olive]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "rustic:planks[variant=olive]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "rustic:planks[variant=olive]"}),
    },
    "ironwood" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "rustic:planks[variant=ironwood]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "rustic:planks[variant=ironwood]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "rustic:planks[variant=ironwood]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "rustic:planks[variant=ironwood]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "rustic:planks[variant=ironwood]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "rustic:planks[variant=ironwood]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "rustic:planks[variant=ironwood]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "rustic:planks[variant=ironwood]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "rustic:planks[variant=ironwood]"}),
    }
};

global rusticSlabMB as IIngredient = rusticMB["olive"]["slab"]|rusticMB["ironwood"]["slab"];
global rusticPanelMB as IIngredient = rusticMB["olive"]["panel"]|rusticMB["ironwood"]["panel"];
global rusticCoverMB as IIngredient = rusticMB["olive"]["cover"]|rusticMB["ironwood"]["cover"];
global rusticPillarMB as IIngredient = rusticMB["olive"]["pillar"]|rusticMB["ironwood"]["pillar"];
global rusticPostMB as IIngredient = rusticMB["olive"]["post"]|rusticMB["ironwood"]["post"];
global rusticStripMB as IIngredient = rusticMB["olive"]["strip"]|rusticMB["ironwood"]["strip"];
global rusticNotchMB as IIngredient = rusticMB["olive"]["notch"]|rusticMB["ironwood"]["notch"];
global rusticCornerMB as IIngredient = rusticMB["olive"]["corner"]|rusticMB["ironwood"]["corner"];
global rusticNookMB as IIngredient = rusticMB["olive"]["nook"]|rusticMB["ironwood"]["nook"];
