import Test.HUnit
import Test.QuickCheck
import System.Exit (exitFailure)
import Control.Monad (join, when)

import KnapsackTest
import TakeUntilFullTest
import PreProcessTest
import ItemSortTest
import AddAllFittingTest
import PickMostValuableTest
import ValuatorsTest
import AdaptiveTest

main = do runTests

runTests = do counts <- runTestTT tests 
              when (errors counts > 0 || failures counts > 0) exitFailure

tests = TestList (knapsackTests ++ takeUntilFullTests ++ preProcessTests ++ densitySortTests ++ addAllFittingTests ++ pickMostValuableTests ++ valuatorTests ++ adaptiveTests)