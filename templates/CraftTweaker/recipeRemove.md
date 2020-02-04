# recipeRemove #

This is a template for a recipe removal script, which is used to remove different recipes in various ways, e.g. by output, modid or recipename. To specify a recipe or multiple recipes, add the required values into the Arrays.

```java
#modloaded crafttweaker
#priority 200

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

import scripts.EnderLib.functions.craftingRemove.elRmAll;
import scripts.EnderLib.functions.craftingRemove.elRmMod;
import scripts.EnderLib.functions.craftingRemove.elRmName;
import scripts.EnderLib.functions.craftingRemove.elRmShaped;
import scripts.EnderLib.functions.craftingRemove.elRmShapeless;

var removeAll as IIngredient[] = [

];

var removeShaped as IIngredient[] = [

];

var removeShapeless as IIngredient[] = [

];

var removeName as string[] = [

];

var removeMod as string[] = [

];

elRmAll(removeAll);
elRmMod(removeMod);
elRmName(removeName);
elRmShaped(removeShaped);
elRmShapeless(removeShapeless);

```
