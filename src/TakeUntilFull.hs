module TakeUntilFull where
import Knapsack
import Data.List

solve :: Knapsack -> [String]
solve problem = takeUntilFull [] (sortBy (compareValues valuePerWeight) (available problem)) (capacity problem)

takeUntilFull solution [] capacity = ids solution
takeUntilFull solution contents capacity = 
    if fit capacity (map weight oneMore) then takeUntilFull oneMore (tail contents) capacity
    else ids solution  
    where oneMore = ((head contents) : solution)
    
ids solution = map Knapsack.id solution

compareValues valuator a b | (itemValue a > itemValue b) = LT
                           | otherwise = GT                  
                           where itemValue item = valuator (value item) (weight item)

valuePerWeight :: Int -> [Int] -> Rational
valuePerWeight value weight = toRational(value) / toRational(sum weight)