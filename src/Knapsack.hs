module Knapsack
  ( Item
  , KnapsackProblem
  , Dimensions
  ) where

data Dimensions = Dimensions Int Int Int
    deriving(Show)

data KnapsackProblem = KnapsackProblem {
    name :: String,
    timeout :: Int,
    items :: [Item],
    knapsackDimensions :: Dimensions
    }
    deriving(Show)

data Item = Item {
    id :: Int,
    value :: Int,
    itemDimensions :: Dimensions
    }
    deriving(Show)
