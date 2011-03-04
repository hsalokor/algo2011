module TakeUntilFull where
import Knapsack
import Data.List
import First

solve :: Knapsack -> Knapsack

solve = takeUntilFull

takeUntilFull :: Knapsack -> Knapsack
takeUntilFull problem@(Knapsack _ [] _ _) = problem
takeUntilFull problem | fit problemCapacity weightWithOneMore = oneMore
                        where oneMore = takeUntilFull $ First.solve problem
                              weightWithOneMore = map weight $ selected oneMore
                              problemCapacity = capacity problem
takeUntilFull problem = problem
