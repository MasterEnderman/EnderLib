#priority 10001

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

global modPriority as int[string] = {
    "contenttweaker" : 1000,
    "minecraft" : 900,
    "immersiveengineering" : 800,
    "ic2" : 700,
    "gregtech" : 950,
};

global unificationTools as IIngredient[string] = {
    "UNI_hammer" : <minecraft:iron_pickaxe>.transformDamage(1),
    "UNI_wrench" : <base:wrench>.reuse()
};

global metalsToUnify as string[] = [
    "iron",
    "gold",
    "steel",
    "copper",
    "bronze",
    "invar",
    "nickel",
    "aluminum",
    "tin",
    "silver",
    "lead",
    "iridium",
    "platinum",
    "constantan",
    "electrum",
    "uranium",
];

global typesToUnify as string[][][][int][string] = {
    "ingot" : {
        1 : [
            [
                ["nugget","nugget","nugget"],
                ["nugget","nugget","nugget"],
                ["nugget","nugget","nugget"]
            ]
        ],
        9 : [
            [
                ["block"]
            ]
        ]
    },
    "plate" : {
        1 : [
            [
                ["ingot","ingot"],
                ["ingot","ingot"]
            ],
            [
                ["UNI_hammer"],
                ["ingot"],
                ["ingot"]
            ]
        ]
    },
    "gear" : {
        1 : [
            [
                ["stick","plate","stick"],
                ["plate","UNI_wrench","plate"],
                ["stick","plate","stick"]
            ]
        ]
    },
    "stick" : {
        4 : [
            [
                ["ingot"],
                ["ingot"]
            ]
        ]
    },
    "dust" : {
        1 : [
            [
                ["UNI_hammer"],
                ["ingot"]
            ],
            [
                ["dirtyDust"],
                ["FLUID_water"]
            ]
        ]
    },
    "nugget" : {
        9 : [
            [
                ["ingot"]
            ]
        ]
    },
    "block" : {
        1 : [
            [
                ["ingot","ingot","ingot"],
                ["ingot","ingot","ingot"],
                ["ingot","ingot","ingot"]
            ]
        ]
    },
    "plateDense" : {
        1 : [
            [
                ["plate","plate","plate"],
                ["plate","plate","plate"],
                ["plate","plate","plate"]
            ]
        ]
    },
    "casing" : {
        2 : [
            [
                ["UNI_hammer"],
                ["plate"]
            ]
        ]
    },
    "beam" : {
        1 : [
            [
                ["null","stick","plate"],
                ["stick","plate","stick"],
                ["plate","stick","null"]
            ]
        ]
    },
    "bolt" : {
        4 : [
            [
                ["UNI_hammer"],
                ["plate"],
                ["stick"]
            ]
        ]
    },
    "dirtyDust" : {
        2 : [
            [
                ["UNI_hammer"],
                ["ore"]
            ]
        ]
    }
};

global alloyDict as int[string][string] = {
    "invar" : {
        "iron" : 2,
        "nickel" : 1
    },
    "bronze" : {
        "copper" : 3,
        "tin" : 1
    },
    "constantan" : {
        "copper" : 1,
        "nickel" : 1
    },
    "electrum" : {
        "gold" : 1,
        "silver" : 1
    }
};