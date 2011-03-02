{-# LANGUAGE OverloadedStrings #-}

module Site
  ( site
  ) where

import           Control.Applicative
import           Data.Maybe
import qualified Data.Text.Encoding as T
import           Snap.Types

import           Data.Aeson

import           Application

process :: a -> [Int]
process d = [1,3]

index :: Application ()
index = ifTop $ do
        body <- getRequestBody
        modifyResponse $ setResponseStatus 200 ""
        modifyResponse $ addHeader "Content-Type" "application/json"
        writeLBS $ handle $ body
        r <- getResponse
        finishWith r
    where
        handle body = encode $ process body

site :: Application ()
site = route [ ("/", index) ]
