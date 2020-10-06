

{-
fixpoint takes
1. Function
2. Predicate for when to stop
3. Current value
Returns the final value
-}
fixpoint :: (a -> a) -> (a -> Bool) -> a -> a
fixpoint func isDone value
  | isDone value     = value
  | otherwise        = fixpoint func isDone (func value)


collatz :: Integer -> (Integer,Integer,Integer)
collatz n = fst $ fixpoint next ((== 1) . snd) ((n,0,n),n)
  where next ((initial,count,highest), current) = ((initial,count+1, if (if even current then div current 2 else 3*current + 1) > highest then (if even current then div current 2 else 3*current + 1) else highest), if even current then div current 2 else 3*current + 1)

main = do
  putStrLn "What number will you start with?"
  num1 <- getLine
  let n1 = read num1 :: Integer
  putStrLn "What number will you end with?"
  num2 <- getLine
  let n2 = read num2 :: Integer
  putStrLn "What is your output file?"
  outName <- getLine
  writeFile outName $ show $ map collatz [n1..n2]
