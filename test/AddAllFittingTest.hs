module AddAllFittingTest where
import Test.HUnit
import Knapsack
import AddAllFitting

item1 = Item "1" 20 [1, 1, 1]
item2 = Item "2" 10 [100, 1, 1]
item3 = Item "3" 30 [1, 1, 1]

items = [item1, item2, item3]
problem capacity available selected = Knapsack 6000 available selected capacity

oneMoreFit =
    TestCase (assertEqual "One more fits" [item3, item1] (selected $ solve (problem [2, 1000, 1000] [item2, item3] [item1])))
retainsAvailable =
    TestCase (assertEqual "Retains available list" [item2] (available $ solve (problem [2, 1000, 1000] [item2, item3] [item1])))
noneFit = 
    TestCase (assertEqual "None fit" [] (selected $ solve (problem [0, 1000, 1000] items [])))
someFit =
    TestCase (assertEqual "Two items fit" [item3, item1] (selected $ solve (problem [2, 1000, 1000] items [])))
allFit =
    TestCase (assertEqual "All fit" [item3, item2, item1] (selected $ solve (problem [1000, 1000, 1000] items [])))

i1 = Item "1" 1 [1]
i2 = Item "2" 1 [10]
i3 = Item "3" 1 [2]
i4 = Item "4" 1 [10]
i5 = Item "5" 1 [3]
i6 = Item "6" 1 [10]
i7 = Item "7" 1 [4]
i8 = Item "8" 1 [10]
i9 = Item "9" 1 [5]
is = [i1, i2, i3, i4, i5, i6, i7, i8, i9]

k = (Knapsack 1 is [] [10])

items1357Fit =
    TestCase (assertEqual "1 3 5 7 fit" 
                          (Knapsack 1 [i9, i2, i4, i6, i8] (reverse [i1, i3, i5, i7]) [10]) 
                          (solve k))

addAllFittingTests = [ TestLabel "AAF" noneFit
                     , TestLabel "AAF" someFit
                     , TestLabel "AAF" allFit
                     , TestLabel "AAF" oneMoreFit
                     , TestLabel "AAF" retainsAvailable
                     , TestLabel "AAF" items1357Fit
                     ]