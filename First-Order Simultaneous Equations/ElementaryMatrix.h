//
//  Header.h
//  First-Order Simultaneous Equations
//
//  Created by Han Gyu Park on 6/10/15.
//  Copyright (c) 2015 Han Gyu Park. All rights reserved.
//

#ifndef First_Order_Simultaneous_Equations_Header_h
#define First_Order_Simultaneous_Equations_Header_h

#import <float.h>
#import <math.h>

@interface ElementaryMatrix : NSObject {
    double** _matrix;    // copied matrix
    unsigned _m;         // # of rows
    unsigned _n;         // # of columns
}
// Constructor
- (id) initWithMatrix:(double[][5])matrix m:(unsigned)m n:(unsigned)n;
// Basic Row Operations
- (void) swapRowAtIndex:(NSUInteger)i withAnotherRow:(NSUInteger)j;
- (void) multiplyRowWithScalar:(double)scalar;
- (void) addToRow:(NSUInteger)i withAnotherRow:(NSUInteger)j withScalarMultipleOf:(double)scalar;
// Gaussian Elimination
- (bool) toEchelonForm;
// Print
- (void) printEquations;
@end

#endif
