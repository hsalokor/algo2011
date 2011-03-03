module Knapsack
  ( Item
  , KnapsackProblem
  , Dimensions
  ) where

data Dimensions = Dimensions Int Int Int
    derives(Show)

data KnapsackProblem = KnapsackProblem {
    name :: String,
    timeout :: Int,
    items :: [Item],
    knapsackDimensions :: Dimensions
    }
    derives(Show)

data Item = Item {
    id :: Int,
    value :: Int,
    itemDimensions :: Dimensions
    }
    derives(Show)
