module PreProcess where

import Knapsack

preProcess :: KnapsackProblem -> KnapsackProblem
preProcess problem = KnapsackProblem (name problem) (timeout problem) filteredContents (capacity problem)
    where filteredContents = dropTooBig (contents problem) (capacity problem)