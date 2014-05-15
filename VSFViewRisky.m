//
//  VSFViewRisky.m
//  Car Evaluator
//
//  Created by vincentsfong on 5/10/14.
//  Copyright (c) 2014 Vincent Fong. All rights reserved.
//

#import "VSFViewRisky.h"

@implementation VSFViewRisky

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        NSString *filename = @"ferrari_enzo_crash.png";
        
        UIImage *img = [UIImage imageNamed:filename];
        UIImage *imgForView = [self resizeImage:img imageSize:self.frame.size];
        
        UIImageView *imageView = [[UIImageView alloc] initWithImage:imgForView];
        
        [self addSubview:imageView];

    }
    return self;
}


-(UIImage*)resizeImage:(UIImage *)image imageSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0,size.width,size.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    //here is the scaled image which has been changed to the size specified
    UIGraphicsEndImageContext();
    return newImage;
    
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
