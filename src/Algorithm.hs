module Algorithm where

import            PreProcess
import            ItemSort
import            AddAllFitting
import            Valuators
import            PickMostValuable
import            Annealing

greedySolve = PickMostValuable.solveN 20 $ map solveWith [ valuePerWeight, powWeight]
    where solveWith valuator = AddAllFitting.solve . (ItemSort.solve valuator) . PreProcess.solve

solve problem = solveWithAnnealing 10000 initialPopulation
    where
        initialPopulation = greedySolve problem
