{-# LANGUAGE OverloadedStrings #-}

module JsonServer.Site
  ( site
  ) where

import            Snap.Types

import            Text.JSON.Generic

import qualified Data.ByteString.Char8 as B8
import qualified Data.ByteString.Lazy.Char8 as L8

import            JsonServer.Application
import            ParsedProblem
import            Knapsack
import            Algorithm

import            Input.JSON

logI title message = logError $ lazyToStrict $ L8.append (L8.pack title) message
    where
        lazyToStrict str = B8.pack $ L8.unpack str

solver :: Application ()
solver = ifTop $ do
        body <- getRequestBody
        modifyResponse $ setResponseStatus 200 ""
        modifyResponse $ addHeader "Content-Type" "application/json"
        writeLBS $ response $ body
    where
        handle body = formatOutput $ ids $ solve $ toKnapsack $ parse body
        formatOutput result = L8.pack $ encodeJSON result
        response body = handle $ body
        ids knapsack = Prelude.map Knapsack.id (selected knapsack)        

site :: Application ()
site = route [ ("/", solver) ]
