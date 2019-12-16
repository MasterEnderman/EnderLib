#modloaded crafttweaker microblockcbe forestry
#priority 400

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

// TL;DR Global variables need to start with "global" to be global!

global forestryMB as IItemStack[string][string] = {
    "larch" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "forestry:planks.0[variant=larch]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "forestry:planks.0[variant=larch]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "forestry:planks.0[variant=larch]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "forestry:planks.0[variant=larch]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "forestry:planks.0[variant=larch]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "forestry:planks.0[variant=larch]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "forestry:planks.0[variant=larch]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "forestry:planks.0[variant=larch]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "forestry:planks.0[variant=larch]"}),
    },
    "teak" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "forestry:planks.0[variant=teak]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "forestry:planks.0[variant=teak]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "forestry:planks.0[variant=teak]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "forestry:planks.0[variant=teak]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "forestry:planks.0[variant=teak]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "forestry:planks.0[variant=teak]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "forestry:planks.0[variant=teak]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "forestry:planks.0[variant=teak]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "forestry:planks.0[variant=teak]"}),
    },
    "acacia" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "forestry:planks.0[variant=acacia]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "forestry:planks.0[variant=acacia]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "forestry:planks.0[variant=acacia]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "forestry:planks.0[variant=acacia]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "forestry:planks.0[variant=acacia]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "forestry:planks.0[variant=acacia]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "forestry:planks.0[variant=acacia]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "forestry:planks.0[variant=acacia]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "forestry:planks.0[variant=acacia]"}),
    },
    "lime" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "forestry:planks.0[variant=lime]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "forestry:planks.0[variant=lime]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "forestry:planks.0[variant=lime]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "forestry:planks.0[variant=lime]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "forestry:planks.0[variant=lime]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "forestry:planks.0[variant=lime]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "forestry:planks.0[variant=lime]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "forestry:planks.0[variant=lime]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "forestry:planks.0[variant=lime]"}),
    },
    "chestnut" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "forestry:planks.0[variant=chestnut]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "forestry:planks.0[variant=chestnut]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "forestry:planks.0[variant=chestnut]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "forestry:planks.0[variant=chestnut]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "forestry:planks.0[variant=chestnut]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "forestry:planks.0[variant=chestnut]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "forestry:planks.0[variant=chestnut]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "forestry:planks.0[variant=chestnut]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "forestry:planks.0[variant=chestnut]"}),
    },
    "wenge" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "forestry:planks.0[variant=wenge]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "forestry:planks.0[variant=wenge]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "forestry:planks.0[variant=wenge]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "forestry:planks.0[variant=wenge]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "forestry:planks.0[variant=wenge]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "forestry:planks.0[variant=wenge]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "forestry:planks.0[variant=wenge]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "forestry:planks.0[variant=wenge]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "forestry:planks.0[variant=wenge]"}),
    },
    "baobab" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "forestry:planks.0[variant=baobab]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "forestry:planks.0[variant=baobab]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "forestry:planks.0[variant=baobab]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "forestry:planks.0[variant=baobab]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "forestry:planks.0[variant=baobab]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "forestry:planks.0[variant=baobab]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "forestry:planks.0[variant=baobab]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "forestry:planks.0[variant=baobab]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "forestry:planks.0[variant=baobab]"}),
    },
    "sequoia" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "forestry:planks.0[variant=sequoia]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "forestry:planks.0[variant=sequoia]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "forestry:planks.0[variant=sequoia]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "forestry:planks.0[variant=sequoia]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "forestry:planks.0[variant=sequoia]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "forestry:planks.0[variant=sequoia]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "forestry:planks.0[variant=sequoia]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "forestry:planks.0[variant=sequoia]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "forestry:planks.0[variant=sequoia]"}),
    },
    "kapok" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "forestry:planks.0[variant=kapok]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "forestry:planks.0[variant=kapok]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "forestry:planks.0[variant=kapok]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "forestry:planks.0[variant=kapok]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "forestry:planks.0[variant=kapok]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "forestry:planks.0[variant=kapok]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "forestry:planks.0[variant=kapok]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "forestry:planks.0[variant=kapok]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "forestry:planks.0[variant=kapok]"}),
    },
    "ebony" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "forestry:planks.0[variant=ebony]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "forestry:planks.0[variant=ebony]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "forestry:planks.0[variant=ebony]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "forestry:planks.0[variant=ebony]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "forestry:planks.0[variant=ebony]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "forestry:planks.0[variant=ebony]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "forestry:planks.0[variant=ebony]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "forestry:planks.0[variant=ebony]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "forestry:planks.0[variant=ebony]"}),
    },
    "mahogany" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "forestry:planks.0[variant=mahogany]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "forestry:planks.0[variant=mahogany]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "forestry:planks.0[variant=mahogany]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "forestry:planks.0[variant=mahogany]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "forestry:planks.0[variant=mahogany]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "forestry:planks.0[variant=mahogany]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "forestry:planks.0[variant=mahogany]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "forestry:planks.0[variant=mahogany]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "forestry:planks.0[variant=mahogany]"}),
    },
    "balsa" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "forestry:planks.0[variant=balsa]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "forestry:planks.0[variant=balsa]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "forestry:planks.0[variant=balsa]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "forestry:planks.0[variant=balsa]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "forestry:planks.0[variant=balsa]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "forestry:planks.0[variant=balsa]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "forestry:planks.0[variant=balsa]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "forestry:planks.0[variant=balsa]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "forestry:planks.0[variant=balsa]"}),
    },
    "willow" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "forestry:planks.0[variant=willow]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "forestry:planks.0[variant=willow]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "forestry:planks.0[variant=willow]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "forestry:planks.0[variant=willow]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "forestry:planks.0[variant=willow]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "forestry:planks.0[variant=willow]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "forestry:planks.0[variant=willow]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "forestry:planks.0[variant=willow]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "forestry:planks.0[variant=willow]"}),
    },
    "walnut" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "forestry:planks.0[variant=walnut]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "forestry:planks.0[variant=walnut]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "forestry:planks.0[variant=walnut]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "forestry:planks.0[variant=walnut]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "forestry:planks.0[variant=walnut]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "forestry:planks.0[variant=walnut]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "forestry:planks.0[variant=walnut]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "forestry:planks.0[variant=walnut]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "forestry:planks.0[variant=walnut]"}),
    },
    "greenheart" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "forestry:planks.0[variant=greenheart]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "forestry:planks.0[variant=greenheart]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "forestry:planks.0[variant=greenheart]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "forestry:planks.0[variant=greenheart]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "forestry:planks.0[variant=greenheart]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "forestry:planks.0[variant=greenheart]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "forestry:planks.0[variant=greenheart]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "forestry:planks.0[variant=greenheart]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "forestry:planks.0[variant=greenheart]"}),
    },
    "cherry" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "forestry:planks.0[variant=cherry]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "forestry:planks.0[variant=cherry]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "forestry:planks.0[variant=cherry]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "forestry:planks.0[variant=cherry]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "forestry:planks.0[variant=cherry]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "forestry:planks.0[variant=cherry]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "forestry:planks.0[variant=cherry]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "forestry:planks.0[variant=cherry]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "forestry:planks.0[variant=cherry]"}),
    },
    "mahoe" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "forestry:planks.1[variant=mahoe]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "forestry:planks.1[variant=mahoe]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "forestry:planks.1[variant=mahoe]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "forestry:planks.1[variant=mahoe]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "forestry:planks.1[variant=mahoe]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "forestry:planks.1[variant=mahoe]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "forestry:planks.1[variant=mahoe]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "forestry:planks.1[variant=mahoe]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "forestry:planks.1[variant=mahoe]"}),
    },
    "poplar" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "forestry:planks.1[variant=poplar]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "forestry:planks.1[variant=poplar]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "forestry:planks.1[variant=poplar]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "forestry:planks.1[variant=poplar]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "forestry:planks.1[variant=poplar]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "forestry:planks.1[variant=poplar]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "forestry:planks.1[variant=poplar]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "forestry:planks.1[variant=poplar]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "forestry:planks.1[variant=poplar]"}),
    },
    "palm" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "forestry:planks.1[variant=palm]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "forestry:planks.1[variant=palm]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "forestry:planks.1[variant=palm]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "forestry:planks.1[variant=palm]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "forestry:planks.1[variant=palm]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "forestry:planks.1[variant=palm]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "forestry:planks.1[variant=palm]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "forestry:planks.1[variant=palm]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "forestry:planks.1[variant=palm]"}),
    },
    "papaya" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "forestry:planks.1[variant=papaya]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "forestry:planks.1[variant=papaya]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "forestry:planks.1[variant=papaya]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "forestry:planks.1[variant=papaya]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "forestry:planks.1[variant=papaya]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "forestry:planks.1[variant=papaya]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "forestry:planks.1[variant=papaya]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "forestry:planks.1[variant=papaya]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "forestry:planks.1[variant=papaya]"}),
    },
    "pine" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "forestry:planks.1[variant=pine]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "forestry:planks.1[variant=pine]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "forestry:planks.1[variant=pine]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "forestry:planks.1[variant=pine]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "forestry:planks.1[variant=pine]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "forestry:planks.1[variant=pine]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "forestry:planks.1[variant=pine]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "forestry:planks.1[variant=pine]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "forestry:planks.1[variant=pine]"}),
    },
    "plum" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "forestry:planks.1[variant=plum]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "forestry:planks.1[variant=plum]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "forestry:planks.1[variant=plum]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "forestry:planks.1[variant=plum]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "forestry:planks.1[variant=plum]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "forestry:planks.1[variant=plum]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "forestry:planks.1[variant=plum]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "forestry:planks.1[variant=plum]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "forestry:planks.1[variant=plum]"}),
    },
    "maple" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "forestry:planks.1[variant=maple]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "forestry:planks.1[variant=maple]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "forestry:planks.1[variant=maple]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "forestry:planks.1[variant=maple]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "forestry:planks.1[variant=maple]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "forestry:planks.1[variant=maple]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "forestry:planks.1[variant=maple]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "forestry:planks.1[variant=maple]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "forestry:planks.1[variant=maple]"}),
    },
    "citrus" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "forestry:planks.1[variant=citrus]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "forestry:planks.1[variant=citrus]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "forestry:planks.1[variant=citrus]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "forestry:planks.1[variant=citrus]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "forestry:planks.1[variant=citrus]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "forestry:planks.1[variant=citrus]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "forestry:planks.1[variant=citrus]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "forestry:planks.1[variant=citrus]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "forestry:planks.1[variant=citrus]"}),
    },
    "giganteum" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "forestry:planks.1[variant=giganteum]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "forestry:planks.1[variant=giganteum]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "forestry:planks.1[variant=giganteum]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "forestry:planks.1[variant=giganteum]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "forestry:planks.1[variant=giganteum]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "forestry:planks.1[variant=giganteum]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "forestry:planks.1[variant=giganteum]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "forestry:planks.1[variant=giganteum]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "forestry:planks.1[variant=giganteum]"}),
    },
    "ipe" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "forestry:planks.1[variant=ipe]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "forestry:planks.1[variant=ipe]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "forestry:planks.1[variant=ipe]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "forestry:planks.1[variant=ipe]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "forestry:planks.1[variant=ipe]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "forestry:planks.1[variant=ipe]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "forestry:planks.1[variant=ipe]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "forestry:planks.1[variant=ipe]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "forestry:planks.1[variant=ipe]"}),
    },
    "padauk" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "forestry:planks.1[variant=padauk]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "forestry:planks.1[variant=padauk]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "forestry:planks.1[variant=padauk]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "forestry:planks.1[variant=padauk]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "forestry:planks.1[variant=padauk]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "forestry:planks.1[variant=padauk]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "forestry:planks.1[variant=padauk]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "forestry:planks.1[variant=padauk]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "forestry:planks.1[variant=padauk]"}),
    },
    "cocobolo" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "forestry:planks.1[variant=cocobolo]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "forestry:planks.1[variant=cocobolo]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "forestry:planks.1[variant=cocobolo]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "forestry:planks.1[variant=cocobolo]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "forestry:planks.1[variant=cocobolo]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "forestry:planks.1[variant=cocobolo]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "forestry:planks.1[variant=cocobolo]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "forestry:planks.1[variant=cocobolo]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "forestry:planks.1[variant=cocobolo]"}),
    },
    "zebrawood" : {
        "slab" : <microblockcbe:microblock:4>.withTag({mat: "forestry:planks.1[variant=zebrawood]"}),
        "panel" : <microblockcbe:microblock:2>.withTag({mat: "forestry:planks.1[variant=zebrawood]"}),
        "cover" : <microblockcbe:microblock:1>.withTag({mat: "forestry:planks.1[variant=zebrawood]"}),
        "pillar" : <microblockcbe:microblock:772>.withTag({mat: "forestry:planks.1[variant=zebrawood]"}),
        "post" : <microblockcbe:microblock:770>.withTag({mat: "forestry:planks.1[variant=zebrawood]"}),
        "strip" : <microblockcbe:microblock:769>.withTag({mat: "forestry:planks.1[variant=zebrawood]"}),
        "notch" : <microblockcbe:microblock:516>.withTag({mat: "forestry:planks.1[variant=zebrawood]"}),
        "corner" : <microblockcbe:microblock:514>.withTag({mat: "forestry:planks.1[variant=zebrawood]"}),
        "nook" : <microblockcbe:microblock:513>.withTag({mat: "forestry:planks.1[variant=zebrawood]"}),
    }
};

