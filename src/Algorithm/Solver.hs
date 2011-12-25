module Algorithm.Solver where

import            Algorithm.PreProcess as PreProcess
import            Algorithm.ItemSort as ItemSort
import            Algorithm.AddAllFitting as AddAllFitting
import            Algorithm.Valuators
import            Algorithm.PickMostValuable as PickMostValuable
import            Algorithm.Adaptive as Adaptive

solve = PickMostValuable.solve $ adaptive : (map solveWith [ valuePerWeight, powWeight, balancedWeight ])
    where solveWith valuator = AddAllFitting.solve . (ItemSort.solve valuator) . PreProcess.solve
          adaptive = Adaptive.solve (ItemSort.solve balancedWeight)
