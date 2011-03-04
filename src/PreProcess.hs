module PreProcess where

import Knapsack

solve :: Knapsack -> Knapsack
solve problem = Knapsack (timeout problem) filteredContents (selected problem) (capacity problem)
    where filteredContents = dropTooBig (available problem) (capacity problem)