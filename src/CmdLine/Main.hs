module Main where

import            System.Environment(getArgs)
import            Data.ByteString.Lazy.Char8 as L8
import            Input.JSON
import            ParsedProblem
import            Text.JSON
import            Text.JSON.Generic

import            Knapsack
import            Algorithm

readFirstFile args = L8.readFile $ Prelude.head args

ids knapsack = Prelude.map Knapsack.id (selected knapsack)

formatOutput filename result = L8.concat [filename, pack ": ", value, pack " ", response, pack "\n"]
    where
        value = L8.pack $ show (knapsackValue result)
        response = L8.pack $ encodeJSON $ ids result

main :: IO ()
main = do
           args <- getArgs
           json <- readFirstFile args
           let filename = toFilename args
           L8.putStr $ handle filename json
           return ()
       where
           response body = handle $ body
           handle file json = formatOutput file $ solve $ toKnapsack $ parse json
           toFilename args = L8.pack $ Prelude.head args

