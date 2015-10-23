//
//  MixedNumber.m
//  24_days_tutorial
//
//  Created by Kacper Augustyniak on 15.10.2015.
//  Copyright © 2015 Kacper Augustyniak. All rights reserved.
//

#import "MixedNumber.h"

@implementation MixedNumber
- (void)setWholeNumber:(int)number andNumerator:(int)num overDenominator:(int)denom {
    wholeNumber = number;
    numerator = num;
    denominator = denom;
}

- (void)setWholeNumber:(int)number andFraction:(The_Klasa *)frac {
    wholeNumber = number;
    numerator = frac.numerator;
    denominator = frac.denominator;
}

- (void)display {
    NSString *numberString = [[NSString alloc] initWithFormat:@"%d", self->wholeNumber];
    NSString *numeratorString = [[NSString alloc] initWithFormat:@"%d", self.numerator];
    NSString *denominatorString = [[NSString alloc] initWithFormat:@"%d", self.denominator];
    NSLog(@"%@+(%@/%@)", numberString, numeratorString, denominatorString);
//    [denominatorString release];
//    [numeratorString release];
//    [numberString release];
}

+ (MixedNumber *)addMixedNumber:(MixedNumber *)num1 toMixedNumber:(MixedNumber *)num2 {
    // Store result in "result"
    MixedNumber *result = [[MixedNumber alloc] init];
    result->wholeNumber = num1->wholeNumber + num2->wholeNumber;
    result->numerator = num1->numerator * num2->denominator + num1.denominator * num2->numerator;
    result->denominator = num1->denominator * num2->denominator;
    
    // Reduce
    if (result.numerator > result.denominator) {
        int extra = result.numerator / result.denominator;
        result->wholeNumber += extra;    // Taking advantage of integer division
        result->numerator -= extra * result.denominator;
        
        int u = result.numerator;
        int v = result.denominator;
        int temp = 0;

        while (v != 0) {
            temp = u % v;
            u = v;
            v = temp;
        }
        result->numerator /= u;
        result->denominator /= u;
    }
    return result;
}
@end