global forestrySlabMB as IIngredient = 
    forestryMB["larch"]["slab"] |
    forestryMB["teak"]["slab"] |
    forestryMB["acacia"]["slab"] |
    forestryMB["lime"]["slab"] |
    forestryMB["chestnut"]["slab"] |
    forestryMB["wenge"]["slab"] |
    forestryMB["baobab"]["slab"] |
    forestryMB["sequoia"]["slab"] |
    forestryMB["kapok"]["slab"] |
    forestryMB["ebony"]["slab"] |
    forestryMB["mahogany"]["slab"] |
    forestryMB["balsa"]["slab"] |
    forestryMB["willow"]["slab"] |
    forestryMB["walnut"]["slab"] |
    forestryMB["greenheart"]["slab"] |
    forestryMB["cherry"]["slab"] |
    forestryMB["mahoe"]["slab"] |
    forestryMB["poplar"]["slab"] |
    forestryMB["palm"]["slab"] |
    forestryMB["papaya"]["slab"] |
    forestryMB["pine"]["slab"] |
    forestryMB["plum"]["slab"] |
    forestryMB["maple"]["slab"] |
    forestryMB["citrus"]["slab"] |
    forestryMB["giganteum"]["slab"] |
    forestryMB["ipe"]["slab"] |
    forestryMB["padauk"]["slab"] |
    forestryMB["cocobolo"]["slab"] |
    forestryMB["zebrawood"]["slab"];
