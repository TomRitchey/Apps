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
-(float)getResults;
-(void)setNumerator:(int)n setDenominator:(int)d;
-(int)numerator;
-(int)denominator;
-(void)sign:(char)sgn;

@end
