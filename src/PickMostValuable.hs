module PickMostValuable where

import Knapsack
import GHC.Exts
import Control.Parallel (par)

solutions :: [Knapsack -> Knapsack] -> Knapsack -> [Knapsack]
solutions algs problem = reverse $ sortWith knapsackValue $ parMap call algs
    where call f = f problem

solveN :: Int -> [Knapsack -> Knapsack] -> Knapsack -> [Knapsack]
solveN count algs problem = take count $ solutions algs problem

solve :: [Knapsack -> Knapsack] -> Knapsack -> Knapsack
solve algs problem = head $ solutions algs problem
    
parMap :: (a -> b) -> [a] -> [b]
parMap f (x:xs) = r `par` (r : parMap f xs)
                  where r = f x
parMap _ _      = []
