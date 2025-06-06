-- File: test/Categories/TestFiniteSets.hs
module Categories.TestFiniteSets where

import Categories.FiniteSets (FinMap(..), apply)

import Control.Exception (evaluate, try, SomeException)
import Test.Tasty
import Test.Tasty.HUnit

data Color = Red | Green | Blue deriving (Enum, Bounded, Show, Eq)

universe :: [Color]
universe = [minBound .. maxBound]

test_finiteSets :: TestTree
test_finiteSets = testGroup "FiniteSets"
  [ testCase "universe should list all Color values in order" $
      universe @?= [Red, Green, Blue]
  ]

test_applyBasic :: TestTree
test_applyBasic = testGroup "apply: basic behavior"
  [ testCase "apply (a -> 1, b -> 2)" $
      let f = FinMap [('a', 1), ('b', 2)]
      in do apply f 'a' @?= 1
            apply f 'b' @?= 2
  ]

test_applyMissing :: TestTree
test_applyMissing = testCase "apply: missing key should error" $ do
  let f = FinMap [('a', 1)]
  result <- try (evaluate (apply f 'z')) :: IO (Either SomeException Int)
  case result of
    Left _  -> pure ()  -- expected
    Right _ -> assertFailure "Expected error on missing input, but got value"

test_applyDuplicate :: TestTree
test_applyDuplicate = testCase "apply: uses first match for duplicate keys" $
  let f = FinMap [('a', 1), ('a', 42)]
  in apply f 'a' @?= 1

test_applyBool :: TestTree
test_applyBool = testCase "apply: Bool keys" $
  let f = FinMap [(True, "yes"), (False, "no")]
  in apply f False @?= "no"
