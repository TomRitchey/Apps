//
//  MixedNumber.h
//  24_days_tutorial
//
//  Created by Kacper Augustyniak on 15.10.2015.
//  Copyright © 2015 Kacper Augustyniak. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "The_Klasa.h"

@interface MixedNumber : The_Klasa
{
    int wholeNumber;
}

- (void)setWholeNumber:(int)number andNumerator:(int)num overDenominator:(int)denom;

- (void)setWholeNumber:(int)number andFraction:(The_Klasa *)frac;

- (void)display;

+ (MixedNumber *)addMixedNumber:(MixedNumber *)num1 toMixedNumber:(MixedNumber *)num2 ;
@end