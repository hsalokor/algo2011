module KnapsackTest where
import Test.HUnit
import Knapsack

totalWeightTest = 
    TestCase (assertEqual "Total weight" [12, 15, 18] (totalWeight [[1, 2, 3], [4, 5, 6], [7, 8, 9]]))
remainingCapacityTest = 
    TestCase (assertEqual "Remaining capacity" [88, 85, 82] (remainingCapacity [100, 100, 100] [[1, 2, 3], [4, 5, 6], [7, 8, 9]]))
fitTestFits = 
    TestCase (assertEqual "Fits" True ([[100, 2, 3]] `fits` [100, 100, 100]))
fitTestDoesNotFit = 
    TestCase (assertEqual "Does not fit" False ([[1, 2, 3]] `fits` [1, 2, 2]))    


item1 = Item "1" 20 [1, 1, 1]
item2 = Item "2" 10 [100, 1, 1]
knapsack = Knapsack 6000 [] [item1, item2] []
knapsackValueTest = 
    TestCase (assertEqual "Knapsack value" 30 (knapsackValue knapsack))
    
items = [Item "1" 1 [2], Item "2" 1 [1]]
dropTooBigTest = 
    TestCase (assertEqual "Drops too big items" [Item "2" 1 [1]] (dropTooBig items [1]))

knapsackTests = [ TestLabel "" totalWeightTest
                , TestLabel "" remainingCapacityTest
                , TestLabel "" fitTestFits
                , TestLabel "" fitTestDoesNotFit
                , TestLabel "" dropTooBigTest
                , TestLabel "" knapsackValueTest
                ]
