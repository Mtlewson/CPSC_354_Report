data Coordinates = Coord Float Float deriving (Show)
data Boolean2 = True | False

returnCoords :: Coordinates -> [Float]
returnCoords (Coord x y) = [x,y]

coordExample = Coord 2.0 3.0

calculateDistance :: Coordinates -> Coordinates -> Float
calculateDistance (Coord x1 y1) (Coord x2 y2) = sqrt((x2-x1)**2+(y2-y1))


main = do
    print $ coordExample
    print $ returnCoords coordExample
    print $ calculateDistance (Coord 1 2) (Coord 3 4)
