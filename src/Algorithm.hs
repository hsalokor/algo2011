module Algorithm where

import            PreProcess
import            ItemSort
import            AddAllFitting
import            Valuators
import            PickMostValuable

solve = PickMostValuable.solve $ map solveWith [ valuePerWeight, powWeight]
    where solveWith valuator = AddAllFitting.solve . (ItemSort.solve valuator) . PreProcess.solve