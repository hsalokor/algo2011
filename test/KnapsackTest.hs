module KnapsackTest where
import Test.HUnit
import Knapsack

totalWeightTest = TestCase (assertEqual "Total weight" [12, 15, 18] (totalWeight [[1, 2, 3], [4, 5, 6], [7, 8, 9]]))
tests = TestList [TestLabel "test" totalWeightTest]
