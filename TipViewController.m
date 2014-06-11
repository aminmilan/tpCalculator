//
//  TipViewController.m
//  tipCalcolator
//
//  Created by Milan Amin on 6/9/14.
//  Copyright (c) 2014 Milan Amin. All rights reserved.
//

#import "TipViewController.h"
#import "SettingsViewController.h"


@interface TipViewController ()
{
    NSString *normalValue;
    NSString *goodValue;
    NSString *veryGoodValue;
}
@property (weak, nonatomic) IBOutlet UITextField *billTextField;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

- (IBAction)onTap:(id)sender;
- (void)updateValues;
@end

@implementation TipViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Tip Calculator";
    }
    return self;
}

- (void)viewDidLoad
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Settings" style:UIBarButtonItemStylePlain target:self action:@selector(onSettingsButton)];
    
    [super viewDidLoad];
    [self updateValues];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateValues];
    
}


- (void)updateValues{
    float billAmount = [self.billTextField.text floatValue];
    [self importTipValues];
    NSArray *tipValues = @[@([normalValue floatValue]/100), @([goodValue floatValue]/100), @([veryGoodValue floatValue]/100)];
  
    [self.tipControl setTitle:[NSString stringWithFormat:@"%@%%",normalValue]  forSegmentAtIndex:0];
    [self.tipControl setTitle:[NSString stringWithFormat:@"%@%%",goodValue]  forSegmentAtIndex:1];
    [self.tipControl setTitle:[NSString stringWithFormat:@"%@%%",veryGoodValue]  forSegmentAtIndex:2];
    
    
    float tipAmount = billAmount * [tipValues[self.tipControl.selectedSegmentIndex] floatValue];
    float totalAmount = tipAmount + billAmount;
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f",tipAmount];
    self.totalLabel.text = [NSString stringWithFormat:@"$%0.2f",totalAmount];
}

- (void)onSettingsButton {
    [self.navigationController pushViewController:[[SettingsViewController alloc] init] animated:YES];
}

- (void)importTipValues {

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    normalValue = [defaults objectForKey:@"normalValue"];
    if (normalValue==nil) normalValue=@"10";
    goodValue = [defaults objectForKey:@"goodValue"];
    if (goodValue==nil) goodValue=@"15";
    veryGoodValue = [defaults objectForKey:@"veryGoodValue"];
    if (veryGoodValue==nil) veryGoodValue=@"20";

}

- (void)viewDidAppear:(BOOL)animated {
     [self updateValues];
}

@end
