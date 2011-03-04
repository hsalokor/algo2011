module TakeUntilFull where
import Knapsack
import First

solve :: Knapsack -> Knapsack

solve = takeUntilFull

takeUntilFull :: Knapsack -> Knapsack
takeUntilFull problem@(Knapsack _ [] _ _) = problem
takeUntilFull problem | isValid proposed = takeUntilFull $ proposed
                      | otherwise = problem
    where proposed = First.solve problem