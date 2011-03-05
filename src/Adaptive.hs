module Adaptive where
import Knapsack
import First

solve :: (Knapsack -> Knapsack) -> Knapsack -> Knapsack
solve sort problem | (available $ withoutOversize problem) == [] = problem
                   | otherwise = (Adaptive.solve sort) $ First.solve $ sort $ withoutOversize problem
                        
withoutOversize k = k { available = dropTooBig (available k) (remainingSpace k)}  