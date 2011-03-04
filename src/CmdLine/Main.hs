module Main where

import            System.Environment(getArgs)
import            Data.ByteString.Lazy.Char8 as L8
import            Input.JSON
import            ParsedProblem
import            Text.JSON
import            Text.JSON.Generic

import            Knapsack
import            PreProcess
import            TakeUntilFull
import            AddAllFitting

readFirstFile args = L8.readFile $ Prelude.head args

ids knapsack = Prelude.map Knapsack.id (selected knapsack)

formatOutput result = L8.concat [value, pack "\n", response]
    where
        value = L8.pack $ show (knapsackValue result)
        response = L8.pack $ encodeJSON $ ids result

main :: IO ()
main = do
           args <- getArgs
           json <- readFirstFile args
           L8.putStr $ handle json
           return ()
       where
           response body = handle $ body
           handle body = formatOutput $ solve $ toKnapsack $ parse body
           solve = AddAllFitting.solve . PreProcess.solve
