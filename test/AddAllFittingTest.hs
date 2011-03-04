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
    TestCase (assertEqual "One more fits" [item3, item1] (selected $ solve (problem [2, 1000, 1000] [item2, item3] [item1])))
retainsAvailable =
    TestCase (assertEqual "Retains available list" [item2] (available $ solve (problem [2, 1000, 1000] [item2, item3] [item1])))
noneFit = 
    TestCase (assertEqual "None fit" [] (selected $ solve (problem [0, 1000, 1000] items [])))
someFit =
    TestCase (assertEqual "Two items fit" [item3, item1] (selected $ solve (problem [2, 1000, 1000] items [])))
allFit =
    TestCase (assertEqual "All fit" [item3, item2, item1] (selected $ solve (problem [1000, 1000, 1000] items [])))


addAllFittingTests = [ TestLabel "AAF" noneFit
                     , TestLabel "AAF" someFit
                     , TestLabel "AAF" allFit
                     , TestLabel "AAF" oneMoreFit
                     , TestLabel "AAF" retainsAvailable
                     ]