//
//  NSArray-RandomObject.m
//  24_days_tutorial
//
//  Created by Kacper Augustyniak on 19.10.2015.
//  Copyright © 2015 Kacper Augustyniak. All rights reserved.
//

#import "NSArray-RandomObject.h"

@implementation NSArray(RandomObjects) - (id)randomObject{
//    self.randomArray = [[self.randomArray shuffledArray] mutableCopy];
//    NSInteger index = arc4random() % [self.randomArray count] - 1;
//    id object = [self.randomArray objectAtIndex:index];
//    [self.randomArray removeObjectAtIndex:index];
//    return object;
    return self;
}

@end
