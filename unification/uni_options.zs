#priority 10001

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

// Enable Unification Scripts?
static UNIFICATIONMASTER as bool = true;

// Use tools in recipes?
static useTools as bool = true;

//JEI
static JEIMASTER as bool = true;
static JEIOres as bool = true;

//Immersive Engineering
static IEMASTER as bool = true;

static IESlagItem as string = "immersiveengineering:material:7";

static IECrusherRemoveRecipes as bool = true;
static IECrusherAddRecipes as bool = true;
static IECrusherEnergy as int  = 2048;
static IECrusherMultiplier as int = 2;

static IEKilnRemoveRecipes as bool = true;
static IEKilnAddRecipes as bool = true;
static IEKilnTime as int = 200;

static IEMetalPressRemoveRecipes as bool = true;
static IEMetalPressAddRecipes as bool = true;
static IEMetalPressEnergy as int = 2048;

static IEMetalPressMoldPlate as string = "immersiveengineering:mold:0";
static IEMetalPressMoldPlateAmountInput as int = 1;
static IEMetalPressMoldPlateAmountOutput as int = 1;

static IEMetalPressMoldStick as string = "immersiveengineering:mold:2";
static IEMetalPressMoldStickAmountInput as int = 1;
static IEMetalPressMoldStickAmountOutput as int = 2;

static IEMetalPressMoldGear as string = "immersiveengineering:mold:1";
static IEMetalPressMoldGearAmountInput as int = 4;
static IEMetalPressMoldGearAmountOutput as int = 1;

static IEArcFurnaceRemoveRecipes as bool = true;
static IEArcFurnaceAddRecipes as bool = true;
static IEArcFurnaceEnergy as int = 512;

static IEArcFurnaceAddSmelt as bool = true;
static IEArcFurnaceTimeSmelt as int = 100;

static IEArcFurnaceAddOre as bool = true;
static IEArcFurnaceTimeOre as int = 200;
static IEArcFurnaceMultiplierOre as int = 2;

static IEArcFurnaceAddSteel as bool = true;
static IEArcFurnaceTimeSteel as int = 400;

static IEArcFurnaceAddAlloy as bool = true;
static IEArcFurnaceTimeAlloy as int = 200;

static IEBlastFurnaceRemoveRecipes as bool = true;
static IEBlastFurnaceAddRecipes as bool = true;
static IEBlastFurnaceTime as int = 1200;

// Tinker's Construct

static TiCoMASTER as bool = true;

static TiCoRemoveRecipes as bool = true;
static TiCoAddRecipes as bool = true;

static TiCoCastRemoveRecipes as bool = true;
static TiCoCastAddRecipes as bool = true;

static TiCoCastGear as string = "tconstruct:cast_custom:4";
static TiCoCastPlate as string = "tconstruct:cast_custom:3";
static TiCoCastNugget as string = "tconstruct:cast_custom:1";
static TiCoCastIngot as string = "tconstruct:cast_custom";

static TiCoMultiplierGear as int = 4;
static TiCoMultiplierPlate as int = 1;

//Thermal Expansion
static TEremove as bool = true;
static TEadd as bool = false;