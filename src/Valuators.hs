module Valuators where
import Knapsack

valuePerWeight :: Item -> Rational
valuePerWeight item = toRational(value item) / toRational(sum $ weight item)

valuePerQuadraticWeight :: Item -> Rational
valuePerQuadraticWeight item = toRational(value item) / toRational(sum $ map pow2 (weight item))
    where pow2 value = (value :: Int) ^ (2 :: Int)
    
powWeight :: Item -> Rational
powWeight item = toRational((value item) ^ n) / toRational(sum $ map powN (weight item))
    where n = length (weight item)
          powN value = value ^ n

valuePerVolume :: Item -> Rational
valuePerVolume item = toRational(value item) / toRational(product $ weight item )

minDimension :: Item -> Rational
minDimension item = toRational(value item) / toRational(minimum $ weight item)

maxDimension :: Item -> Rational
maxDimension item = toRational(value item) / toRational(maximum $ weight item)

averageDimension :: Item -> Rational
averageDimension item = toRational(value item) / (toRational(sum $ weight item) / toRational(length $ weight item))