global forestryPanelMB as IIngredient = 
    forestryMB["larch"]["panel"] |
    forestryMB["teak"]["panel"] |
    forestryMB["acacia"]["panel"] |
    forestryMB["lime"]["panel"] |
    forestryMB["chestnut"]["panel"] |
    forestryMB["wenge"]["panel"] |
    forestryMB["baobab"]["panel"] |
    forestryMB["sequoia"]["panel"] |
    forestryMB["kapok"]["panel"] |
    forestryMB["ebony"]["panel"] |
    forestryMB["mahogany"]["panel"] |
    forestryMB["balsa"]["panel"] |
    forestryMB["willow"]["panel"] |
    forestryMB["walnut"]["panel"] |
    forestryMB["greenheart"]["panel"] |
    forestryMB["cherry"]["panel"] |
    forestryMB["mahoe"]["panel"] |
    forestryMB["poplar"]["panel"] |
    forestryMB["palm"]["panel"] |
    forestryMB["papaya"]["panel"] |
    forestryMB["pine"]["panel"] |
    forestryMB["plum"]["panel"] |
    forestryMB["maple"]["panel"] |
    forestryMB["citrus"]["panel"] |
    forestryMB["giganteum"]["panel"] |
    forestryMB["ipe"]["panel"] |
    forestryMB["padauk"]["panel"] |
    forestryMB["cocobolo"]["panel"] |
    forestryMB["zebrawood"]["panel"];
