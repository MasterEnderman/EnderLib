#modloaded crafttweaker gregtech
#priority 400

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

// TL;DR Global variables need to start with "global" to be global!

global craftingToolHardHammer as IItemStack = <gregtech:meta_tool:6>;
global craftingToolFile as IItemStack = <gregtech:meta_tool:9>;
global craftingToolScrewdriver as IIngredient = <gregtech:meta_tool:11> | <gregtech:meta_tool:34>;
global craftingToolMortar as IItemStack = <gregtech:meta_tool:12>;
global craftingToolKnife as IItemStack = <gregtech:meta_tool:17>;
global craftingToolWrench as IIngredient = <gregtech:meta_tool:8> | <gregtech:meta_tool:29> | <gregtech:meta_tool:30> | <gregtech:meta_tool:31>; 
global craftingToolSaw as IIngredient = <gregtech:meta_tool:5> | <gregtech:meta_tool:26> | <gregtech:meta_tool:27> | <gregtech:meta_tool:28>;

global craftingToolPickaxe as IIngredient = <gregtech:meta_tool:25> | <gregtech:meta_tool:1> | <gregtech:meta_tool:32>;
global craftingToolAxe as IIngredient = <gregtech:meta_tool:3> | <gregtech:meta_tool:26> | <gregtech:meta_tool:27> | <gregtech:meta_tool:28>;

global craftingToolScoop as IIngredient = <gregtech:meta_tool:14>;

global moldSmallGear as IIngredient = <gregtech:meta_item_1:32317>;
global moldName as IIngredient = <gregtech:meta_item_1:32315>;
global moldAnvil as IIngredient = <gregtech:meta_item_1:32314>;
global moldCylinder as IIngredient = <gregtech:meta_item_1:32313>;
global moldNugget as IIngredient = <gregtech:meta_item_1:32309>;
global moldBlock as IIngredient = <gregtech:meta_item_1:32308>;
global moldBall as IIngredient = <gregtech:meta_item_1:32307>;
global moldIngot as IIngredient = <gregtech:meta_item_1:32306>;
global moldBottle as IIngredient = <gregtech:meta_item_1:32305>;
global moldCoinage as IIngredient = <gregtech:meta_item_1:32304>;
global moldGear as IIngredient = <gregtech:meta_item_1:32303>;
global moldPlate as IIngredient = <gregtech:meta_item_1:32301>;

global shapeBottle as IIngredient = <gregtech:meta_item_1:32373>;
global shapeGear as IIngredient = <gregtech:meta_item_1:32372>;
global shapeSawBlade as IIngredient = <gregtech:meta_item_1:32371>;
global shapeFileHead as IIngredient = <gregtech:meta_item_1:32370>;
global shapeHammerHead as IIngredient = <gregtech:meta_item_1:32369>;
global shapeHoeHead as IIngredient = <gregtech:meta_item_1:32368>;
global shapeAxeHead as IIngredient = <gregtech:meta_item_1:32367>;
global shapeShovelHead as IIngredient = <gregtech:meta_item_1:32366>;
global shapePickaxeHead as IIngredient = <gregtech:meta_item_1:32365>;
global shapeSwordBlade as IIngredient = <gregtech:meta_item_1:32364>;
global shapeBlock as IIngredient = <gregtech:meta_item_1:32363>;
global shapeLargePipe as IIngredient = <gregtech:meta_item_1:32361>;
global shapeNormalPipe as IIngredient = <gregtech:meta_item_1:32360>;
global shapeSmallPipe as IIngredient = <gregtech:meta_item_1:32359>;
global shapeTinyPipe as IIngredient = <gregtech:meta_item_1:32358>;
global shapeWire as IIngredient = <gregtech:meta_item_1:32356>;
global shapeIngot as IIngredient = <gregtech:meta_item_1:32355>;
global shapeCell as IIngredient = <gregtech:meta_item_1:32354>;
global shapeRing as IIngredient = <gregtech:meta_item_1:32353>;
global shapeBolt as IIngredient = <gregtech:meta_item_1:32352>;
global shapeRod as IIngredient = <gregtech:meta_item_1:32351>;
global shapePlate as IIngredient = <gregtech:meta_item_1:32350>;

