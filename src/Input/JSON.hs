{-# LANGUAGE OverloadedStrings #-}

module Input.JSON (parse) where

import            Data.Aeson()
import            Data.Aeson.Generic
import            Data.ParsedProblem

import            Data.ByteString.Lazy

parse :: ByteString -> Maybe ParsedProblem
parse jsonString = decode jsonString
