//
//  The_Klasa.m
//  24_days_tutorial
//
//  Created by Kacper Augustyniak on 06.10.2015.
//  Copyright © 2015 Kacper Augustyniak. All rights reserved.
//

#import "The_Klasa.h"

@implementation The_Klasa

- (void)showResults {
    NSLog(@"This is a fraction with a value of %d/%d", numerator, denominator);
}

- (void)setNumerator:(int)n {
    numerator = n;
}

- (void)setDenominator:(int)d {
    denominator = d;
}

- (float)getResults{
    float temp_d = denominator;
    float temp_n = numerator;
     //NSLog(@"wynik %.1f",temp);
    return temp_n/temp_d;
}

@end
