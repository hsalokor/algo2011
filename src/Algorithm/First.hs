module Algorithm.First ( solve ) where
import Data.Knapsack

solve :: Knapsack -> Knapsack
solve problem = problem { selected = (head $ available problem) : (selected problem), available = (tail $ available problem) }
