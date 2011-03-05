module Valuators where
import Knapsack

valuePerWeight :: [Int] -> Item -> Rational
valuePerWeight capacity item = toRational(value item) / toRational(sum $ weight item)
    
powWeight :: [Int] -> Item -> Rational
powWeight capacity item = toRational((value item) ^ n) / toRational(sum $ map powN (weight item))
    where n = length (weight item)
          powN value = value ^ n

balancedWeight :: [Int] -> Item -> Rational
balancedWeight capacity item = toRational(value item) / toRational(bw)
    where bw = sum $ zipWith (/) (ratList (weight item)) (ratList capacity)
          ratList = map toRational