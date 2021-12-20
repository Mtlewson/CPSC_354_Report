maybeDivide :: Float -> Float -> Maybe Float 
maybeDivide x 0 = Nothing 
maybeDivide x y = Just (x/y)

main = do
    print $ maybeDivide 4 2
