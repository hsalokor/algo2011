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

data KnapsackProblem = KnapsackProblem {
    name :: String,
    timeout :: Int,
    contents :: [Item],
    capacity :: [Int]
    }
    deriving(Eq, Show, Data, Typeable)

totalWeight weights = map sum $ transpose $ weights
remainingCapacity capacity weights = map negate (totalWeight ((map negate capacity) : weights))
