module Main where

import            System.Environment(getArgs)
import            Data.ByteString.Lazy.Char8 as L8
import            Input.JSON
import            Data.Aeson.Generic

import            Data.Knapsack as Knapsack
import            Data.ParsedProblem
import            Algorithm.Solver

readFirstFile args = L8.readFile $ Prelude.head args

ids knapsack = Prelude.map Knapsack.id (selected knapsack)

formatOutput filename result = L8.concat [filename, pack ": ", value, pack " ", response, pack "\n"]
    where
        value = L8.pack $ show (knapsackValue result)
        response = encode $ ids result

main :: IO ()
main = do
           args <- getArgs
           json <- readFirstFile args
           let filename = toFilename args
           L8.putStr $ handle filename json
           Prelude.putStrLn $ "Weight =" ++ (show $ knapsackWeight $ solution json) ++ " Limit =" ++ (show $ Knapsack.capacity $ problem json)
           return ()
       where
           handle file json = formatOutput file $ solution json
           solution = solve . problem
           problem json = case parse json of
                            Just d -> toKnapsack d
                            _      -> error "foobar"
           toFilename args = L8.pack $ Prelude.head args

