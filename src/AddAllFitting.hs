module AddAllFitting where
import Knapsack
import First

solve :: Knapsack -> Knapsack
solve problem = addAllFitting problem

addAllFitting :: Knapsack -> Knapsack
addAllFitting problem@(Knapsack _ [] _ _) = problem
addAllFitting problem | isValid proposed = addAllFitting proposed
                      | otherwise = addAllFitting $ skipOne problem
    where proposed = First.solve problem
          skipOne knapsack = knapsack { available = tail $ available knapsack }