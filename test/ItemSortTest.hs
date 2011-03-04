module ItemSortTest where
import Test.HUnit
import Knapsack
import ItemSort

items = [Item "1" 20 [1, 1, 1], Item "2" 10 [1, 1, 1], Item "3" 30 [1, 1, 1]]
sortedItems = [Item "3" 30 [1, 1, 1], Item "1" 20 [1, 1, 1], Item "2" 10 [1, 1, 1]]
problem items = Knapsack 6000 items [] [0, 1000, 1000]

densitySortTest = 
    TestCase (assertEqual "Sort by density" (problem sortedItems) (solve valuePerWeight (problem items)))

valuePerWeightTest = 
    TestCase (assertEqual "Value per weight" 0.1 (valuePerWeight (Item "id" 10 [50, 30, 20])))        

densitySortTests = [ TestLabel "" densitySortTest                     
                   , TestLabel "" valuePerWeightTest
                     ]