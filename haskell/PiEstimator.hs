module PiEstimator where

import Control.Parallel (par, pseq)

radius = 10^9
batchSize = radius `div` 2
sqRadius = radius^2

estimateSectionArea :: Integer -> Integer -> Integer
estimateSectionArea yi yf = batchOne `par` (batchTwo + batchOne)
  where batchOne = estimateSectionArea' yi batchSize (findX radius (yi^2)) 0
        batchTwo = estimateSectionArea' batchSize radius (findX radius (batchSize^2)) 0

estimateSectionArea' :: Integer -> Integer -> Integer -> Integer -> Integer
estimateSectionArea' y yf x area
  | y < yf = let nextX = findX x (y^2)
                 nextY = y + 1
                 accArea = area + x
             in nextX `pseq` nextY `seq` accArea `seq` estimateSectionArea' nextY yf nextX accArea
  | otherwise = area

findX :: Integer -> Integer -> Integer
findX x sqY 
  | (x^2 + sqY) > sqRadius = findX (x - 1) sqY
  | otherwise = x


computePi :: Double
computePi = fromIntegral (4 * areaCircle) / fromIntegral areaSquare
  where areaCircle = (4 * estimateSectionArea 0 radius)
        areaSquare = (2 * radius) ^ 2
        
