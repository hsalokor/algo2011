module ItemSort where
import Knapsack
import Data.List
import GHC.Exts

solve :: (Item -> Rational) -> Knapsack -> Knapsack
solve valuator problem = problem { available = sortWith (negate . valuator) (available problem) }

valuePerWeight :: Item -> Rational
valuePerWeight item = toRational(value item) / toRational(sum $ weight item)