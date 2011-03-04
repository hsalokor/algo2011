module Algorithm where

import            PreProcess
import            ItemSort
import            AddAllFitting
import            Valuators
import            PickMostValuable

solve = PickMostValuable.solve $ map solveWith [ valuePerWeight
                                               , valuePerQuadraticWeight
                                               , powWeight
                                               , valuePerVolume
                                               , minDimension
                                               , maxDimension
                                               , averageDimension
                                               ]
    where
        solveWith valuator = AddAllFitting.solve . (ItemSort.solve valuator) . PreProcess.solve