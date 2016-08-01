{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}
module Lib
    ( Points, Action, readAction
    ) where

import Data.Time
import GHC.Generics
import Data.Aeson (ToJSON, FromJSON)

type Points = Integer
data Action = Action {description :: String,
                      points :: Points,
                      timestamp :: UTCTime}
            deriving (Generic,Show)

instance ToJSON Action
instance FromJSON Action

readAction :: IO Action
readAction = do
  putStr "Action description: "
  desc <- getLine
  putStr "Points: "
  pts <- read <$> getLine
  t <- getCurrentTime
  return (Action desc pts t)
