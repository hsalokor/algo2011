module TakeUntilFull where
import Knapsack
import Data.List

solve :: KnapsackProblem -> [String]
solve problem = takeUntilFull [] (contents problem) (capacity problem)

takeUntilFull solution [] capacity = ids solution
takeUntilFull solution contents capacity = 
    if fit capacity (map weight oneMore) then takeUntilFull oneMore (tail contents) capacity
    else ids solution  
    where oneMore = ((head contents) : solution)
    
ids solution = map Knapsack.id solution

valuePerWeight value weight = value / (sum weight)