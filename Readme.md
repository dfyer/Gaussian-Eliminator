## First-Order Equation Solver with Gaussian Elimination

This is implementing Gaussian elimination, but it's very poorly implemented at this moment.

It currently does NOT take variable input. The input is currently set to:

```objc
#define M 5
#define N 5
double matrix[M][N] = { {-9, 4, 1, 2, 0},
                        {1, -6, 7, 3, 0},
                        {1, 1, -9, 2, 0},
                        {7, 1, 1, -7, 0},
                        {1, 1, 1, 1, 1} };
```

The output shows the result of Gaussian Elimination (echelon form), not the complete answers.

```
.. 7.000000 a + 1.000000 b + 1.000000 c + -7.000000 d = 0.000000
.. 0.000000 a + 5.285714 b + 2.285714 c + -7.000000 d = 0.000000
.. 0.000000 a + 0.000000 b + 9.513514 c + -4.135135 d = 0.000000
.. 0.000000 a + 0.000000 b + 0.000000 c + 3.346591 d = 1.000000
.. 0.000000 a + 0.000000 b + 0.000000 c + 0.000000 d = 0.000000
```

### Acknoweldgement

This is free-to-use. If you have any questions, please contact me anytime.
