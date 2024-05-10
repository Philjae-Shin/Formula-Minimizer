module Simplify where
-- Write all of your code in this file!

import Expr
import Poly

--------------------------------------------------------------------------------
-- * Task 1
-- Define add, which adds 2 expressions together without introducing
-- any 'junk'.

add :: Expr -> Expr -> Expr
add (NumLit a) (NumLit b) = NumLit (a+b)
add (NumLit 0) expr       = expr
add expr (NumLit 0)       = expr
add expr (ExpX 0)         = add expr (NumLit 1)
add (ExpX 0) expr         = add (NumLit 1) expr
add expr1 expr2           = Op AddOp expr1 expr2

--------------------------------------------------------------------------------
-- * Task 2
-- Define mul, which multiplies 2 expressions together without introducing
-- any 'junk'.

mul :: Expr -> Expr -> Expr
mul (NumLit a) (NumLit b) = NumLit (a*b)
mul (NumLit 0) expr       = NumLit 0
mul expr (NumLit 0)       = NumLit 0
mul (NumLit 1) expr       = expr
mul expr (NumLit 1)       = expr
mul (ExpX a) (ExpX b)     = ExpX (a+b)
mul expr (ExpX 0)         = expr
mul (ExpX 0) expr         = expr
mul expr1 expr2           = Op MulOp expr1 expr2

--------------------------------------------------------------------------------
-- * Task 3
-- Define addAll, which adds a list of expressions together into
-- a single expression without introducing any 'junk'.

addAll :: [Expr] -> Expr
addAll [] = NumLit 0
addAll xs = foldr add (NumLit 0) xs

--------------------------------------------------------------------------------
-- * Task 4
-- Define mulAll, which multiplies a list of expressions together into
-- a single expression without introducing any 'junk'.

mulAll :: [Expr] -> Expr
mulAll [] = NumLit 1
mulAll xs = foldr mul (NumLit 1) xs

--------------------------------------------------------------------------------
-- * Task 5
-- Define exprToPoly, which converts an expression into a polynomial.

exprToPoly :: Expr -> Poly
exprToPoly (Op MulOp (NumLit x)(ExpX y)) = listToPoly(map(\z -> if z == y then x else 0)[y,(y-1)..0])
exprToPoly (NumLit x)                    = listToPoly [x]
exprToPoly (ExpX x)                      = listToPoly(map(\z -> if x == z then 1 else 0)[x,(x-1)..0])
exprToPoly (Op MulOp x y)                = exprToPoly x * exprToPoly y
exprToPoly (Op AddOp x y)                = exprToPoly x + exprToPoly y

--------------------------------------------------------------------------------
-- * Task 6
-- Define polyToExpr, which converts a polynomial into an expression.

polyToExpr :: Poly -> Expr
polyToExpr e
    | null x                     = NumLit 0
    | length (polyToList e) == 1 = NumLit (head (polyToList e))
    | otherwise                  = add (mul (NumLit (head x))(ExpX (length x -1))) (polyToExpr (listToPoly (drop 1 x)))
        where x = polyToList e

--------------------------------------------------------------------------------
-- * Task 7
-- Define a function which simplifies an expression by converting it to a
-- polynomial and back again.

simplify :: Expr -> Expr
simplify expr = polyToExpr (exprToPoly expr)

--------------------------------------------------------------------------------
