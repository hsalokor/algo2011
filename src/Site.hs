{-# LANGUAGE OverloadedStrings #-}

module Site
  ( site
  ) where

import            Snap.Types

import            Text.JSON
import            Text.JSON.Generic

import qualified Data.ByteString.Char8 as B8
import qualified Data.ByteString.Lazy.Char8 as L8

import            Application
import            ParsedProblem
import            Knapsack
import            PreProcess
import            First

logI title message = logError $ lazyToStrict $ L8.append (L8.pack title) message
    where
        lazyToStrict str = B8.pack $ L8.unpack str

solver :: Application ()
solver = ifTop $ do
        body <- getRequestBody
        modifyResponse $ setResponseStatus 200 ""
        modifyResponse $ addHeader "Content-Type" "application/json"
        logI "Input: " $ body
        logI "Response: " $ response body
        writeLBS $ response $ body
        r <- getResponse
        finishWith r
    where
        handle body = formatOutput $ ids $ solve $ toKnapsack $ readInput body
        formatOutput result = L8.pack $ encodeJSON result
        readInput body = decodeJSON input :: KnapsackProblem
                         where input = L8.unpack body
        response body = handle $ body
        ids knapsack = Prelude.map Knapsack.id (selected knapsack)
        solve = First.solve . PreProcess.solve

site :: Application ()
site = route [ ("/", solver) ]
