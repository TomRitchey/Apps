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
    
}
-(void)showResults;
-(float)getResults;
-(void)setNumerator:(int)n;
-(void)setDenominator:(int)d;

@end
