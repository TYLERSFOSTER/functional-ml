module Trials.TrialMonadTest (test_trialMonad) where

import Test.Tasty
import Test.Tasty.HUnit

import Trials.TrialMonad -- make sure this module is available and defines TrialMonad, append, etc.

-- Add Show & Eq instances if not already defined
instance Eq a => Eq (TrialMonad a) where
  Nil == Nil = True
  Cons x xs == Cons y ys = x == y && xs == ys
  _ == _ = False

instance Show a => Show (TrialMonad a) where
  show Nil = "Nil"
  show (Cons x xs) = "Cons " ++ show x ++ " (" ++ show xs ++ ")"

-- Example values
ex1 :: TrialMonad Int
ex1 = Cons 1 (Cons 2 (Cons 3 Nil))

-- Tests
test_trialMonad :: TestTree
test_trialMonad = testGroup "TrialMonad tests"
  [ 
    -- hlint ignore "Functor law"
    testCase "fmap id" $
      fmap id ex1 @?= ex1

  , -- hlint ignore "Functor law"
    testCase "fmap composition" $
      fmap ((+1) . (*2)) ex1 @?= (fmap (+1) . fmap (*2)) ex1

  , -- hlint ignore "Use <$>"
    testCase "applicative identity" $
      pure id <*> ex1 @?= ex1

  , testCase "append Nil" $
      append ex1 Nil @?= ex1
  ]

