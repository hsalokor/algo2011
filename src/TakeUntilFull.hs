module TakeUntilFull where
import Knapsack
import Data.List

solve :: KnapsackProblem -> [String]
solve problem = takeUntilFull [] (sortBy compareValues (contents problem)) (capacity problem)

takeUntilFull solution [] capacity = ids solution
takeUntilFull solution contents capacity = 
    if fit capacity (map weight oneMore) then takeUntilFull oneMore (tail contents) capacity
    else ids solution  
    where oneMore = ((head contents) : solution)
    
ids solution = map Knapsack.id solution

compareValues a b | (itemValue a > itemValue b) = LT
                  | otherwise = GT                  
                  where itemValue item = valuePerWeight (value item) (weight item)

valuePerWeight :: Int -> [Int] -> Rational
valuePerWeight value weight = toRational(value) / toRational(sum weight)