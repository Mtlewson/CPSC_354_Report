--Simple IO Haskell
main = do
    putStrLn "Please enter your name"  
    name <- getLine
    putStrLn ("Hello, " ++ name)  