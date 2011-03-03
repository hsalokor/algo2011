module First ( solve ) where
import Knapsack

solve :: KnapsackProblem -> [String]
solve problem = (Knapsack.id $ head $ contents problem) : []
