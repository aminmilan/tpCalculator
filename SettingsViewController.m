//
//  SettingsViewController.m
//  tipCalcolator
//
//  Created by Milan Amin on 6/9/14.
//  Copyright (c) 2014 Milan Amin. All rights reserved.
//

#import "SettingsViewController.h"


@interface SettingsViewController ()
{
    NSString *normalValue;
    NSString *goodValue;
    NSString *veryGoodValue;
}
@property (weak, nonatomic) IBOutlet UITextField *normalTextField;
@property (weak, nonatomic) IBOutlet UITextField *goodTextField;
@property (weak, nonatomic) IBOutlet UITextField *veryGoodTextField;

- (IBAction)onTap:(id)sender;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    normalValue = [defaults objectForKey:@"normalValue"];
    goodValue = [defaults objectForKey:@"goodValue"];
    veryGoodValue = [defaults objectForKey:@"veryGoodValue"];
    
    self.normalTextField.text = normalValue;
    self.goodTextField.text = goodValue;
    self.veryGoodTextField.text = veryGoodValue;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
}

- (void)viewDidDisappear:(BOOL)animated {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.normalTextField.text forKey: @"normalValue"];
    [defaults setObject:self.goodTextField.text forKey:@"goodValue"];
    [defaults setObject:self.veryGoodTextField.text forKey:@"veryGoodValue"];
    [defaults synchronize];
}

@end
