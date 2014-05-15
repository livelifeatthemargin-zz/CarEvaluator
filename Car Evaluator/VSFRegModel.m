//
//  VSFRegModel.m
//  Car Evaluator
//
//  Created by vincentsfong on 5/9/14.
//  Copyright (c) 2014 Vincent Fong. All rights reserved.
//

#import "VSFRegModel.h"
@interface VSFRegModel()


@end
@implementation VSFRegModel

+(NSDictionary *) coefficients
{
    NSDictionary *thecoefficients = @{@"intercept": @34.97,
                                      @"Four Doors": @-4.488,
                                      @"Two Doors":@-.5173,
                                      @"Audi":@-13.21,
                                      @"BMW":@-17.33,
                                      @"Chevrolet":@-19.89,
                                      @"Dodge":@-1.981,
                                      @"Honda":@-19.15,
                                      @"Isuzu":@-36.92,
                                      @"Jaguar":@-33.5,
                                      @"Mazda":@-16.98,
                                      @"Mercedes-Benz":@-15.22,
                                      @"Mitsubishi":@1.156,
                                      @"Nissan":@-16.02,
                                      @"Peugot":@-32.25,
                                      @"Plymouth":@1.304,
                                      @"Porsche":@2.409,
                                      @"Saab":@3.548,
                                      @"Subaru":@-19.30,
                                      @"Toyota":@-18.09,
                                      @"Volkswagen":@-15.62,
                                      @"Volvo":@-32.98,
                                      @"Wheelbase":@-.07302,
                                      @"Curb Weight":@-.003004
                                      };
    return thecoefficients;
}





@end
