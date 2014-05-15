//
//  VSFNumDoorsPicker.m
//  Car Evaluator
//
//  Created by vincentsfong on 5/9/14.
//  Copyright (c) 2014 Vincent Fong. All rights reserved.
//

#import "VSFNumDoorsPicker.h"
@interface VSFNumDoorsPicker()
@property (strong, nonatomic) NSArray *numDoors;
@end

@implementation VSFNumDoorsPicker

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.numDoors = @[@"Two Doors", @"Four Doors"];
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/



@end
