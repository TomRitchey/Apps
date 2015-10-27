//
//  ViewController2.m
//  24_days_tutorial
//
//  Created by Kacper Augustyniak on 18.10.2015.
//  Copyright © 2015 Kacper Augustyniak. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()
@property (strong, nonatomic) IBOutlet UIScreenEdgePanGestureRecognizer *screenEdgePan;

@property UIScreenEdgePanGestureRecognizer *edgePanGestureRecognizer;
@property UIPercentDrivenInteractiveTransition *percentDrivenInteractiveTransition;
@property (strong, nonatomic) IBOutlet UIScrollView *sectionView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;

//@property (strong, nonatomic) IBOutlet UIView *sectionView;
@property (strong, nonatomic) IBOutlet UIView *colorsView;
@property (strong, nonatomic) IBOutlet UIView *progressView;
@property (strong, nonatomic) IBOutlet UISegmentedControl *sectionControl;

@property (strong, nonatomic) IBOutlet UISlider *redSlider;
@property (strong, nonatomic) IBOutlet UISlider *greenSlider;
@property (strong, nonatomic) IBOutlet UISlider *blueSlider;
@property (strong, nonatomic) IBOutlet UISlider *alphaSlider;
@property (strong, nonatomic) IBOutlet UIStepper *amountStepper;
@property (strong, nonatomic) IBOutlet UIProgressView *progressIndicator;
@property (strong, nonatomic) IBOutlet UILabel *amountLabel;
@property (strong, nonatomic) IBOutlet UISwitch *animatedSwitch;

@end

@implementation ViewController2
int currentView;

UIInterfaceOrientation interfaceOrientation_2;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //observer pan edge
   // self.sectionView.autoresizesSubviews = YES;
    self.edgePanGestureRecognizer = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handleScreenEdgePanGesture:)];
    self.edgePanGestureRecognizer.edges = UIRectEdgeLeft;
    [self.view addGestureRecognizer:self.edgePanGestureRecognizer];
    
    self.view.backgroundColor = [UIColor greenColor];
    
    
    
    self.sectionView.contentSize = CGSizeMake(100.0,100.0);
    self.sectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    self.sectionView.minimumZoomScale = .5;
    self.sectionView.maximumZoomScale = 2.0;
    self.sectionView.zoomScale = 1;
    
    //[self.sectionView addSubview:self.colorsView];
    //self.sectionView.contentSize = self.colorsView.frame.size;
    //*******obserwator do zmiany orientacji****
    static dispatch_once_t obsvr;
    dispatch_once(&obsvr, ^{
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(orientationChanged:)
     name:UIDeviceOrientationDidChangeNotification
     object:[UIDevice currentDevice]];
    });
    //*******************************************
    [self selectSubView:1];
    //[self selectSubView:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)colorSliderChanged {
    float redColor = self.redSlider.value;
    float greenColor = self.greenSlider.value;
    float blueColor = self.blueSlider.value;
    float alphaValue = self.alphaSlider.value;
    UIColor *newBackground = [UIColor colorWithRed:redColor green:greenColor blue:blueColor alpha:alphaValue];
    self.colorsView.backgroundColor = newBackground;
}

- (void)handleScreenEdgePanGesture:(UIScreenEdgePanGestureRecognizer *)sender{
    [self goToPrimaryView];
}

-(void)goToPrimaryView{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
    UIViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MainView"];
    vc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    self.view.window.rootViewController = vc;
    [self presentViewController:vc animated:YES completion:nil];
}
- (IBAction)sectionChanged:(id)sender {
    UISegmentedControl *sectionControl = (UISegmentedControl *)sender;
    [self selectSubView: sectionControl.selectedSegmentIndex];
}

- (void)viewWillAppear:(BOOL)animated
{
     //[self.sectionView setContentOffset:CGPointMake(0,0) animated:YES];
     [self.sectionView scrollRectToVisible:CGRectMake(0, 0, 1, 1)animated:NO];
}

-(void)selectSubView:(int)selection{
    CGRect viewBounds = self.sectionView.bounds;
    viewBounds.size.height = self.sectionView.bounds.size.height;
    viewBounds.size.width = self.sectionView.bounds.size.width;
    currentView = selection;
    if ( selection == 0){
        [self viewWillAppear:YES];
        [[self.sectionView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
        [self.sectionView addSubview:self.colorsView];
        CGRect frame = self.sectionView.bounds;
        frame.size.height = self.colorsView.bounds.size.height;
        frame.size.width = self.sectionView.bounds.size.width;
        self.colorsView.bounds = frame;
        self.sectionView.contentSize = self.colorsView.frame.size;
        
        //self.colorsView.bounds = self.sectionView.bounds;
        //self.colorsView.bounds=viewBounds;
    }else if (selection == 1){
        //self.progressView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        [[self.sectionView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
        [self.sectionView addSubview:self.progressView];
        self.sectionView.contentSize = self.progressView.frame.size;
    }else{
        NSString *ImageURL = @"https://www.google.pl/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png";
        
        UIImage * myImage = [UIImage imageNamed: @"deal_with_it_glasses_by_stewartisme_d5tuvbk_by_b0ss23-d8hr777.png"];
        
        self.imageView.image = myImage;
        
        dispatch_async(dispatch_get_global_queue(0,0), ^{
            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:ImageURL]];
            if ( imageData == nil )
                return;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                self.imageView.image = [UIImage imageWithData:imageData];
            });
        });
        // self.imageView.image = myImage;
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        //self.imageView.bounds.size.width = myImage.size.width;
        self.imageView.frame = self.sectionView.superview.bounds;
        [[self.sectionView subviews] makeObjectsPerformSelector: @selector(removeFromSuperview)];
        [self.sectionView addSubview:self.imageView];
        
        self.sectionView.contentSize = self.imageView.frame.size;
    }
    
}


-(void)orientationChanged:(NSNotification *)note{
    //interfaceOrientation_2 = [[UIApplication sharedApplication] statusBarOrientation];
    [self selectSubView:currentView];
}

- (IBAction)fillAmountChanged {
    NSInteger amount = (NSInteger)self.amountStepper.value;
    // You need two percents to "escape" it and actually display a percent sign
    NSString *amountString = [NSString stringWithFormat:@"%d%%", amount];
    self.amountLabel.text = amountString;
    [self.progressIndicator setProgress:((float)amount / 100.0) animated:self.animatedSwitch.on];
}

- (IBAction)resetContent:(id)sender {
    self.amountStepper.value = 0.0;
    self.amountLabel.text = @"0%";
    [self.animatedSwitch setOn:YES animated:YES];
    [self.progressIndicator setProgress:0.0 animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
