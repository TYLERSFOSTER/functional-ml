module Main where

import CoreLibrary (greet)
import Trials.TrialMonad


main :: IO ()
main = do
  putStrLn (greet "Tyler")
  let example = 0
  print example
