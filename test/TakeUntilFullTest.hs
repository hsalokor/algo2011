module TakeUntilFullTest where
import Test.HUnit
import Knapsack
import TakeUntilFull

item1 = Item "1" 20 [1, 1, 1]
item2 = Item "2" 10 [1, 1, 1]
item3 = Item "3" 30 [1, 1, 1]

items = [item1, item2, item3]
problem capacity items = Knapsack 6000 items [] capacity

noneFit = 
    TestCase (assertEqual "None fit" [] (selected $ solve (problem [0, 1000, 1000] items)))
someFit =
    TestCase (assertEqual "Two first items fit" [item2, item1] (selected $ solve (problem [2, 1000, 1000] items)))
allFit =
    TestCase (assertEqual "All fit" [item3, item2, item1] (selected $ solve (problem [1000, 1000, 1000] items)))

takeUntilFullTests = [ TestLabel "" noneFit
                     , TestLabel "" someFit
                     , TestLabel "" allFit
                     ]