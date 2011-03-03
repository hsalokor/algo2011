import Test.HUnit
import Test.QuickCheck
import System.Exit (exitFailure)
import Control.Monad (join, when)

import KnapsackTest
import TakeUntilFullTests

main = do runTests

runTests = do counts <- runTestTT tests 
              when (errors counts > 0 || failures counts > 0) exitFailure

tests = knapsackTests ++ takeUntilFullTests