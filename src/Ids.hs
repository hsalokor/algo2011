module Ids ( solve ) where
import Knapsack

solve :: KnapsackProblem -> [String]
solve problem = map Knapsack.id $ contents problem
