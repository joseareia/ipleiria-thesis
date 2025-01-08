-- Factorial function
factorial :: Integer -> Integer
factorial 0 = 1  -- Base case: 0! = 1
factorial n = n * factorial (n - 1)  -- Recursive case

-- Main function to test the factorial
main :: IO ()
main = do
    putStrLn "Enter a number:"
    input <- getLine
    let number = read input :: Integer
    print (factorial number)