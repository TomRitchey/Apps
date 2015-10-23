//
//  The_Klasa.h
//  24_days_tutorial
//
//  Created by Kacper Augustyniak on 06.10.2015.
//  Copyright © 2015 Kacper Augustyniak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface The_Klasa : NSObject
{
    int numerator;
    int denominator;
    int operation;
    
}
-(void)showResults;
-(NSString*)getResults;
//-(NSString*)getFraction;
-(void)setNumerator:(int)n setDenominator:(int)d;
-(void)reduce;
-(int)numerator;
-(int)denominator;
-(int)operation;
-(void)sign:(char)sgn;
+ (The_Klasa *)addFraction:(The_Klasa *)frac1 toFraction:(The_Klasa *)frac2;
-(id)initWithNumerator:(NSInteger)num overDenominator:(NSInteger)denom;

@end
