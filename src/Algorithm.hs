module Algorithm where

import            Knapsack
import            PreProcess
import            ItemSort
import            TakeUntilFull
import            AddAllFitting

solve = AddAllFitting.solve . (ItemSort.solve valuePerWeight) . PreProcess.solve