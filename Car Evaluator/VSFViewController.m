//
//  VSFViewController.m
//  Car Evaluator
//
//  Created by vincentsfong on 5/9/14.
//  Copyright (c) 2014 Vincent Fong. All rights reserved.
//

#import "VSFViewController.h"
#import "VSFRegModel.h"
#import "VSFResultsViewController.h"
#import "VSFViewNotRisky.h"
#import "VSFViewRisky.h"
@interface VSFViewController ()
@property (weak, nonatomic) IBOutlet UITextField *numDoorsTextField;
@property (weak, nonatomic) IBOutlet UITextField *carMakeTextField;
@property (weak, nonatomic) IBOutlet UITextField *wheelbaseTextField;
@property (weak, nonatomic) IBOutlet UITextField *curbWeight;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIButton *doneButton;


@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UIPickerView *makePicker;

@end

@implementation VSFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *filename = @"Ferrari_458.png";
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    if (screenRect.size.height == 568.0f)
        filename = [filename stringByReplacingOccurrencesOfString:@".png" withString:@"-568h.png"];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:filename]]];
    //UIScrollView *tempScrollView = (UIScrollView *) self.view;
    self.scrollView.contentSize = CGSizeMake(320,800);
    //[self.scrollView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:filename]]];
   
    
    self.numDoorsTextField.delegate = self;
    self.carMakeTextField.delegate = self;
    self.curbWeight.delegate = self;
    self.wheelbaseTextField.delegate = self;
    
    
    [self.wheelbaseTextField setKeyboardType:UIKeyboardTypeDecimalPad];
    [self.curbWeight setKeyboardType:UIKeyboardTypeDecimalPad];
    
    
    _numDoorsTextField.returnKeyType = UIReturnKeyDone;
    
    UIToolbar* numberToolbar = [[UIToolbar alloc]initWithFrame:CGRectMake(0, 0, 320, 50)];
    
    numberToolbar.items = [NSArray arrayWithObjects:
                           [[UIBarButtonItem alloc]initWithTitle:@"Cancel" style:UIBarButtonItemStyleBordered target:self action:@selector(cancelNumberPad:)],
                           [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil],
                           [[UIBarButtonItem alloc]initWithTitle:@"Apply" style:UIBarButtonItemStyleDone target:self action:@selector(doneWithNumberPad:)],
                           nil];
    
    
    self.wheelbaseTextField.inputAccessoryView = numberToolbar;
    self.curbWeight.inputAccessoryView = numberToolbar;
    
    
    _numDoors = @[@"Two Doors", @"Four Doors"];
    
    _carMake = @[@"Audi", @"BMW", @"Chevrolet", @"Dodge", @"Honda", @"Isuzu", @"Jaguar", @"Mazda", @"Mercedes-Benz", @"Mitsubishi", @"Nissan", @"Peugot", @"Plymouth", @"Porsche", @"Saab", @"Subaru", @"Toyota", @"Volkswagen", @"Volvo"];
    
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    if (pickerView == _picker) {
        return _numDoors.count;
    }
    else {
        return _carMake.count;
    }
    
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    if (pickerView == _picker) {
        return _numDoors[row];
    }
    else {
        return _carMake[row];
    }
}

- (void) pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (pickerView == _picker) {
        _numDoorsTextField.text = _numDoors[row];
    } else if(pickerView == _makePicker) {
        _carMakeTextField.text = _carMake[row];
    }
    
}

- (IBAction)textFieldBegin:(id)sender {
    [sender resignFirstResponder];
    _makePicker.hidden = YES;
    _picker.hidden = NO;
    
    
}

- (IBAction)carMakeTextFieldBegin:(id)sender {
    [sender resignFirstResponder];
    _picker.hidden = YES;
    _makePicker.hidden = NO;
}

- (IBAction)wheelBaseTextFieldBegin:(id)sender {
    _picker.hidden = YES;
    _makePicker.hidden = YES;
}

