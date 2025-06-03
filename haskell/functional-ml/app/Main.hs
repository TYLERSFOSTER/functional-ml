module Main where

import CoreLibrary (greet)
import Trials.TrialMonad

import Test.Tasty

main :: IO ()
main = defaultMain $ testGroup "All tests"
  [ test_trialMonad
  , test_dualNumbers
  , test_chainRule
  ]


main :: IO ()
main = do
  putStrLn (greet "Tyler")
  let example = 0
  print example
