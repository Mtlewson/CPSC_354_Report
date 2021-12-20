--Examples used in Part 1 of the report


square x = x * x

addTwoInts :: Int -> Int -> Int
addTwoInts x y = x + y



increment :: Int -> Int
increment x = x + 1


factorial :: Int -> Int
factorial 0 = 1
factorial x = x * factorial (x - 1)

lazyEvaluation :: Double -> Double -> Double
lazyEvaluation x y = x


patternMatch :: Int -> String
patternMatch 1 = "Option 1"
patternMatch 2 = "Option 2"
patternMatch x = "Every other option"

main = do
    print $ addTwoInts 1 2
    print $ factorial 4
    print $ lazyEvaluation 1 2
