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

import           Data.ByteString.Char8

import           Application
import           Knapsack
import           First

decodeData body = decodeJSON body :: KnapsackProblem

process :: KnapsackProblem -> [String]
process d = solve d

solver :: Application ()
solver = ifTop $ do
        body <- getRequestBody
        modifyResponse $ setResponseStatus 200 ""
        modifyResponse $ addHeader "Content-Type" "application/json"
        writeBS $ handle $ body
        r <- getResponse
        finishWith r
    where
        handle body = pack $ encodeJSON $ process $ decodeData $ show body

site :: Application ()
site = route [ ("/", solver) ]
