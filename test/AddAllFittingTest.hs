module AddAllFittingTest where
import Test.HUnit
import Knapsack
import AddAllFitting

item1 = Item "1" 20 [1, 1, 1]
item2 = Item "2" 10 [100, 1, 1]
item3 = Item "3" 30 [1, 1, 1]

items = [item1, item2, item3]
problem capacity available selected = Knapsack 6000 available selected capacity

oneMoreFit =
    TestCase (assertEqual "Two first items fit" [item3, item1] (selected $ solve (problem [2, 1000, 1000] [item2, item3] [item1])))

addAllFittingTests = [ TestLabel "AAF" oneMoreFit
                     ]