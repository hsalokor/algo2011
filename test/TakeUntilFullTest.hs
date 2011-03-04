module TakeUntilFullTest where
import Test.HUnit
import Knapsack
import TakeUntilFull

items = [Item "1" 20 [1, 1, 1], Item "2" 10 [1, 1, 1], Item "3" 30 [1, 1, 1]]
problem capacity = KnapsackProblem "sample round" 6000 items capacity

noneFit = 
    TestCase (assertEqual "None fit" [] (solve (problem [0, 1000, 1000])))
someFit =
    TestCase (assertEqual "Two items with best value for weight fit" ["3", "1"] (solve (problem [2, 1000, 1000])))
allFit =
    TestCase (assertEqual "Two first items fit" ["3", "2", "1"] (solve (problem [1000, 1000, 1000])))
valuePerWeightTest = 
    TestCase (assertEqual "Value per weight" 0.1 (valuePerWeight 10 [50, 30, 20]))        

takeUntilFullTests = [ TestLabel "" noneFit
                     , TestLabel "" someFit
                     , TestLabel "" allFit
                     , TestLabel "" valuePerWeightTest
                     ]