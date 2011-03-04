module TakeUntilFull where
import Knapsack
import Data.List
import First

solve :: Knapsack -> Knapsack

solve = takeUntilFull

takeUntilFull :: Knapsack -> Knapsack
takeUntilFull problem@(Knapsack _ [] _ _) = problem
takeUntilFull problem | fit (capacity problem) (map weight $ selected oneMore) = oneMore
                      | otherwise = problem
    where oneMore = takeUntilFull $ First.solve problem

{-|
takeUntilFull solution contents capacity = 
    if fit capacity (map weight oneMore) then takeUntilFull oneMore (tail contents) capacity
    else ids solution  
    where oneMore = ((head contents) : solution)
    
ids solution = map Knapsack.id solution
-}