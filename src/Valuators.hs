module Valuators where
import Knapsack
import Data.List
import GHC.Exts

valuePerWeight :: Item -> Rational
valuePerWeight item = toRational(value item) / toRational(sum $ weight item)

valuePerQuadraticWeight :: Item -> Rational
valuePerQuadraticWeight item = toRational(value item) / toRational(sum $ map pow2 (weight item))
    where pow2 value = value ^ 2
    
powWeight :: Item -> Rational
powWeight item = toRational((value item) ^ n) / toRational(sum $ map powN (weight item))
    where n = length (weight item)
          powN value = value ^ n