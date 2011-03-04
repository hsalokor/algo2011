{-# LANGUAGE DeriveDataTypeable #-}
module Knapsack where

import Data.Typeable
import Data.Data
import Data.List

data Item = Item {
    id :: String,
    value :: Int,
    weight :: [Int]
    }
    deriving(Eq, Show, Data, Typeable)

data Knapsack = Knapsack {
    timeout :: Int,
    available :: [Item],
    selected :: [Item],
    capacity :: [Int]
    }
    deriving(Eq, Show, Data, Typeable)

totalWeight weights = map sum $ transpose $ weights
remainingCapacity capacity weights = map negate (totalWeight ((map negate capacity) : weights))

fits :: [[Int]] -> [Int] -> Bool
fits weights capacity = all (>= 0) (remainingCapacity capacity weights)

isValid :: Knapsack -> Bool
isValid knapsack = selectedWeights `fits` (capacity knapsack)
    where selectedWeights = map weight $ selected knapsack

dropTooBig :: [Item] -> [Int] -> [Item]
dropTooBig contents capacity = filter ((fitSingle capacity) . weight) contents
    where fitSingle capacity weight = [weight] `fits` capacity