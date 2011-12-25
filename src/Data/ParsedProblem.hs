module Data.ParsedProblem where

import Data.Typeable
import Data.Data

import qualified Data.Knapsack as K

data ParsedProblem = ParsedProblem {
    name :: String,
    timeout :: Int,
    contents :: [K.Item],
    capacity :: [Int]
    }
    deriving(Eq, Show, Data, Typeable)

toKnapsack :: ParsedProblem -> K.Knapsack
toKnapsack parsed = K.Knapsack (timeout parsed) (contents parsed) [] (capacity parsed)
