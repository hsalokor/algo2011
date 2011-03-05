module Adaptive where
import Knapsack
import First

solve :: (Knapsack -> Knapsack) -> Knapsack -> Knapsack
solve sort problem = adaptive sort 10 problem
adaptive :: (Knapsack -> Knapsack) -> Int  -> Knapsack -> Knapsack
adaptive sort count problem | (available $ withoutOversize problem) == [] = problem
                            | (count > 0) = (adaptive sort (count - 1)) $ First.solve $ withoutOversize problem
                            | otherwise = (adaptive sort 10) $ First.solve $ sort $ withoutOversize problem
                        
withoutOversize k = k { available = dropTooBig (available k) (remainingSpace k)}  