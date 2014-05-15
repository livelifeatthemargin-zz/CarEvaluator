//
//  VSFViewController.h
//  Car Evaluator
//
//  Created by vincentsfong on 5/9/14.
//  Copyright (c) 2014 Vincent Fong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface VSFViewController : UIViewController <UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate>
@property (strong, nonatomic) NSArray *numDoors;
@property (strong, nonatomic) NSArray *carMake;

@end
