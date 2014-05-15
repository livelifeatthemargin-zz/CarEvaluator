//
//  VSFResultsViewController.m
//  Car Evaluator
//
//  Created by vincentsfong on 5/10/14.
//  Copyright (c) 2014 Vincent Fong. All rights reserved.
//

#import "VSFResultsViewController.h"
#import "VSFViewNotRisky.h"
#import "VSFViewRisky.h"
@interface VSFResultsViewController ()
@property (strong, nonatomic) NSNumber *riskOfCar;
@end

@implementation VSFResultsViewController
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
} */

- (id) initWithResult: (NSNumber *) carRisk {

    self = [super init];
    
    if (self) {
        self.riskOfCar = [carRisk copy];
        NSLog(@"%f", [self.riskOfCar floatValue]);
        
        
        }
    
    return self;

}



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Results";
    
    NSLog(@"View did load %@", _riskOfCar);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
}*/


@end
