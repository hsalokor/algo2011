module Algorithm where

import            Knapsack
import            PreProcess
import            ItemSort
import            TakeUntilFull
import            AddAllFitting
import            Valuators

solve = AddAllFitting.solve . (ItemSort.solve valuePerWeight) . PreProcess.solve