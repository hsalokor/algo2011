module TakeUntilFullTest where
import Test.HUnit
import Knapsack
import TakeUntilFull

items = [Item "1" 40 [10, 20, 30], Item "2" 50 [20, 30, 40], Item "3" 60 [30, 40, 50]]
problem capacity = KnapsackProblem "sample round" 6000 items capacity

noneFit = 
    TestCase (assertEqual "None fit" [] (solve (problem [1, 2, 3])))
someFit =
    TestCase (assertEqual "Two first items fit" ["2", "1"] (solve (problem [40, 1000, 1000])))
allFit =
    TestCase (assertEqual "Two first items fit" ["3", "2", "1"] (solve (problem [1000, 1000, 1000])))


takeUntilFullTests = [ TestLabel "" noneFit
                     , TestLabel "" someFit
                     , TestLabel "" allFit
                     ]