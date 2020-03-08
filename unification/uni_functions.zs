#priority 10000

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

import scripts.EnderLib.unification.uni_options.useTools;

// External Variables

global unification_recipeCheck as bool = true;
global unification_liquidToIngot as int = 144;

// Functions

function toString(item as IIngredient) as string {
	return item.commandString.replace("<","").replace(">","");
}

function getOreDict(dict as string, material as string) as IIngredient {
    if (dict == "null" | material == "null") {
        return null;
    } else {
        return oreDict.get(dict~material.substring(0,1).toUpperCase()~material.substring(1).toLowerCase());
    }
}

function getItem(mod as string, item as string) as IItemStack {
    return itemUtils.getItem(mod~":"~item);
}

function getItemAny(mod as string, item as string) as IItemStack {
    return itemUtils.getItem(mod~":"~item,32767);
}

function getItemMeta(mod as string, item as string, meta as int) as IItemStack {
    return itemUtils.getItem(mod~":"~item,meta);
}

function getItemString(input as string) as IItemStack {
    var counter as int = 0;
    var star as int = 0;
    var mod as string = "";
    var item as string = "";
    var meta as string = "";
    for symbol in getArrayString(input) {
        if (symbol == ":") {
            counter += 1;
        }
        if (symbol == "*") {
            star += 1;
        }
        if (counter == 0 & symbol != ":") {
            mod += symbol;
        }
        if (counter == 1 & symbol != ":") {
            item += symbol;
        }
        if (counter == 2 & symbol != ":") {
            meta += symbol;
        }
    }
    if (star >= 1) {
        return getItemAny(mod,item);
    }
    if (counter == 1) {
        return getItem(mod,item);
    } else {
        return getItemMeta(mod,item,meta as int);
    }
}

function getArrayString(line as string) as string[] {
    var array as string[] = [];
    for i in 0 .. line.length {
        array += line[i];
    }
    return array;
}

