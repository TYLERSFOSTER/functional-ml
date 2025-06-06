-- File: test/Main.hs
module Main where

import Test.Tasty
import Test.Tasty.HUnit

-- Your other test imports
import Categories.TestFiniteSets (test_finiteSets, test_applyBasic, test_applyMissing, test_applyDuplicate, test_applyBool)
import Trials.TrialMonadTest (test_trialMonad)

main :: IO ()
main = defaultMain $ testGroup "All tests"
  [ test_finiteSets,
  test_applyBasic,
  test_applyMissing,
  test_applyDuplicate,
  test_applyBool,
  test_trialMonad
  -- , test_dualNumbers
  -- , test_chainRule
  ]
