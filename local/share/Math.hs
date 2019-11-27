module Math where

import Data.Bits
import Data.List as L
import Data.Word

import Debug.Trace

import Numeric

type P2 a = (a, a)
type I2 = P2 Int
type D2 = P2 Double

infixr 9 :-
data L2 a = P2 a :- (a, a)
  deriving Show

type DL2 = L2 Double

lineBetween :: Num a => P2 a -> P2 a -> L2 a
lineBetween (x, y) (x', y') = (x, y) :- (x' - x, y' - y)

dist :: Num a => P2 a -> P2 a -> Double
dist = undefined

circumenter :: D2 -> D2 -> D2 -> (D2, Double)
circumenter p0 p1 p2 = let c = inters (lineBetween p0 p1) (lineBetween p1 p2)
                       in (c, dist c p0)

inters :: DL2 -> DL2 -> D2
inters = undefined

-- gradients

newtype Hex = Hex { hexValues :: [Int] }

instance Show Hex where
    showsPrec _ = fmap ("0x" ++) . showHex . toI 0 . hexValues where
        toI n (x:xs) = toI (n * 0x100 + fromIntegral x) xs
        toI n _ = n

instance Num Hex where
    (+) = opHex (+)
    (-) = opHex (-)
    (*) = opHex (*)
    signum = error "signum undefined for Hex"
    abs = error "abs undefined for Hex"
    fromInteger = Hex . flip f [] where
        f x stack = let (rem', byte') = quotRem x 0x100
                    in if rem' > 0 then
                        f rem' (fromInteger byte' : stack)
                    else
                        (fromInteger byte' : stack)

opHex :: (Int -> Int -> Int) -> Hex -> Hex -> Hex
opHex op (Hex xs) (Hex ys) = Hex $ (\x -> if x > 0xff then 0xff else x) <$>
    let xsl = L.length xs
        ysl = L.length ys
    in if xsl > ysl then
        L.zipWith op xs (L.replicate (xsl - ysl) 0 ++ ys)
    else
        L.zipWith op (L.replicate (ysl - xsl) 0 ++ xs) ys

valueAt :: (Double, Hex) -> (Double, Hex) -> Double -> Hex
valueAt (t0, c0) (t1, c1) t = opHex (\b0 b1 -> floor (lhv b0 + rhv b1)) c0 c1
    where
    lhv b0 = (t - t0) / tot * (fi b0)
    rhv b1 = (t1 - t) / tot * (fi b1)
    tot = (t1 - t0)


fi :: (Integral a, Num b) => a -> b
fi = fromIntegral
