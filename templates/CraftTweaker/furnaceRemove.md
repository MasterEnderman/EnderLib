# furnaceRemove #

This is a template for managing Furnace Recipes.

## Remove Furnace Recipes ##

This function iterates through a list to remove all furnace recipes of the given items.

```java
#modloaded crafttweaker
#priority 110

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

import scripts.EnderLib.functions.furnace.elFurnaceRemove;

var removeList as IIngredient[] = [

];

elFurnaceRemove(removeList);
```

## Remove Furnace Recipes with Filter ##

This function iterates through a map of furnae recipes and removes onyl the given entries.

```java
#modloaded crafttweaker
#priority 110

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

import scripts.EnderLib.functions.furnace.elFurnaceRemove;

var removeFilterMap as IIngredient[][IIngredient] = [

];

elFurnaceRemove(removeFilterMap);
```