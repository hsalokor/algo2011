module First ( solve ) where
import Knapsack

solve :: Knapsack -> [String]
solve problem = (Knapsack.id $ head $ nonSelected problem) : []
