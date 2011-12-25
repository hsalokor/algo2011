module Algorithm.PreProcess where

import Data.Knapsack

solve :: Knapsack -> Knapsack
solve problem = problem { available = dropTooBig (available problem) (capacity problem) }
