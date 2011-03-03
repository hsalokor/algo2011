module TakeUntilFullTest where
import Test.HUnit
import Knapsack

lolTest =  TestCase (assertEqual "lol" 1 1)

-- KnapsackProblem "sample round" 6000 [Item "1" 40 [10, 20, 30], Item "2" 50 [20, 30, 40], Item "3" 60 [30, 40, 50]] [50, 100, 300]

takeUntilFullTests = TestList [ TestLabel "" lolTest ]