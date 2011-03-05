module ValuatorsTest where
import Test.HUnit
import Knapsack
import Valuators

valuePerWeightTest = 
    TestCase (assertEqual "Value per weight" 0.1 (valuePerWeight [1, 2, 3] (Item "id" 10 [50, 30, 20])))        

valuatorTests = [ TestLabel "" valuePerWeightTest
                ]