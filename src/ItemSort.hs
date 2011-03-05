module ItemSort where
import Knapsack
import GHC.Exts

solve :: ([Int] -> Item -> Rational) -> Knapsack -> Knapsack
solve valuator problem = problem { available = sortWith (negate . itemValuator) (available problem) }
    where itemValuator = valuator (capacity problem)