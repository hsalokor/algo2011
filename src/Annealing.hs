module Annealing where

import      Control.Concurrent.Annealer
import      Knapsack(Knapsack, Item, knapsackValue, selected, available)
import      AddAllFitting(solve)
import      Util.Random

prepare :: Knapsack -> Knapsack
prepare knapsack = knapsack { available = take n (available knapsack), selected = unsort (selected knapsack)}
    where n = length $ selected knapsack

energy :: Knapsack -> Int
energy knapsack = - (knapsackValue knapsack)

perturb knapsack = return (solve $ knapsack { selected = drop 2 (selected knapsack) })

solveWithAnnealing microseconds knapsacks = do
    annealer <- makeAnnealer
    annealForTime 4 microseconds annealer
    getBestState annealer
    where
        makeAnnealer = initAnnealer knapsacks energy (length knapsacks) perturb
