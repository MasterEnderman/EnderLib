# recipeAdd #

This is a template for adding shaped and shapeless recipes.

## Shaped Recipes ##

```java
#modloaded crafttweaker
#priority 150

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

import scripts.EnderLib.functions.craftingAdd.elAddShaped;

var recipeMap as IIngredient[][][][int][IItemStack] = {
/*
	output : {
		amount : [
			[
				[,,],
				[,,],
				[,,]
			]
		]
	}
*/
};

elAddShaped(recipeMap);
```

## Shapeless Recipes ##

```java
#modloaded crafttweaker
#priority 150

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

import scripts.EnderLib.functions.craftingAdd.elAddShapeless;

var recipeMap as IIngredient[][][int][IItemStack] = {
/*
	output : {
		amount : [
			[
			
			]
		]
	}
*/
};

elAddShapeless(recipeMap);
```