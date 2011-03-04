module Algorithm where

import            PreProcess
import            ItemSort
import            AddAllFitting
import            Valuators
import            PickMostValuable

solve = PickMostValuable.solve [(solveWith valuePerWeight), (solveWith valuePerQuadraticWeight), (solveWith powWeight), (solveWith valuePerVolume)]
    where
        solveWith valuator = AddAllFitting.solve . (ItemSort.solve valuator) . PreProcess.solve
