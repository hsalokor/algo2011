module PreProcess where

import Knapsack

preProcess :: Knapsack -> Knapsack
preProcess problem = Knapsack (timeout problem) filteredContents (selected problem) (capacity problem)
    where filteredContents = dropTooBig (nonSelected problem) (capacity problem)