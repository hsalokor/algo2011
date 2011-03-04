module TakeUntilFullTest where
import Test.HUnit
import Knapsack
import TakeUntilFull

items = [Item "1" 20 [1, 1, 1], Item "2" 10 [1, 1, 1], Item "3" 30 [1, 1, 1]]
problem capacity items = Knapsack 6000 items [] capacity

noneFit = 
    TestCase (assertEqual "None fit" [] (solve (problem [0, 1000, 1000] items)))
someFit =
    TestCase (assertEqual "Two first items fit" ["2", "1"] (solve (problem [2, 1000, 1000] items)))
allFit =
    TestCase (assertEqual "All fit" ["3", "2", "1"] (solve (problem [1000, 1000, 1000] items)))

takeUntilFullTests = [ TestLabel "" noneFit
                     , TestLabel "" someFit
                     , TestLabel "" allFit
                     ]