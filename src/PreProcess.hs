module PreProcess where

import Knapsack

solve :: Knapsack -> Knapsack
solve problem = Knapsack (timeout problem) filteredContents (selected problem) (capacity problem)
    where filteredContents = dropTooBig (nonSelected problem) (capacity problem)