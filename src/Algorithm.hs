module Algorithm where

import            Knapsack
import            PreProcess
import            ItemSort
import            TakeUntilFull
import            AddAllFitting
import            Valuators
import            PickMostValuable

solve = PickMostValuable.solve [(solveWith valuePerWeight), (solveWith valuePerQuadraticWeight), (solveWith powWeight)]
    where
        solveWith valuator = AddAllFitting.solve . (ItemSort.solve valuator) . PreProcess.solve