global forestryCoverMB as IIngredient = 
    forestryMB["larch"]["cover"] |
    forestryMB["teak"]["cover"] |
    forestryMB["acacia"]["cover"] |
    forestryMB["lime"]["cover"] |
    forestryMB["chestnut"]["cover"] |
    forestryMB["wenge"]["cover"] |
    forestryMB["baobab"]["cover"] |
    forestryMB["sequoia"]["cover"] |
    forestryMB["kapok"]["cover"] |
    forestryMB["ebony"]["cover"] |
    forestryMB["mahogany"]["cover"] |
    forestryMB["balsa"]["cover"] |
    forestryMB["willow"]["cover"] |
    forestryMB["walnut"]["cover"] |
    forestryMB["greenheart"]["cover"] |
    forestryMB["cherry"]["cover"] |
    forestryMB["mahoe"]["cover"] |
    forestryMB["poplar"]["cover"] |
    forestryMB["palm"]["cover"] |
    forestryMB["papaya"]["cover"] |
    forestryMB["pine"]["cover"] |
    forestryMB["plum"]["cover"] |
    forestryMB["maple"]["cover"] |
    forestryMB["citrus"]["cover"] |
    forestryMB["giganteum"]["cover"] |
    forestryMB["ipe"]["cover"] |
    forestryMB["padauk"]["cover"] |
    forestryMB["cocobolo"]["cover"] |
    forestryMB["zebrawood"]["cover"];
