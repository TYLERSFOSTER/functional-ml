-- File: test/TrialMonadTest.hs
module Main where

import Test.HUnit
import Trials.TrialMonad

-- Add Show & Eq instances if not already defined
instance Eq a => Eq (TrialMonad a) where
  Nil == Nil = True
  Cons x xs == Cons y ys = x == y && xs == ys
  _ == _ = False

instance Show a => Show (TrialMonad a) where
  show Nil = "Nil"
  show (Cons x xs) = "Cons " ++ show x ++ " (" ++ show xs ++ ")"

-- Example values
ex1 = Cons 1 (Cons 2 (Cons 3 Nil))

-- Tests
testFunctorId = TestCase (assertEqual "fmap id" (fmap id ex1) ex1)
testFunctorComp = TestCase (assertEqual "fmap composition"
  (fmap ((+1) . (*2)) ex1)
  ((fmap (+1) . fmap (*2)) ex1))

testApplicativeId = TestCase (assertEqual "applicative identity"
  (pure id <*> ex1)
  ex1)

testAppendNil = TestCase (assertEqual "append Nil" (append ex1 Nil) ex1)

-- Grouped tests
tests = TestList
  [ testFunctorId
  , testFunctorComp
  , testApplicativeId
  , testAppendNil
  ]

main :: IO Counts
main = runTestTT tests
