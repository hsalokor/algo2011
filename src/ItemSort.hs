module ItemSort where
import Knapsack
import Data.List

solve :: Knapsack -> Knapsack
solve problem = problem { available = sortBy (compareValues valuePerWeight) (available problem) }

compareValues valuator a b | (itemValue a > itemValue b) = LT
                           | otherwise = GT                  
                           where itemValue item = valuator (value item) (weight item)

valuePerWeight :: Int -> [Int] -> Rational
valuePerWeight value weight = toRational(value) / toRational(sum weight)