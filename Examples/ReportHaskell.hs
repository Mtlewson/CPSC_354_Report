data NN = O | S NN
  deriving (Eq,Show) -- for equality and printing

data Coordinates = Coord Float Float --deriving (Show)
data Boolean2 = True | False

returnCoords :: Coordinates -> [Float]
returnCoords (Coord x y) = [x,y]

coordExample = Coord 2.0 3.0

calculateDistance :: Coordinates -> Coordinates -> Float
calculateDistance (Coord x1 y1) (Coord x2 y2) = sqrt((x2-x1)**2+(y2-y1))
--square :: Int -> Int
square x = x * x

addTwoInts :: Int -> Int -> Int
addTwoInts x y = x + y


--increment x = x + 1  

increment :: Int -> Int
increment x = x + 1

incrementP (x) = x + 1

recursivelyDecrement :: Int -> Int -> Int
recursivelyDecrement 0 y = y
--recursivelyDecrement x y = recursivelyDecrement (x-1) (y+1) 
recursivelyDecrement x y = recursivelyDecrement (x-1) (increment y)

recursivelyFindExponent :: Int -> Int
recursivelyFindExponent 2 = 1
recursivelyFindExponent 0 = 0
recursivelyFindExponent x = 1 + recursivelyFindExponent (x `div` 2)

factorial :: Int -> Int
factorial 0 = 1
factorial x = x * factorial (x - 1)

lazyEvaluation :: Double -> Double -> Double
lazyEvaluation x y = x

factorial2 :: Int -> Int
factorial2 x = x * factorial (x - 1)

patternMatch :: Int -> String
patternMatch 1 = "Option 1"
patternMatch 2 = "Option 2"
patternMatch x = "Every other option"

main = do
    --let i = 4.0
    --let j = 2
    --print $ addTwoInts 1 2
    --print $ factorial 4
    print $ coordExample
    print $ addTwoInts (addTwoInts 1 2) (addTwoInts 3 4)
    --print $ lazyEvaluation 1 2
    --print $ addTwoInts 1 2