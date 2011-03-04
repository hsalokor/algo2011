module Valuators where
import Knapsack
import Data.List
import GHC.Exts

valuePerWeight :: Item -> Rational
valuePerWeight item = toRational(value item) / toRational(sum $ weight item)