global gtMeta as IItemStack[string][string] = {
    "LV" : {
        "motor" : <gregtech:meta_item_1:32600>,
        "piston" : <gregtech:meta_item_1:32640>,
        "conveyor" : <gregtech:meta_item_1:32630>,
        "pump" : <gregtech:meta_item_1:32610>,
        "roboarm" : <gregtech:meta_item_1:32650>,
        "sensor" : <gregtech:meta_item_1:32690>,
        "emitter" : <gregtech:meta_item_1:32680>,
        "fieldgenerator" : <gregtech:meta_item_1:32670>,
        "hull" : <gregtech:machine:501>,
        "casing" : <gregtech:machine_casing:1>
    },
    "MV" : {
        "motor" : <gregtech:meta_item_1:32601>,
        "piston" : <gregtech:meta_item_1:32641>,
        "conveyor" : <gregtech:meta_item_1:32631>,
        "pump" : <gregtech:meta_item_1:32611>,
        "roboarm" : <gregtech:meta_item_1:32651>,
        "sensor" : <gregtech:meta_item_1:32691>,
        "emitter" : <gregtech:meta_item_1:32681>,
        "fieldgenerator" : <gregtech:meta_item_1:32671>,
        "hull" : <gregtech:machine:502>,
        "casing" : <gregtech:machine_casing:2>
    },
    "HV" : {
        "motor" : <gregtech:meta_item_1:32602>,
        "piston" : <gregtech:meta_item_1:32642>,
        "conveyor" : <gregtech:meta_item_1:32632>,
        "pump" : <gregtech:meta_item_1:32612>,
        "roboarm" : <gregtech:meta_item_1:32652>,
        "sensor" : <gregtech:meta_item_1:32692>,
        "emitter" : <gregtech:meta_item_1:32682>,
        "fieldgenerator" : <gregtech:meta_item_1:32672>,
        "hull" : <gregtech:machine:503>,
        "casing" : <gregtech:machine_casing:3>
    },
    "EV" : {
        "motor" : <gregtech:meta_item_1:32603>,
        "piston" : <gregtech:meta_item_1:32643>,
        "conveyor" : <gregtech:meta_item_1:32633>,
        "pump" : <gregtech:meta_item_1:32613>,
        "roboarm" : <gregtech:meta_item_1:32653>,
        "sensor" : <gregtech:meta_item_1:32693>,
        "emitter" : <gregtech:meta_item_1:32683>,
        "fieldgenerator" : <gregtech:meta_item_1:32673>,
        "hull" : <gregtech:machine:504>,
        "casing" : <gregtech:machine_casing:4>
    },
    "IV" : {
        "motor" : <gregtech:meta_item_1:32604>,
        "piston" : <gregtech:meta_item_1:32644>,
        "conveyor" : <gregtech:meta_item_1:32634>,
        "pump" : <gregtech:meta_item_1:32614>,
        "roboarm" : <gregtech:meta_item_1:32654>,
        "sensor" : <gregtech:meta_item_1:32694>,
        "emitter" : <gregtech:meta_item_1:32684>,
        "fieldgenerator" : <gregtech:meta_item_1:32674>,
        "hull" : <gregtech:machine:505>,
        "casing" : <gregtech:machine_casing:5>
    },
    "LuV" : {
        "motor" : <gregtech:meta_item_1:32606>,
        "piston" : <gregtech:meta_item_1:32645>,
        "conveyor" : <gregtech:meta_item_1:32635>,
        "pump" : <gregtech:meta_item_1:32615>,
        "roboarm" : <gregtech:meta_item_1:32655>,
        "sensor" : <gregtech:meta_item_1:32695>,
        "emitter" : <gregtech:meta_item_1:32685>,
        "fieldgenerator" : <gregtech:meta_item_1:32675>,
        "hull" : <gregtech:machine:506>,
        "casing" : <gregtech:machine_casing:6>
    },
    "ZPM" : {
        "motor" : <gregtech:meta_item_1:32607>,
        "piston" : <gregtech:meta_item_1:32646>,
        "conveyor" : <gregtech:meta_item_1:32636>,
        "pump" : <gregtech:meta_item_1:32616>,
        "roboarm" : <gregtech:meta_item_1:32656>,
        "sensor" : <gregtech:meta_item_1:32696>,
        "emitter" : <gregtech:meta_item_1:32686>,
        "fieldgenerator" : <gregtech:meta_item_1:32676>,
        "hull" : <gregtech:machine:507>,
        "casing" : <gregtech:machine_casing:7>
    },
    "UV" : {
        "motor" : <gregtech:meta_item_1:32608>,
        "piston" : <gregtech:meta_item_1:32647>,
        "conveyor" : <gregtech:meta_item_1:32637>,
        "pump" : <gregtech:meta_item_1:32617>,
        "roboarm" : <gregtech:meta_item_1:32657>,
        "sensor" : <gregtech:meta_item_1:32697>,
        "emitter" : <gregtech:meta_item_1:32687>,
        "fieldgenerator" : <gregtech:meta_item_1:32677>,
        "hull" : <gregtech:machine:508>,
        "casing" : <gregtech:machine_casing:8>
    },
};

global gtBattery as IIngredient[string][string] = {
    "tiny" : {
        "reuse" : <gregtech:meta_item_1:32499>
    },
    "small" : {
        "single" : <gregtech:meta_item_1:32511>|<gregtech:meta_item_1:32510>,
        "reuse" : <gregtech:meta_item_1:32519>|<gregtech:meta_item_1:32518>|<gregtech:meta_item_1:32517>
    },
    "medium" : {
        "single" : <gregtech:meta_item_1:32521>|<gregtech:meta_item_1:32520>,
        "reuse" : <gregtech:meta_item_1:32529>|<gregtech:meta_item_1:32528>|<gregtech:meta_item_1:32527>
    },
    "large": {
        "single" : <gregtech:meta_item_1:32530>|<gregtech:meta_item_1:32531>,
        "reuse" : <gregtech:meta_item_1:32537>|<gregtech:meta_item_1:32538>|<gregtech:meta_item_1:32539>
    },
    "ultimate" : {
        "reuse" : <gregtech:meta_item_1:32605>
    }
};

global gtCell as IIngredient[string] = {
    "small" : <gregtech:meta_item_1:32762>,
    "medium" : <gregtech:meta_item_1:32405>,
    "large" : <gregtech:meta_item_1:32406>
};
