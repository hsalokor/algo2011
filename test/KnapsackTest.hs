module KnapsackTest where
import Test.HUnit
import Knapsack

totalWeightTest = 
    TestCase (assertEqual "Total weight" [12, 15, 18] (totalWeight [[1, 2, 3], [4, 5, 6], [7, 8, 9]]))
remainingCapacityTest = 
    TestCase (assertEqual "Remaining capacity" [88, 85, 82] (remainingCapacity [100, 100, 100] [[1, 2, 3], [4, 5, 6], [7, 8, 9]]))
fitTestFits = 
    TestCase (assertEqual "Fits" True (fit [100, 100, 100] [[100, 2, 3]]))
fitTestDoesNotFit = 
    TestCase (assertEqual "Does not fit" False (fit [1, 2, 2] [[1, 2, 3]]))    
    
items = [Item "1" 1 [2], Item "2" 1 [1]]
dropTooBigTest = 
    TestCase (assertEqual "Drops too big items" [Item "2" 1 [1]] (dropTooBig items [1]))

knapsackTests = [ TestLabel "" totalWeightTest
                , TestLabel "" remainingCapacityTest
                , TestLabel "" fitTestFits
                , TestLabel "" fitTestDoesNotFit
                , TestLabel "" dropTooBigTest
                ]
