//
//  ElementaryMatrix.m
//  First-Order Simultaneous Equations
//
//  Created by Han Gyu Park on 6/10/15.
//  Copyright (c) 2015 Han Gyu Park. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ElementaryMatrix.h"


@implementation ElementaryMatrix
// Constructor
- (id) initWithMatrix:(double[][5])matrix m:(unsigned)m n:(unsigned)n{
    _m = m;
    _n = n;

    _matrix = malloc(sizeof(double*) * _m);
    for(unsigned i = 0; i < _m; i++) {
        _matrix[i] = malloc(sizeof(double) * _n);
        for(unsigned j = 0; j < _n; j++) {
            _matrix[i][j] = matrix[i][j];
        }
    }
    
    return self;
}
// Basic Row Operations
- (void) swapRowAtIndex:(NSUInteger)i withAnotherRow:(NSUInteger)j {
    double tmp;
    for(unsigned k = 0; k < _n; k++) {
        tmp = _matrix[i][k];
        _matrix[i][k] = _matrix[j][k];
        _matrix[j][k] = tmp;
    }
}
- (void) multiplyRowWithScalar:(double)scalar {}
- (void) addToRow:(NSUInteger)i withAnotherRow:(NSUInteger)j withScalarMultipleOf:(double)scalar {}
// Gaussian Elimination
- (bool) toEchelonForm {
    for(unsigned k = 0; k < (_m < _n ? _m : _n); k++) {
        // Find the k-th pivot
        unsigned i_max = 0;
        double max = DBL_MIN;
        for(unsigned i = k; i < _m; i++) {
            if(max < _matrix[i][k]) {
                i_max = i;
                max = _matrix[i][k];
            }
        }
        if(_matrix[i_max][k] == 0) {
            NSLog(@"Matrix is singular");
            return false;
        }
        [self swapRowAtIndex:k withAnotherRow:i_max];
        
        // Do for all rows below pivot
        for(int i = k + 1; i < _m; i++) {
            // Do for all remaining elements in current row
            for(int j = k + 1; j < _n; j++) {
                _matrix[i][j] = _matrix[i][j] - _matrix[k][j] * (_matrix[i][k] / _matrix[k][k]);
            }
            // Fill lower triangular matrix with zeros
            _matrix[i][k] = 0;
        }
    }
    
    return true;
}
// Print
- (void) printEquations {
    for(unsigned i = 0; i < _m; i++) {
        NSString* line = @"";
        for(unsigned j = 0; j < _n - 1; j++) {
            if(j != 0)
                line = [line stringByAppendingString:@" + "];
            line = [line stringByAppendingFormat:@"%f %c", _matrix[i][j], 'a' + j];
        }
        line = [line stringByAppendingFormat:@" = %f", _matrix[i][_n - 1]];
        
        NSLog(@"%@", line);
    }
}
@end