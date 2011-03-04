module PickMostValuable where

import Knapsack
import Data.List
import GHC.Exts
import Control.Parallel (par)

solve :: [Knapsack -> Knapsack] -> Knapsack -> Knapsack

solve algs problem = head $ reverse $ sortWith knapsackValue $ parMap call algs
    where call f = f problem
    
parMap :: (a -> b) -> [a] -> [b]
parMap f (x:xs) = r `par` (r : parMap f xs)
                  where r = f x
parMap _ _      = []