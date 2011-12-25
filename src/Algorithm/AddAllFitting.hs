module Algorithm.AddAllFitting where
import Data.Knapsack
import Algorithm.First as First

solve :: Knapsack -> Knapsack
solve problem = addAllFitting (length $ available problem) problem

addAllFitting :: Int -> Knapsack -> Knapsack
addAllFitting _ problem@(Knapsack _ [] _ _) = problem
addAllFitting 0 problem = problem
addAllFitting left problem | isValid proposed = addAllFitting (left) proposed
                           | otherwise = addAllFitting (left - 1) (rotate problem)
    where proposed = First.solve problem
          rotate problem = problem { available = (tail $ available problem) ++ [head $ available problem] }
