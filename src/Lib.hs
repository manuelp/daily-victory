module Lib
    ( Points, Action, readAction
    ) where

import Data.Time

type Points = Integer
data Action = Action String Points UTCTime
            deriving Show

readAction :: IO Action
readAction = do
  putStr "Action description: "
  desc <- getLine
  putStr "Points: "
  pts <- read <$> getLine
  t <- getCurrentTime
  return (Action desc pts t)
