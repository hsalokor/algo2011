{-# LANGUAGE DeriveDataTypeable #-}
module Knapsack where

import Data.Typeable
import Data.Data

data Item = Item {
    id :: Int,
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
