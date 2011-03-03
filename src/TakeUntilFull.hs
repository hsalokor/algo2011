module TakeUntilFull ( solve ) where
import Knapsack
import Data.List

solve :: KnapsackProblem -> [String]
solve problem = takeUntilFull [] (contents problem) (capacity problem)

takeUntilFull solution [] capacity = map Knapsack.id solution
takeUntilFull solution contents capacity = 
    if fit capacity (map weight ((head contents) : solution)) then takeUntilFull ((head contents) : solution) (tail contents) capacity
    else map Knapsack.id solution  