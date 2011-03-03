module TakeUntilFullTest where
import Test.HUnit
import Knapsack

lolTest =  TestCase (assertEqual "lol" 1 1)

takeUntilFullTests = TestList [ TestLabel "" lolTest ]
