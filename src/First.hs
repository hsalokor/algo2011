module First ( solve ) where
import Knapsack

solve :: Knapsack -> Knapsack
solve problem = problem { selected = (head $ available problem) : (selected problem), available = (tail $ available problem) }
