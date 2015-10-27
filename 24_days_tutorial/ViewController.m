//
//  ViewController.m
//  24_days_tutorial
//
//  Created by Kacper Augustyniak on 06.10.2015.
//  Copyright © 2015 Kacper Augustyniak. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()<UITextFieldDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
@property (strong, nonatomic) IBOutlet UILabel *resultLabel;

@property (strong, nonatomic) IBOutlet UITextField *numeratorValue;
@property (strong, nonatomic) IBOutlet UITextField *denominatorValue;
@property (strong, nonatomic) IBOutlet UITextField *numerator2Value;
@property (strong, nonatomic) IBOutlet UITextField *denominator2Value;


@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *hideHeyboard;
@property (strong,nonatomic) NSArray * picker_options;

@property (strong, nonatomic) IBOutlet UIPickerView *operationPicker;
@property (strong, nonatomic) IBOutlet UILabel *numberOne;
@property (strong, nonatomic) IBOutlet UILabel *numberTwo;
@property (strong, nonatomic) IBOutlet UILabel *label0;
@property (strong, nonatomic) IBOutlet UILabel *label1;

@property (strong, nonatomic) IBOutlet NSLayoutConstraint *numerator2TopConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *denominator2TopConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *numerator1TopConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *denominator1TopConstraint;
@property (strong, nonatomic) IBOutlet NSLayoutConstraint *resultLabelTopConstraint;

@property UIScreenEdgePanGestureRecognizer *edgePanGestureRecognizer;
@property UIPercentDrivenInteractiveTransition *percentDrivenInteractiveTransition;




@end

@implementation ViewController
@synthesize numeratorValue;
@synthesize denominatorValue;
@synthesize numerator2Value;
@synthesize denominator2Value;
NSString* labelResultFront = @"The result equals ";
The_Klasa* klasa;
//UIInterfaceOrientation interfaceOrientation;
bool keyboardIsHidden = YES;
bool viewLoadFrstTime = YES;

- (void)viewDidLoad {
    //if(viewLoadFrstTime)
    [super viewDidLoad];
    //if(klasa){
    [self loadingView:YES];
    
    //[klasa setNumerator:3 setDenominator:4];
    //[klasa ];
    [klasa showResults];
    self.denominatorValue.text=@"0";
    self.numeratorValue.text=@"0";
    self.denominator2Value.text=@"0";
    self.numerator2Value.text=@"0";
    
    /*////////////////////////////////
    
    MixedNumber *aMixedNum = [[MixedNumber alloc] init];
    MixedNumber *bMixedNum = [[MixedNumber alloc] init];
    [aMixedNum setWholeNumber:3 andNumerator:2 overDenominator:4];
    
    The_Klasa *bFraction = [[The_Klasa alloc] init];
    
    [bFraction setNumerator:1 setDenominator:3];
    
    [bMixedNum setWholeNumber:4 andFraction:bFraction];
    
    NSLog(@"aMixedNum is"); [aMixedNum display];
    // Uses Fraction's reduce method on the fractional portion of MixedNumber
    NSLog(@"After reducing, aMixedNum is"); [aMixedNum reduce]; [aMixedNum display];
    
    NSLog(@"Addition: ");
    [aMixedNum display]; NSLog(@" + "); [bMixedNum display]; NSLog(@" = ");
    [[MixedNumber addMixedNumber:aMixedNum toMixedNumber:bMixedNum] display];
    // display is invoked on the return value of the add method
    
//    [bFraction relea];
//    [aMixedNum release];
//    [bMixedNum release];
    
    ////////////////////////////////*/
    //observer pan edge
    viewLoadFrstTime = NO;
    NSLog(@"Should be %@",self);
}

-(void)loadingView:(BOOL)firstTime{
    if (firstTime){
        
        self.picker_options = [[NSArray alloc] initWithObjects:@"add",@"substract",@"multiply",@"divide",@"add fractions" , nil];
        klasa = [[The_Klasa alloc] init];
        self.resultLabel.text = labelResultFront;
        [self.resultLabel resignFirstResponder];
        [self hideSecondaryFraction:YES];
        
       
        static dispatch_once_t lock;
        //wykona sie raz
        dispatch_once(&lock, ^{
            [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
            [[NSNotificationCenter defaultCenter]
             addObserver:self selector:@selector(orientationChanged:)
             name:UIDeviceOrientationDidChangeNotification
             object:[UIDevice currentDevice]];
        });
        
        self.edgePanGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleScreenEdgePanGesture:)];
        self.edgePanGestureRecognizer.edges = UIRectEdgeRight;
        [self.view addGestureRecognizer:self.edgePanGestureRecognizer];
    }else{
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)handleScreenEdgePanGesture:(UIScreenEdgePanGestureRecognizer *)sender{
    [self goToSecondaryView];
}

