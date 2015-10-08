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

- (void)setNumerator:(int)n setDenominator:(int)d {
    numerator = n;
    denominator = d;
    //adsadsad
}

- (float)getResults{
    float temp_d = denominator;
    float temp_n = numerator;
     //NSLog(@"wynik %.1f",temp);
    //(denominator % 2 == 0)?NSLog(@"Denominator is even"):NSLog(@"Denominator is odd");
    switch (operation) {
        case 0:
            return temp_n+temp_d;
            break;
        case 1:
            return temp_n-temp_d;
            break;
        case 2:
            return temp_n*temp_d;
            break;
        case 3:
            return temp_n/temp_d;
        default:
            return temp_n/temp_d;
            break;
    }
}

-(int)numerator{
    return numerator;
}

-(int)denominator{
    return denominator;
}

-(void)sign:(char)sgn{
    switch (sgn) {
        case 0:
            operation = 0;
            break;
        case 1:
            operation = 1;
            break;
        case 2:
            operation = 2;
            break;
        case 3:
            operation = 3;
            break;
        default:
            operation = 3;
            break;
    }
}


@end
