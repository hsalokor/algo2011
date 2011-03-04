module PickMostValuableTest where
import Test.HUnit
import Knapsack
import PickMostValuable

item1 = Item "1" 20 [1, 1, 1]

problem  = Knapsack 6000 [] [] []

bad :: Knapsack -> Knapsack
bad problem = Knapsack 6000 [] [] []

good :: Knapsack -> Knapsack
good problem = Knapsack 6000 [] [item1] []

pickMostValuableTest = 
    TestCase (assertEqual "Picks most valuable" (good problem) (solve [bad, good] problem))

pickMostValuableTests = [ TestLabel "PMVT" pickMostValuableTest
                        ]