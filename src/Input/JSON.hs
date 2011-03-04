{-# LANGUAGE OverloadedStrings #-}

module Input.JSON
  ( parse
  ) where

import            Text.JSON()
import            Text.JSON.Generic
import            ParsedProblem

import            Data.ByteString.Lazy
import qualified  Data.ByteString.Lazy.Char8 as L8

parse :: ByteString -> ParsedProblem
parse jsonString = decodeJSON input :: ParsedProblem
                        where input = L8.unpack jsonString
