module Main where

import Data.Array.Accelerate as A
import qualified Data.Array.Accelerate.LLVM.Native  as Native
import qualified Data.Array.Accelerate.LLVM.PTX     as PTX

import Data.Array.Accelerate.Numeric.LinearAlgebra ((#>))
import qualified Data.Array.Accelerate.Numeric.LinearAlgebra as LinearAlgebra

main = do
  putStrLn "Multiply a matrix by a vector"
  let n = 10
      m = A.fill (I2 n n) 1 :: Acc (Matrix Double)
      v = A.fill (I1 n) 2   :: Acc (Vector Double)
  putStrLn "On the GPU..."
  print $ PTX.run (m #> v)
  putStrLn "Natively..."
  print $ Native.run (m #> v)
