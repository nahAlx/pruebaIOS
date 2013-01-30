//
//  Lesson17ViewController.m
//  CodeBasedUI
//
//  Created by Abhishek Mishra on 18/11/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import "Lesson17ViewController.h"

@implementation Lesson17ViewController

@synthesize infoButton;
@synthesize countryName;
@synthesize flagView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIImage* contentImage = [UIImage imageNamed:@"flag.png"];
    flagView = [[UIImageView alloc] initWithImage:contentImage];
    flagView.frame = CGRectMake(85, 20, 150, 87);
    [self.view addSubview:flagView];
    
    countryName = [[UILabel alloc] initWithFrame:CGRectMake(10.0, 120.0, 
                                                            300.0, 40.0)];
    countryName.textColor = [UIColor blackColor];
    countryName.backgroundColor = [UIColor clearColor];
    countryName.font = [UIFont systemFontOfSize:12];
    countryName.textAlignment = UITextAlignmentCenter;
    countryName.text = @"United Kingdom of Great Britain and Northern Ireland";
    [self.view addSubview:countryName];
    
    infoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    infoButton.frame = CGRectMake(10.0, 200.0, 300.0, 40.0);
    [infoButton setTitle:@"What is the capital city?" 
                forState:UIControlStateNormal];
    [infoButton addTarget:self 
                   action:@selector(onShowInfo:) 
         forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:infoButton];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void) onShowInfo:(id)sender
{
    UIAlertView* alert = [[UIAlertView alloc] 
                          initWithTitle:@"The capital city of this country is" 
                          message:@"London" 
                          delegate:nil 
                          cancelButtonTitle:@"Ok" 
                          otherButtonTitles:nil];
    [alert show];
}

@end
