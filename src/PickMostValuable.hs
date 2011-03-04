module PickMostValuable where

import Knapsack
import Data.List
import GHC.Exts

solve :: [Knapsack -> Knapsack] -> Knapsack -> Knapsack

solve algs problem = head $ reverse $ sortWith knapsackValue $ map call algs
    where call f = f problem