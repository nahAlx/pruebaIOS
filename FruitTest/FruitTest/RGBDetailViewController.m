//
//  RGBDetailViewController.m
//  FruitTest
//
//  Created by Family on 10/01/13.
//  Copyright (c) 2013 com.redgreenblueapp. All rights reserved.
//

#import "RGBDetailViewController.h"

@interface RGBDetailViewController ()

@end

@implementation RGBDetailViewController

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tirapatras:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
@end
