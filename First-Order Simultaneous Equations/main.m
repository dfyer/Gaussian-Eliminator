//
//  main.m
//  First-Order Simultaneous Equations
//
//  Created by Han Gyu Park on 6/10/15.
//  Copyright (c) 2015 Han Gyu Park. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ElementaryMatrix.h"

#define M 5
#define N 5
double matrix[M][N] = { {-9, 4, 1, 2, 0},
    {1, -6, 7, 3, 0},
    {1, 1, -9, 2, 0},
    {7, 1, 1, -7, 0},
    {1, 1, 1, 1, 1} };

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Hello, World!");

        ElementaryMatrix* em = [[ElementaryMatrix alloc] initWithMatrix:matrix m:M n:N];
        
        [em printEquations];
        
        [em toEchelonForm];
        
        [em printEquations];
    }
    return 0;
}
