module Valuators where
import Knapsack
import Data.List
import GHC.Exts

valuePerWeight :: Item -> Rational
valuePerWeight item = toRational(value item) / toRational(sum $ weight item)

valuePerQuadraticWeight :: Item -> Rational
valuePerQuadraticWeight item = toRational(value item) / toRational(sum $ map pow2 (weight item))
    where pow2 value = value ^ 2