module TakeUntilFull where
import Knapsack
import Data.List

solve :: Knapsack -> [String]
solve problem = takeUntilFull [] (available problem) (capacity problem)

takeUntilFull solution [] capacity = ids solution
takeUntilFull solution contents capacity = 
    if fit capacity (map weight oneMore) then takeUntilFull oneMore (tail contents) capacity
    else ids solution  
    where oneMore = ((head contents) : solution)
    
ids solution = map Knapsack.id solution