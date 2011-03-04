module Annealing where

import      Control.Concurrent.Annealer
import      Knapsack(Knapsack, Item, knapsackValue)

energy :: Knapsack -> Int
energy knapsack = knapsackValue knapsack

perturb knapsack = return knapsack

solveWithAnnealing microseconds knapsack = do
    annealer <- makeAnnealer
    annealForTime 4 microseconds annealer
    getBestState annealer
    where
        makeAnnealer = initAnnealer [knapsack] energy 50 perturb
