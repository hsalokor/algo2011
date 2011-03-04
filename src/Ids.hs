module Ids ( solve ) where
import Knapsack

solve :: Knapsack -> [String]
solve problem = map Knapsack.id $ available problem
