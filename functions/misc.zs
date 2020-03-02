#modloaded crafttweaker
#priority 500

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

function toString(item as IIngredient) as string {
	return item.commandString.replace("<","").replace(">","");
}

function stringToLiquid(fluid as string) as ILiquidStack {
    var bucket as IItemStack = <minecraft:bucket>;

    if (fluid == "water") {
        bucket = <minecraft:water_bucket>;
    }
    if (fluid == "lava") {
        bucket = <minecraft:lava_bucket>;
    }
    if (fluid != "lava" & fluid != "water") {
        bucket = <forge:bucketfilled>.withTag({FluidName: fluid, Amount: 1000});
    }

    for liquid in bucket.liquids {
        return liquid;
    }  
}

function getBucket(fluid as string, bucket as IItemStack) as IItemStack {
    return bucket.withTag({FluidName: fluid, Amount: 1000});
}

function getBucketDefault(fluid as string) as IItemStack {
    if (fluid == "water") {
        return <minecraft:water_bucket>;
    }
    if (fluid == "lava") {
        return <minecraft:lava_bucket>;
    }
    if (fluid != "water" & fluid != "lava") {
        return getBucket(fluid, <forge:bucketfilled>);
    }
}