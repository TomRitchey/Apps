//
//  ViewController.m
//  24_days_tutorial
//
//  Created by Kacper Augustyniak on 06.10.2015.
//  Copyright © 2015 Kacper Augustyniak. All rights reserved.
//

#import "ViewController.h"
#import "The_Klasa.h"

@interface ViewController ()<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;

@property (strong, nonatomic) IBOutlet UITextField *numeratorValue;

@property (strong, nonatomic) IBOutlet UITextField *denominatorValue;

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *hideHeyboard;
@property (strong,nonatomic) NSArray * picker_options;

@property (strong, nonatomic) IBOutlet UIPickerView *operationPicker;
@property (strong, nonatomic) IBOutlet UILabel *numberOne;
@property (strong, nonatomic) IBOutlet UILabel *numberTwo;

@end

@implementation ViewController
@synthesize numeratorValue;
@synthesize denominatorValue;
NSString* labelResultFront = @"The result equals ";
The_Klasa* klasa;

- (void)viewDidLoad {
    [super viewDidLoad];
    //if(klasa){
    self.picker_options = [[NSArray alloc] initWithObjects:@"add",@"substract",@"multiply",@"divide", nil];
       klasa = [[The_Klasa alloc] init];
    
    self.resultLabel.text = labelResultFront;
    [self.resultLabel resignFirstResponder];
//    _numeratorValue.returnKeyType = UIReturnKeyDone;
//    [_numeratorValue setDelegate:self];
//    _denominatorValue.returnKeyType = UIReturnKeyDone;
//    [_denominatorValue setDelegate:self];

    [klasa setNumerator:3 setDenominator:4];
    //[klasa ];
    [klasa showResults];
    self.denominatorValue.text=@"j";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)textFieldReturn:(id)sender
{
   
    [klasa  setNumerator:[self.numeratorValue.text intValue] setDenominator:[self.denominatorValue.text intValue]];

        self.resultLabel.text = [NSString stringWithFormat:@"%@ %.1f",labelResultFront,klasa.getResults];
   // [klasa showResults];
    [sender resignFirstResponder];
}


// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component
{
    return [self.picker_options count];
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    return [self.picker_options objectAtIndex:row];
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component
{
    [klasa sign:row];
    [self labelsName:row];
    self.resultLabel.text = [NSString stringWithFormat:@"%@ %.1f",labelResultFront,klasa.getResults];
}
-(void)labelsName:(NSInteger)row{
    switch (row) {
        case 0:
            self.numberOne.text = @"Addend 1";
            self.numberTwo.text = @"Addent 2";
            break;
        case 1:
            self.numberOne.text = @"Minuend";
            self.numberTwo.text = @"Subtrahend";
            break;
        case 2:
            self.numberOne.text = @"Factor 1";
            self.numberTwo.text = @"Factor 2";
            break;
        case 3:
            self.numberOne.text = @"Divident";
            self.numberTwo.text = @"Divisor";
        default:
            
            break;
    }
}
@end
