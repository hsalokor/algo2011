module Annealing where

import      System.Random
import      Control.Concurrent.Annealer
import      Knapsack(Knapsack, Item, knapsackValue)
import      Data.List(sortBy)
import      Data.Ord(comparing)

unsort :: (RandomGen g) => g -> [x] -> [x]
unsort g es = map snd . sortBy (comparing fst) $ zip rs es
  where rs = randoms g :: [Integer]

energy :: Knapsack -> Int
energy knapsack = knapsackValue knapsack

perturb knapsack = return knapsack

solveWithAnnealing microseconds knapsack = do
    annealer <- makeAnnealer
    annealForTime 4 microseconds annealer
    getBestState annealer
    where
        makeAnnealer = initAnnealer [knapsack] energy 50 perturb
