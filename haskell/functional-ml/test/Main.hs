-- test/Main.hs
import Test.HUnit
import CoreLibrary (greet)  -- Adjust as needed

tests :: Test
tests = TestList
  [ TestCase (assertEqual "greet test" (greet "Tyler") "Hello, Tyler!") ]

main :: IO Counts
main = runTestTT tests
