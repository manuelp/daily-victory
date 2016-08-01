{-# LANGUAGE OverloadedStrings #-}
module Main where

import Lib
import Data.Aeson (encode)

main :: IO ()
main = do
  a <- readAction
  putStrLn . show . encode $ a