global forestryPillarMB as IIngredient = 
    forestryMB["larch"]["pillar"] |
    forestryMB["teak"]["pillar"] |
    forestryMB["acacia"]["pillar"] |
    forestryMB["lime"]["pillar"] |
    forestryMB["chestnut"]["pillar"] |
    forestryMB["wenge"]["pillar"] |
    forestryMB["baobab"]["pillar"] |
    forestryMB["sequoia"]["pillar"] |
    forestryMB["kapok"]["pillar"] |
    forestryMB["ebony"]["pillar"] |
    forestryMB["mahogany"]["pillar"] |
    forestryMB["balsa"]["pillar"] |
    forestryMB["willow"]["pillar"] |
    forestryMB["walnut"]["pillar"] |
    forestryMB["greenheart"]["pillar"] |
    forestryMB["cherry"]["pillar"] |
    forestryMB["mahoe"]["pillar"] |
    forestryMB["poplar"]["pillar"] |
    forestryMB["palm"]["pillar"] |
    forestryMB["papaya"]["pillar"] |
    forestryMB["pine"]["pillar"] |
    forestryMB["plum"]["pillar"] |
    forestryMB["maple"]["pillar"] |
    forestryMB["citrus"]["pillar"] |
    forestryMB["giganteum"]["pillar"] |
    forestryMB["ipe"]["pillar"] |
    forestryMB["padauk"]["pillar"] |
    forestryMB["cocobolo"]["pillar"] |
    forestryMB["zebrawood"]["pillar"];
global forestryPostMB as IIngredient = 
    forestryMB["larch"]["post"] |
    forestryMB["teak"]["post"] |
    forestryMB["acacia"]["post"] |
    forestryMB["lime"]["post"] |
    forestryMB["chestnut"]["post"] |
    forestryMB["wenge"]["post"] |
    forestryMB["baobab"]["post"] |
    forestryMB["sequoia"]["post"] |
    forestryMB["kapok"]["post"] |
    forestryMB["ebony"]["post"] |
    forestryMB["mahogany"]["post"] |
    forestryMB["balsa"]["post"] |
    forestryMB["willow"]["post"] |
    forestryMB["walnut"]["post"] |
    forestryMB["greenheart"]["post"] |
    forestryMB["cherry"]["post"] |
    forestryMB["mahoe"]["post"] |
    forestryMB["poplar"]["post"] |
    forestryMB["palm"]["post"] |
    forestryMB["papaya"]["post"] |
    forestryMB["pine"]["post"] |
    forestryMB["plum"]["post"] |
    forestryMB["maple"]["post"] |
    forestryMB["citrus"]["post"] |
    forestryMB["giganteum"]["post"] |
    forestryMB["ipe"]["post"] |
    forestryMB["padauk"]["post"] |
    forestryMB["cocobolo"]["post"] |
    forestryMB["zebrawood"]["post"];
global forestryStripMB as IIngredient = 
    forestryMB["larch"]["strip"] |
    forestryMB["teak"]["strip"] |
    forestryMB["acacia"]["strip"] |
    forestryMB["lime"]["strip"] |
    forestryMB["chestnut"]["strip"] |
    forestryMB["wenge"]["strip"] |
    forestryMB["baobab"]["strip"] |
    forestryMB["sequoia"]["strip"] |
    forestryMB["kapok"]["strip"] |
    forestryMB["ebony"]["strip"] |
    forestryMB["mahogany"]["strip"] |
    forestryMB["balsa"]["strip"] |
    forestryMB["willow"]["strip"] |
    forestryMB["walnut"]["strip"] |
    forestryMB["greenheart"]["strip"] |
    forestryMB["cherry"]["strip"] |
    forestryMB["mahoe"]["strip"] |
    forestryMB["poplar"]["strip"] |
    forestryMB["palm"]["strip"] |
    forestryMB["papaya"]["strip"] |
    forestryMB["pine"]["strip"] |
    forestryMB["plum"]["strip"] |
    forestryMB["maple"]["strip"] |
    forestryMB["citrus"]["strip"] |
    forestryMB["giganteum"]["strip"] |
    forestryMB["ipe"]["strip"] |
    forestryMB["padauk"]["strip"] |
    forestryMB["cocobolo"]["strip"] |
    forestryMB["zebrawood"]["strip"];
