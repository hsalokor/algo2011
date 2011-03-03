module Knapsack
    ( Item
    , KnapsackProblem
    ) where

data Item = Item {
    id :: Int,
    value :: Int,
    weight :: [Int]
    }
    deriving(Show)

data KnapsackProblem = KnapsackProblem {
    name :: String,
    timeout :: Int,
    contents :: [Item],
    capacity :: [Int]
    }
    deriving(Show)