function getFluid(fluid as string) as ILiquidStack {
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
        return liquid.definition * 1;
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

function getModlist() as string[] {
    return sortBig(modPriority);
}

function removeAllRecipes() {
    for metal in metalsToUnify {
        for type in typesToUnify.keys {
            recipes.remove(getOreDict(type,metal));
        }
        furnace.remove(getOreDict("ingot",metal));
        furnace.remove(getOreDict("nugget",metal));
    }
}

function findFirstItem(modlist as string[], type as string, material as string) as IItemStack {
    for mod in modlist {
        for item in getOreDict(type,material).items {
            if (mod == item.definition.owner) {
                return item;
            }
        }
    }
}

function findFirstItemDefault(type as string, material as string) as IItemStack {
    return findFirstItem(getModlist(),type,material);
}

function addFurnaceRecipes(modlist as string[]) {
    for metal in metalsToUnify {
        if (getOreDict("ore",metal).items.length >= 1) {
            furnace.addRecipe(findFirstItem(modlist, "ingot", metal), getOreDict("ore",metal));
        }
        if (getOreDict("dust",metal).items.length >= 1) {
            furnace.addRecipe(findFirstItem(modlist, "ingot", metal), getOreDict("dust",metal));
        }
    }
}

function addCraftingRecipes(modlist as string[]) {
    for metal in metalsToUnify {
        for type, data in typesToUnify {
            if (getOreDict(type,metal).items.length >= 1) {
                for amount, data_2 in data {
                    var index as int = 0;
                    for craft in data_2 {
                        unification_recipeCheck = true;
                        registerRecipe(modlist,index,type,metal,amount,craft);
                        index += 1;
                    }
                }
            } else {
                print("[UNIFICATION] Did not find an Item for "~type~"_"~metal);
            }
        }
    }
}

function registerRecipe(modlist as string[], index as int, type as string, metal as string, amount as int, craft as string[][]) {
    var recipe = getRecipeArray(index,type,metal,amount,craft);
    if (unification_recipeCheck) {
        var name as string = "unification_"~type~"_"~metal~"_"~amount~"_"~index;
        recipes.addShaped(name,findFirstItem(modlist, type, metal) * amount,recipe);
    }
}

function getRecipeArray(index as int, type as string, metal as string, amount as int, grid as string[][]) as IIngredient[][] {
    var shape = getShape(grid);
    if (shape == "100-000-000") {
        return [
            [checkIngredient(amount,index,0,0,type,metal)]
        ];
    }
    if (shape == "111-111-111") {
        return [
            [checkIngredient(amount,index,0,0,type,metal),checkIngredient(amount,index,0,1,type,metal),checkIngredient(amount,index,0,2,type,metal)],
            [checkIngredient(amount,index,1,0,type,metal),checkIngredient(amount,index,1,1,type,metal),checkIngredient(amount,index,1,2,type,metal)],
            [checkIngredient(amount,index,2,0,type,metal),checkIngredient(amount,index,2,1,type,metal),checkIngredient(amount,index,2,2,type,metal)]
        ];
    }
    if (shape == "110-110-000") {
        return [
            [checkIngredient(amount,index,0,0,type,metal),checkIngredient(amount,index,0,1,type,metal)],
            [checkIngredient(amount,index,1,0,type,metal),checkIngredient(amount,index,1,1,type,metal)]
        ];
    }
    if (shape == "100-100-100") {
        return [
            [checkIngredient(amount,index,0,0,type,metal)],
            [checkIngredient(amount,index,1,0,type,metal)],
            [checkIngredient(amount,index,2,0,type,metal)]
        ];
    }
    if (shape == "100-100-000") {
        return [
            [checkIngredient(amount,index,0,0,type,metal)],
            [checkIngredient(amount,index,1,0,type,metal)]
        ];
    }
    print("[UNIFICATION] Did not found a matching recipe array template for "~type~"!");
}

function getShape(grid as string[][]) as string {
    var space1 as int = 0;
    var space2 as int = 0;
    var space3 as int = 0;
    var space4 as int = 0;
    var space5 as int = 0;
    var space6 as int = 0;
    var space7 as int = 0;
    var space8 as int = 0;
    var space9 as int = 0;
    if (grid.length >= 1) {
        if (grid[0].length >= 1) {
            space1 = 1;
        }
        if (grid[0].length >= 2) {
            space2 = 1;
        }
        if (grid[0].length >= 3) {
            space3 = 1;
        }

        if (grid.length >= 2) {
            if (grid[1].length >= 1) {
                space4 = 1;
            }
            if (grid[1].length >= 2) {
                space5 = 1;
            }
            if (grid[1].length >= 3) {
                space6 = 1;
            }

            if (grid.length >= 3) {
                if (grid[2].length >= 1) {
                    space7 = 1;
                }
                if (grid[2].length >= 2) {
                    space8 = 1;
                }
                if (grid[2].length >= 3) {
                    space9 = 1;
                }
            }
        }
    }
    return space1~space2~space3~"-"~space4~space5~space6~"-"~space7~space8~space9;
}

function checkIngredient(amount as int, index as int, pos1 as int, pos2 as int, type as string, metal as string) as IIngredient {
    if (typesToUnify[type][amount][index][pos1][pos2] == "null") {
        return null;
    }
    if (typesToUnify[type][amount][index][pos1][pos2] in "FLUID_") {
        return getBucketDefault(typesToUnify[type][amount][index][pos1][pos2].substring(6));
    }
    if (typesToUnify[type][amount][index][pos1][pos2] in "UNI_") {
        if (useTools) {
            return unificationTools[typesToUnify[type][amount][index][pos1][pos2]];
        } else {
            return null;
        }
    }
    if (typesToUnify[type][amount][index][pos1][pos2] in ":") {
        return itemUtils.getItem(typesToUnify[type][amount][index][pos1][pos2]);
    } else {
        if (getOreDict(typesToUnify[type][amount][index][pos1][pos2],metal).items.length >= 1) {
            return getOreDict(typesToUnify[type][amount][index][pos1][pos2],metal);
        } else {
            unification_recipeCheck = false;
        }
    }
}

function sortBig(list as int[string]) as string[] {
    var nums as int[] = [];
    var nums_mod as int[] = [];
    var sort as int[] = [];
    var mods as string[] = [];
    var i as int = 0;
    for mod, prio in list {
        if (loadedMods in mod) {
            nums += prio;
        }
    }
    nums_mod = nums;
    while (nums.length != 0) {
        nums = [];
        for entry in nums_mod {
            if (entry != i) {
                nums += entry;
            }
        }
        i = 0;
        for entry in nums {
            if (entry > i) {
                i = entry;
            }
        }
        sort += i;
        nums_mod = nums;
    }
    for entry in sort {
        for key, value in list {
            if (entry == value) {
                mods += key;
            }
        }
    }
    return mods;
}

function sortSmall(list as int[string]) as string[] {
    var nums as int[] = [];
    var nums_mod as int[] = [];
    var sort as int[] = [];
    var mods as string[] = [];
    var i as int = 0;
    for mod, prio in list {
        if (loadedMods in mod) {
            nums += prio;
        }
    }
    nums_mod = nums;
    while (nums.length != 0) {
        nums = [];
        for entry in nums_mod {
            if (entry != i) {
                nums += entry;
            }
        }
        i = 2147483;
        for entry in nums {
            if (entry < i) {
                i = entry;
            }
        }
        sort += i;
        nums_mod = nums;
    }
    for entry in sort {
        for key, value in list {
            if (entry == value) {
                mods += key;
            }
        }
    }
    return mods;
}