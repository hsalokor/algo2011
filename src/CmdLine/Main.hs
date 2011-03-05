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
           let f = toFilename args
           let !p = problem json
           s <- solve p
           let output = formatOutput f s
           L8.putStr output
           -- Prelude.putStrLn $ "Weight =" ++ (show $ knapsackWeight $ solution json) ++ " Limit =" ++ (show $ Knapsack.capacity $ problem json)
       where
           problem json = toKnapsack $ parse json
           toFilename args = L8.pack $ Prelude.head args