-(void)goToSecondaryView{
   // [[NSNotificationCenter defaultCenter] removeObserver:self name:UIDeviceOrientationDidChangeNotification object:[UIDevice currentDevice]];
   // @autoreleasepool {
    UIViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SideView"];

    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:vc animated:YES completion:nil];
   // }
}

-(IBAction)textFieldReturn:(id)sender
{
    [klasa  setNumerator:[self.numeratorValue.text intValue] setDenominator:[self.denominatorValue.text intValue]];

    if([klasa operation] == 4){
        [self resultLabelRefresh:[self fractionAddition]];
    }else{
        [self resultLabelRefresh:klasa.getResults];
    }
    [sender resignFirstResponder];
    self.numerator1TopConstraint.constant = 47;
    self.denominator1TopConstraint.constant = 47;
    keyboardIsHidden = YES;
}
- (IBAction)keyboardAppeared:(id)sender {
    keyboardIsHidden = NO;
    if(!UIDeviceOrientationIsPortrait([[UIDevice currentDevice] orientation])&& [klasa operation]==4){
        self.numerator1TopConstraint.constant = 8;
        self.denominator1TopConstraint.constant = 8;}
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
    if(row != 4){
        [self resultLabelRefresh:klasa.getResults];
        [self hideSecondaryFraction:YES];
    }else{
        [self resultLabelRefresh:[self fractionAddition]];
        [self hideSecondaryFraction:NO];
        
    }
}
-(NSString *)fractionAddition{
    The_Klasa * temp = [[The_Klasa alloc]init];
    [temp setNumerator:[self.numerator2Value.text intValue] setDenominator:[self.denominator2Value.text intValue]];
    [temp sign:5];
    
    The_Klasa *classAddition = [The_Klasa addFraction:klasa toFraction:temp];
    //NSLog(@"klasa 1 %@  klasa 2 %@",klasa.getResults,temp.getResults);
    [classAddition sign:5];
    return [classAddition getResults];
}


-(void)resultLabelRefresh:(NSString*)input{
        self.resultLabel.text = [NSString stringWithFormat:@"%@ %@",labelResultFront,input];
}


-(void)setResultLabelName:(NSString*)input{
        self.resultLabel.text = [NSString stringWithFormat:@" %@",input];
}
-(NSString*)returnResultLabelName{
    return self.resultLabel.text;
}

-(void)labelsName:(NSInteger)row{
    switch (row) {
        case 0:
            self.numberOne.text = @"Addend 1";
            self.numberTwo.text = @"Addent 2";
            self.view.backgroundColor = [UIColor redColor];
            break;
        case 1:
            self.numberOne.text = @"Minuend";
            self.numberTwo.text = @"Subtrahend";
            self.view.backgroundColor = [UIColor yellowColor];
            break;
        case 2:
            self.numberOne.text = @"Factor 1";
            self.numberTwo.text = @"Factor 2";
            self.view.backgroundColor = [UIColor greenColor];
            break;
        case 3:
            self.numberOne.text = @"Divident";
            self.numberTwo.text = @"Divisor";
            self.view.backgroundColor = [UIColor whiteColor];
        default:
            self.view.backgroundColor = [UIColor whiteColor];
            break;
    }
}

-(void)hideSecondaryFraction:(BOOL)is{
    if(is){
        [self.label0 setHidden:YES];
        [self.label1 setHidden:YES];
        [self.numerator2Value setHidden:YES];
        [self.denominator2Value setHidden:YES];
    }else{
        [self.label0 setHidden:NO];
        [self.label1 setHidden:NO];
        [self.numerator2Value setHidden:NO];
        [self.denominator2Value setHidden:NO];
    }
}

-(void)orientationChanged:(NSNotification *)note{
    NSLog(@"zmiana orientacji na %ld",(long)[[UIDevice currentDevice] orientation]);
    if(UIDeviceOrientationIsLandscape([[UIDevice currentDevice] orientation]) || UIDeviceOrientationIsPortrait([[UIDevice currentDevice] orientation])){
    if(!UIDeviceOrientationIsLandscape([[UIDevice currentDevice] orientation]) ){
        self.numerator1TopConstraint.constant = 47;
        self.denominator1TopConstraint.constant = 47;
        self.numerator2TopConstraint.constant = 35;
        self.denominator2TopConstraint.constant = 35;
        //NSLog(@"Portrait");
    }else{
        self.numerator2TopConstraint.constant = 8;
        self.denominator2TopConstraint.constant = 8;
        if(!keyboardIsHidden){
            self.numerator1TopConstraint.constant = 8;
            self.denominator1TopConstraint.constant = 8;
        }
        //NSLog(@"Non portrait");
    }
    }
}

@end
