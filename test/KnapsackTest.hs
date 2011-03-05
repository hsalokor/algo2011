module KnapsackTest where
import Test.HUnit
import Knapsack

fitTestFits = 
    TestCase (assertEqual "Fits" True ([[100, 2, 3]] `fits` [100, 100, 100]))
fitTestDoesNotFit = 
    TestCase (assertEqual "Does not fit" False ([[103, 105, 107]] `fits` [106, 106, 106]))    


item1 = Item "1" 20 [1, 1, 1]
item2 = Item "2" 10 [100, 1, 1]
knapsack = Knapsack 6000 [] [item1, item2] [200, 200, 200]
knapsackValueTest = 
    TestCase (assertEqual "Knapsack value" 30 (knapsackValue knapsack))
    
items = [Item "1" 1 [2], Item "2" 1 [1]]
dropTooBigTest = 
    TestCase (assertEqual "Drops too big items" [Item "2" 1 [1]] (dropTooBig items [1]))
remainingSpaceTest =
    TestCase (assertEqual "Remaining space" [99, 198, 198] ( remainingSpace knapsack ))
remainingSpaceEmptyKnapsackTest =
    TestCase (assertEqual "Remaining space for empty" [200, 200, 200] ( remainingSpace knapsack { selected = []} ))


knapsackTests = [ TestLabel "" fitTestFits
                , TestLabel "" fitTestDoesNotFit
                , TestLabel "" dropTooBigTest
                , TestLabel "" knapsackValueTest
                , TestLabel "" remainingSpaceTest
                ]
