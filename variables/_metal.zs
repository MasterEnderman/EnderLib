#modloaded crafttweaker minecraft
#priority 400

import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import crafttweaker.liquid.ILiquidDefinition;
import crafttweaker.liquid.ILiquidStack;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

// TL;DR Global variables need to start with "global" to be global!

global metal as IIngredient[string][string] = {
    "iron" : {
        "ingot" : <ore:ingotIron>,
        "block" : <ore:blockIron>,
        "nugget" : <ore:nuggetIron>,
        "dust" : <ore:dustIron>,
        "plate" : <ore:plateIron>,
        "gear" : <ore:gearIron>,
        "stick" : <ore:stickIron>,
        "rod" : <ore:rodIron>
    },
    "gold" : {
        "ingot" : <ore:ingotGold>,
        "block" : <ore:blockGold>,
        "nugget" : <ore:nuggetGold>,
        "dust" : <ore:dustGold>,
        "plate" : <ore:plateGold>,
        "gear" : <ore:gearGold>,
        "stick" : <ore:stickGold>,
        "rod" : <ore:rodGold>
    },
    "copper" : {
        "ingot" : <ore:ingotCopper>,
        "block" : <ore:blockCopper>,
        "nugget" : <ore:nuggetCopper>,
        "dust" : <ore:dustCopper>,
        "plate" : <ore:plateCopper>,
        "gear" : <ore:gearCopper>,
        "stick" : <ore:stickCopper>,
        "rod" : <ore:rodCopper>
    },
    "tin" : {
        "ingot" : <ore:ingotTin>,
        "block" : <ore:blockTin>,
        "nugget" : <ore:nuggetTin>,
        "dust" : <ore:dustTin>,
        "plate" : <ore:plateTin>,
        "gear" : <ore:gearTin>,
        "stick" : <ore:stickTin>,
        "rod" : <ore:rodTin>
    },
    "silver" : {
        "ingot" : <ore:ingotSilver>,
        "block" : <ore:blockSilver>,
        "nugget" : <ore:nuggetSilver>,
        "dust" : <ore:dustSilver>,
        "plate" : <ore:plateSilver>,
        "gear" : <ore:gearSilver>,
        "stick" : <ore:stickSilver>,
        "rod" : <ore:rodSilver>
    },
    "lead" : {
        "ingot" : <ore:ingotLead>,
        "block" : <ore:blockLead>,
        "nugget" : <ore:nuggetLead>,
        "dust" : <ore:dustLead>,
        "plate" : <ore:plateLead>,
        "gear" : <ore:gearLead>,
        "stick" : <ore:stickLead>,
        "rod" : <ore:rodLead>
    },
    "aluminum" : {
        "ingot" : <ore:ingotAluminum>,
        "block" : <ore:blockAluminum>,
        "nugget" : <ore:nuggetAluminum>,
        "dust" : <ore:dustAluminum>,
        "plate" : <ore:plateAluminum>,
        "gear" : <ore:gearAluminum>,
        "stick" : <ore:stickAluminum>,
        "rod" : <ore:rodAluminum>
    },
    "nickel" : {
        "ingot" : <ore:ingotNickel>,
        "block" : <ore:blockNickel>,
        "nugget" : <ore:nuggetNickel>,
        "dust" : <ore:dustNickel>,
        "plate" : <ore:plateNickel>,
        "gear" : <ore:gearNickel>,
        "stick" : <ore:stickNickel>,
        "rod" : <ore:rodNickel>
    },
    "platinum" : {
        "ingot" : <ore:ingotPlatinum>,
        "block" : <ore:blockPlatinum>,
        "nugget" : <ore:nuggetPlatinum>,
        "dust" : <ore:dustPlatinum>,
        "plate" : <ore:platePlatinum>,
        "gear" : <ore:gearPlatinum>,
        "stick" : <ore:stickPlatinum>,
        "rod" : <ore:rodPlatinum>
    },
    "iridium" : {
        "ingot" : <ore:ingotIridium>,
        "block" : <ore:blockIridium>,
        "nugget" : <ore:nuggetIridium>,
        "dust" : <ore:dustIridium>,
        "plate" : <ore:plateIridium>,
        "gear" : <ore:gearIridium>,
        "stick" : <ore:stickIridium>,
        "rod" : <ore:rodIridium>
    },
    "mithril" : {
        "ingot" : <ore:ingotMithril>,
        "block" : <ore:blockMithril>,
        "nugget" : <ore:nuggetMithril>,
        "dust" : <ore:dustMithril>,
        "plate" : <ore:plateMithril>,
        "gear" : <ore:gearMithril>,
        "stick" : <ore:stickMithril>,
        "rod" : <ore:rodMithril>
    },
    "steel" : {
        "ingot" : <ore:ingotSteel>,
        "block" : <ore:blockSteel>,
        "nugget" : <ore:nuggetSteel>,
        "dust" : <ore:dustSteel>,
        "plate" : <ore:plateSteel>,
        "gear" : <ore:gearSteel>,
        "stick" : <ore:stickSteel>,
        "rod" : <ore:rodSteel>
    },
    "electrum" : {
        "ingot" : <ore:ingotElectrum>,
        "block" : <ore:blockElectrum>,
        "nugget" : <ore:nuggetElectrum>,
        "dust" : <ore:dustElectrum>,
        "plate" : <ore:plateElectrum>,
        "gear" : <ore:gearElectrum>,
        "stick" : <ore:stickElectrum>,
        "rod" : <ore:rodElectrum>
    },
    "invar" : {
        "ingot" : <ore:ingotInvar>,
        "block" : <ore:blockInvar>,
        "nugget" : <ore:nuggetInvar>,
        "dust" : <ore:dustInvar>,
        "plate" : <ore:plateInvar>,
        "gear" : <ore:gearInvar>,
        "stick" : <ore:stickInvar>,
        "rod" : <ore:rodInvar>
    },
    "bronze" : {
        "ingot" : <ore:ingotBronze>,
        "block" : <ore:blockBronze>,
        "nugget" : <ore:nuggetBronze>,
        "dust" : <ore:dustBronze>,
        "plate" : <ore:plateBronze>,
        "gear" : <ore:gearBronze>,
        "stick" : <ore:stickBronze>,
        "rod" : <ore:rodBronze>
    },
    "constantan" : {
        "ingot" : <ore:ingotConstantan>,
        "block" : <ore:blockConstantan>,
        "nugget" : <ore:nuggetConstantan>,
        "dust" : <ore:dustConstantan>,
        "plate" : <ore:plateConstantan>,
        "gear" : <ore:gearConstantan>,
        "stick" : <ore:stickConstantan>,
        "rod" : <ore:rodConstantan>
    },
    "signalum" : {
        "ingot" : <ore:ingotSignalum>,
        "block" : <ore:blockSignalum>,
        "nugget" : <ore:nuggetSignalum>,
        "dust" : <ore:dustSignalum>,
        "plate" : <ore:plateSignalum>,
        "gear" : <ore:gearSignalum>,
        "stick" : <ore:stickSignalum>,
        "rod" : <ore:rodSignalum>
    },
    "lumium" : {
        "ingot" : <ore:ingotLumium>,
        "block" : <ore:blockLumium>,
        "nugget" : <ore:nuggetLumium>,
        "dust" : <ore:dustLumium>,
        "plate" : <ore:plateLumium>,
        "gear" : <ore:gearLumium>,
        "stick" : <ore:stickLumium>,
        "rod" : <ore:rodLumium>
    },
    "enderium" : {
        "ingot" : <ore:ingotEnderium>,
        "block" : <ore:blockEnderium>,
        "nugget" : <ore:nuggetEnderium>,
        "dust" : <ore:dustEnderium>,
        "plate" : <ore:plateEnderium>,
        "gear" : <ore:gearEnderium>,
        "stick" : <ore:stickEnderium>,
        "rod" : <ore:rodEnderium>
    },
    "electrumFlux" : {
        "ingot" : <ore:ingotElectrumFlux>,
        "block" : <ore:blockElectrumFlux>,
        "nugget" : <ore:nuggetElectrumFlux>,
        "dust" : <ore:gearElectrumFlux>,
        "plate" : <ore:dustElectrumFlux>,
        "gear" : <ore:plateElectrumFlux>,
        "stick" : <ore:stickElectrumFlux>,
        "rod" : <ore:rodElectrumFlux>
    },
    "uranium" : {
        "ingot" : <ore:ingotUranium>,
        "block" : <ore:blockUranium>,
        "nugget" : <ore:nuggetUranium>,
        "dust" : <ore:gearUranium>,
        "plate" : <ore:dustUranium>,
        "gear" : <ore:plateUranium>,
        "stick" : <ore:stickUranium>,
        "rod" : <ore:rodUranium>
    },
    "yellorium" : {
        "ingot" : <ore:ingotYellorium>,
        "block" : <ore:blockYellorium>,
        "nugget" : <ore:nuggetYellorium>,
        "dust" : <ore:gearYellorium>,
        "plate" : <ore:dustYellorium>,
        "gear" : <ore:plateYellorium>,
        "stick" : <ore:stickYellorium>,
        "rod" : <ore:rodYellorium>
    },
    "blutonium" : {
        "ingot" : <ore:ingotBlutonium>,
        "block" : <ore:blockBlutonium>,
        "nugget" : <ore:nuggetBlutonium>,
        "dust" : <ore:gearBlutonium>,
        "plate" : <ore:dustBlutonium>,
        "gear" : <ore:plateBlutonium>,
        "stick" : <ore:stickBlutonium>,
        "rod" : <ore:rodBlutonium>
    },
    "cyanite" : {
        "ingot" : <ore:ingotCyanite>,
        "block" : <ore:blockCyanite>,
        "nugget" : <ore:nuggetCyanite>,
        "dust" : <ore:gearCyanite>,
        "plate" : <ore:dustCyanite>,
        "gear" : <ore:plateCyanite>,
        "stick" : <ore:stickCyanite>,
        "rod" : <ore:rodCyanite>
    },
    "graphite" : {
        "ingot" : <ore:ingotGraphite>,
        "block" : <ore:blockGraphite>,
        "nugget" : <ore:nuggetGraphite>,
        "dust" : <ore:gearGraphite>,
        "plate" : <ore:dustGraphite>,
        "gear" : <ore:plateGraphite>,
        "stick" : <ore:stickGraphite>,
        "rod" : <ore:rodGraphite>
    },
    "ludicrite" : {
        "ingot" : <ore:ingotLudicrite>,
        "block" : <ore:blockLudicrite>,
        "nugget" : <ore:nuggetLudicrite>,
        "dust" : <ore:gearLudicrite>,
        "plate" : <ore:dustLudicrite>,
        "gear" : <ore:plateLudicrite>,
        "stick" : <ore:stickLudicrite>,
        "rod" : <ore:rodLudicrite>
    },
    "refinedIron" : {
        "ingot" : <ore:ingotRefinedIron>,
        "block" : <ore:blockRefinedIron>,
        "nugget" : <ore:nuggetRefinedIron>,
        "dust" : <ore:gearRefinedIron>,
        "plate" : <ore:dustRefinedIron>,
        "gear" : <ore:plateRefinedIron>,
        "stick" : <ore:stickRefinedIron>,
        "rod" : <ore:rodRefinedIron>
    },
};
