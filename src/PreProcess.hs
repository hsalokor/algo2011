module PreProcess where

import Knapsack

solve :: Knapsack -> Knapsack
solve problem = problem { available = dropTooBig (available problem) (capacity problem) }
