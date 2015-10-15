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

- (NSString*)getResults{
    float temp_d = denominator;
    float temp_n = numerator;
     //NSLog(@"wynik %.1f",temp);
    //(denominator % 2 == 0)?NSLog(@"Denominator is even"):NSLog(@"Denominator is odd");
    switch (operation) {
        case 0:
            return [[NSNumber numberWithFloat:temp_n+temp_d] stringValue];
            break;
        case 1:
            return [[NSNumber numberWithFloat:temp_n-temp_d] stringValue];
            break;
        case 2:
            //NSLog(@"%@",[[NSNumber numberWithFloat:temp_n*temp_d] stringValue]);
            return [[NSNumber numberWithFloat:temp_n*temp_d] stringValue];
            break;
        case 3:
            return [[NSNumber numberWithFloat:temp_n/temp_d] stringValue];
            break;
        default:
            
            
            return self.returnStringFraction;
            break;
    }
}

-(NSString*)returnStringFraction{
    int u = numerator;
    int v = denominator;
    int temp = 0;

    while (v != 0) {
        temp = u % v;
        u = v;
        v = temp;
    }
    
    
    return [NSString stringWithFormat:@"%d / %d", numerator/u, denominator/u];
}

-(int)numerator{
    return numerator;
}

-(int)denominator{
    return denominator;
}


-(int)operation{
    return operation;
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
            operation = 4;
            break;
    }
}

+ (The_Klasa *)addFraction:(The_Klasa *)frac1 toFraction:(The_Klasa *)frac2 {
    The_Klasa *result = [[The_Klasa alloc] init];       
    NSInteger resultNum = frac1.numerator * frac2.denominator + frac1.denominator * frac2.numerator;
    NSInteger resultDenom = frac1.denominator * frac2.denominator;
//    NSLog(@"num %i den %i num1 %i den1 %i num2 %i den2 %i",resultNum,resultDenom,frac1.numerator,frac1.denominator,frac2.numerator,frac2.denominator);
    
    
    [result setNumerator:resultNum setDenominator:resultDenom];
    //[result reduce];
    
    return result;
}

@end