- (IBAction)curbWeightTextFieldBegin:(id)sender {
    _picker.hidden = YES;
    _makePicker.hidden = YES;
}


- (void) textFieldDidBeginEditing:(UITextField *)textField
{
    
        CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y -200);
        [self.scrollView setContentOffset:scrollPoint animated:YES ];

    
    
}

- (void) textFieldDidEndEditing:(UITextField *)textField
{
    CGPoint scrollPoint = CGPointMake(0, textField.frame.origin.y -300);
    [self.scrollView setContentOffset:scrollPoint animated:YES ];
}



-(void)cancelNumberPad: (id) sender{
    if (sender == self.wheelbaseTextField) {
        self.wheelbaseTextField.text = @"";
    }
    //self.wheelbaseTextField.text = @"";
    
    if (sender == self.curbWeight) {
        self.curbWeight.text = @"";
    }
    [self.curbWeight resignFirstResponder];
    [self.wheelbaseTextField resignFirstResponder];
}

-(void)doneWithNumberPad: (id) sender{
    //NSString *numberFromTheKeyboard = numberTextField.text;
    //[self.wheelbaseTextField resignFirstResponder];
    //[self.curbWeight resignFirstResponder];
    [self resignFirstResponder];
    [self.view endEditing:YES];
}



-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    NSLog(@"%@", [touch view]);
    //[self.view endEditing:YES];
    if ([touch view] ==_scrollView) {
        NSLog(@"Touched Scroll View");
        [_makePicker removeFromSuperview];
        [_picker removeFromSuperview];
        _makePicker.hidden = YES;
        _picker.hidden = YES;
    }
    

    /*else if ([touch view] != _makePicker)
        [_makePicker removeFromSuperview]; */
    [self.view endEditing:YES ];
    
}



- (IBAction)doneButtonAction:(id)sender {
    //NSLog(@"button has been pressed!");
    //NSLog(@"%f", [self calculateRiskiness]);
    //VSFResultsViewController *vsfvc = [[VSFResultsViewController alloc] initWithResult:[NSNumber numberWithFloat:[self calculateRiskiness]]];
 
    //[self.navigationController pushViewController:vsfvc animated:YES];
    
}


- (float) calculateRiskiness {
    
    float carRiskiness;
    NSDictionary *coefficients = [VSFRegModel coefficients];
    float intercept = [[coefficients objectForKey:@"intercept"] floatValue];
    float numDoors = [[coefficients objectForKey:self.numDoorsTextField.text] floatValue];
    float carMake = [[coefficients objectForKey:self.carMakeTextField.text] floatValue];
    float wheelbase = [[coefficients objectForKey:@"Wheelbase"] floatValue] * [self.wheelbaseTextField.text floatValue];
    float curbWeight = [[coefficients objectForKey:@"Curb Weight"] floatValue] * [self.curbWeight.text floatValue];
    carRiskiness = intercept + numDoors + carMake + wheelbase + curbWeight;
    return carRiskiness;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"donePushButton"]) {
        VSFResultsViewController *vsfvc = [[VSFResultsViewController alloc] initWithResult:[NSNumber numberWithFloat:[self calculateRiskiness]]];
        vsfvc = (VSFResultsViewController *) segue.destinationViewController;
        if ([self calculateRiskiness] > 0 ) {
            VSFViewRisky *viewRisky = [[VSFViewRisky alloc] initWithFrame:self.view.frame];
            [vsfvc.view addSubview:viewRisky];
            
        } else if ([self calculateRiskiness] <= 0) {
            VSFViewNotRisky *viewNotRisky = [[VSFViewNotRisky alloc] initWithFrame:self.view.frame];
            [vsfvc.view addSubview:viewNotRisky];
        }
        
    }
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self resignFirstResponder];
    self.picker.hidden = YES;
    self.makePicker.hidden = YES;
    self.numDoorsTextField.text = @"";
    self.carMakeTextField.text = @"";
    self.curbWeight.text = @"";
    self.wheelbaseTextField.text = @"";
    
    
    
    // to reload selected cell
}





@end
