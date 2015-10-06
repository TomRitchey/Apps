//
//  ViewController.m
//  24_days_tutorial
//
//  Created by Kacper Augustyniak on 06.10.2015.
//  Copyright © 2015 Kacper Augustyniak. All rights reserved.
//

#import "ViewController.h"
#import "The_Klasa.h"

@interface ViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;

@property (strong, nonatomic) IBOutlet UITextField *numeratorValue;


@property (strong, nonatomic) IBOutlet UITextField *denominatorValue;

@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *hideHeyboard;

@end

@implementation ViewController
@synthesize numeratorValue;
@synthesize denominatorValue;
NSString* labelResultFront = @"The result equals ";
The_Klasa* klasa;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.resultLabel.text = labelResultFront;
    [self.resultLabel resignFirstResponder];
//    _numeratorValue.returnKeyType = UIReturnKeyDone;
//    [_numeratorValue setDelegate:self];
//    _denominatorValue.returnKeyType = UIReturnKeyDone;
//    [_denominatorValue setDelegate:self];
    
    
    klasa = [[The_Klasa alloc] init];
        
    [klasa setDenominator:4];
    [klasa setNumerator:3];
    [klasa showResults];
    self.denominatorValue.text=@"j";

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(IBAction)textFieldReturn:(id)sender
{
   
    [klasa setDenominator:[self.denominatorValue.text intValue]];
    [klasa setNumerator:[self.numeratorValue.text intValue]];
     self.resultLabel.text = [NSString stringWithFormat:@"%@ %.1f",labelResultFront,klasa.getResults];
    NSLog(@"%@ wartość",self.denominatorValue.text );
    [klasa showResults];
    [sender resignFirstResponder];
}


@end
