module Main where

import           Snap.Core
import           Snap.Http.Server

import           Data.Aeson.Generic

import           Control.Monad(liftM)

import qualified Data.ByteString.Char8 as B8
import qualified Data.ByteString.Lazy.Char8 as L8

import           ParsedProblem
import           Knapsack
import           Algorithm
import           Input.JSON

lazyToStrict = B8.pack . L8.unpack

ids knapsack = map Knapsack.id (selected knapsack)

solveKnapsack = method POST $ do
    request <- liftM parse getRequestBody
    case request of
        Just problem   -> writeBS $ process problem
        Nothing        -> writeBS "{ \"error\": \"Invalid request\" }"
    where
        process = lazyToStrict . encode . ids . solve . toKnapsack

main :: IO ()
main = httpServe defaultConfig $ route [
        ("/", solveKnapsack)
    ]
