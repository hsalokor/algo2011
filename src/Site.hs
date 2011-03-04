{-# LANGUAGE OverloadedStrings #-}

module Site
  ( site
  ) where

import           Control.Applicative
import           Data.Maybe
import qualified Data.Text.Encoding as T
import           Snap.Types

import           Text.JSON
import           Text.JSON.Generic

import           Data.ByteString.Lazy.Char8

import           Application
import           Knapsack
import           PreProcess
import           TakeUntilFull


solver :: Application ()
solver = ifTop $ do
        body <- getRequestBody
        modifyResponse $ setResponseStatus 200 ""
        modifyResponse $ addHeader "Content-Type" "application/json"
        writeLBS $ handle $ body
        r <- getResponse
        finishWith r
    where
        handle body = formatOutput $ solve $ preProcess $ readInput body
        formatOutput result = pack $ encodeJSON result
        process input = case input of 
                            Ok problem -> solve problem
                            Error e   -> [e]
        readInput body = decodeJSON input :: KnapsackProblem
                         where input = unpack body

site :: Application ()
site = route [ ("/", solver) ]