global forestryNotchMB as IIngredient = 
    forestryMB["larch"]["notch"] |
    forestryMB["teak"]["notch"] |
    forestryMB["acacia"]["notch"] |
    forestryMB["lime"]["notch"] |
    forestryMB["chestnut"]["notch"] |
    forestryMB["wenge"]["notch"] |
    forestryMB["baobab"]["notch"] |
    forestryMB["sequoia"]["notch"] |
    forestryMB["kapok"]["notch"] |
    forestryMB["ebony"]["notch"] |
    forestryMB["mahogany"]["notch"] |
    forestryMB["balsa"]["notch"] |
    forestryMB["willow"]["notch"] |
    forestryMB["walnut"]["notch"] |
    forestryMB["greenheart"]["notch"] |
    forestryMB["cherry"]["notch"] |
    forestryMB["mahoe"]["notch"] |
    forestryMB["poplar"]["notch"] |
    forestryMB["palm"]["notch"] |
    forestryMB["papaya"]["notch"] |
    forestryMB["pine"]["notch"] |
    forestryMB["plum"]["notch"] |
    forestryMB["maple"]["notch"] |
    forestryMB["citrus"]["notch"] |
    forestryMB["giganteum"]["notch"] |
    forestryMB["ipe"]["notch"] |
    forestryMB["padauk"]["notch"] |
    forestryMB["cocobolo"]["notch"] |
    forestryMB["zebrawood"]["notch"];
global forestryCornerMB as IIngredient = 
    forestryMB["larch"]["corner"] |
    forestryMB["teak"]["corner"] |
    forestryMB["acacia"]["corner"] |
    forestryMB["lime"]["corner"] |
    forestryMB["chestnut"]["corner"] |
    forestryMB["wenge"]["corner"] |
    forestryMB["baobab"]["corner"] |
    forestryMB["sequoia"]["corner"] |
    forestryMB["kapok"]["corner"] |
    forestryMB["ebony"]["corner"] |
    forestryMB["mahogany"]["corner"] |
    forestryMB["balsa"]["corner"] |
    forestryMB["willow"]["corner"] |
    forestryMB["walnut"]["corner"] |
    forestryMB["greenheart"]["corner"] |
    forestryMB["cherry"]["corner"] |
    forestryMB["mahoe"]["corner"] |
    forestryMB["poplar"]["corner"] |
    forestryMB["palm"]["corner"] |
    forestryMB["papaya"]["corner"] |
    forestryMB["pine"]["corner"] |
    forestryMB["plum"]["corner"] |
    forestryMB["maple"]["corner"] |
    forestryMB["citrus"]["corner"] |
    forestryMB["giganteum"]["corner"] |
    forestryMB["ipe"]["corner"] |
    forestryMB["padauk"]["corner"] |
    forestryMB["cocobolo"]["corner"] |
    forestryMB["zebrawood"]["corner"];
global forestryNookMB as IIngredient = 
    forestryMB["larch"]["nook"] |
    forestryMB["teak"]["nook"] |
    forestryMB["acacia"]["nook"] |
    forestryMB["lime"]["nook"] |
    forestryMB["chestnut"]["nook"] |
    forestryMB["wenge"]["nook"] |
    forestryMB["baobab"]["nook"] |
    forestryMB["sequoia"]["nook"] |
    forestryMB["kapok"]["nook"] |
    forestryMB["ebony"]["nook"] |
    forestryMB["mahogany"]["nook"] |
    forestryMB["balsa"]["nook"] |
    forestryMB["willow"]["nook"] |
    forestryMB["walnut"]["nook"] |
    forestryMB["greenheart"]["nook"] |
    forestryMB["cherry"]["nook"] |
    forestryMB["mahoe"]["nook"] |
    forestryMB["poplar"]["nook"] |
    forestryMB["palm"]["nook"] |
    forestryMB["papaya"]["nook"] |
    forestryMB["pine"]["nook"] |
    forestryMB["plum"]["nook"] |
    forestryMB["maple"]["nook"] |
    forestryMB["citrus"]["nook"] |
    forestryMB["giganteum"]["nook"] |
    forestryMB["ipe"]["nook"] |
    forestryMB["padauk"]["nook"] |
    forestryMB["cocobolo"]["nook"] |
    forestryMB["zebrawood"]["nook"];
