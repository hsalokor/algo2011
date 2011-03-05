module Algorithm where

import            PreProcess
import            ItemSort
import            AddAllFitting
import            Valuators
import            PickMostValuable
import            Adaptive

solve = PickMostValuable.solve $ adaptive : (map solveWith [ valuePerWeight, powWeight, balancedWeight ])
    where solveWith valuator = AddAllFitting.solve . (ItemSort.solve valuator) . PreProcess.solve
          adaptive = Adaptive.solve (ItemSort.solve balancedWeight)