module PreProcessTest where
import Test.HUnit
import Knapsack
import PreProcess

problem items = Knapsack "sample round" 6000 items [1, 1, 1]
originalProblem = problem [Item "1" 20 [1, 1, 1], Item "2" 10 [1, 1, 1], Item "3" 30 [2, 1, 1]]
filteredProblem = problem [Item "1" 20 [1, 1, 1], Item "2" 10 [1, 1, 1]]

dropsTooBigTest = 
    TestCase (assertEqual "Drops too big" filteredProblem (preProcess (originalProblem)))

preProcessTests = [ TestLabel "" dropsTooBigTest
                     ]