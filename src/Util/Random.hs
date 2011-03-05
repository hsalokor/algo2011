module Util.Random where

import      Data.List(sortBy)
import      Data.Ord(comparing)
import      Control.Monad.State
import      System.Random (RandomGen, StdGen, mkStdGen, random)

type R a = State StdGen a

runRandom :: R a -> Int -> a
runRandom action seed = evalState action $ mkStdGen seed

rand :: R Int
rand = do
  gen <- get
  let (r, gen') = random gen
  put gen'
  return r

randomList :: Int -> [Int]
randomList len = [runRandom rand x | x <- replicate len len]

unsort :: [x] -> [x]
unsort es = map snd . sortBy (comparing fst) $ zip rs es
            where rs = randomList $ length es

