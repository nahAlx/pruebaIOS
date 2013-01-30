//
//  Lesson23ViewController.m
//  SettingsTest
//
//  Created by Abhishek Mishra on 11/12/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import "Lesson23ViewController.h"

@implementation Lesson23ViewController
@synthesize nameLabel;
@synthesize ageLabel;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // register defaults.
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSMutableDictionary* defaultsDict = [[NSMutableDictionary alloc] 
                                         initWithCapacity:2];
    [defaultsDict setObject:@"Paul Woods" forKey:@"user_name"];
    [defaultsDict setObject:@"28" forKey:@"user_age"];
    
    [userDefaults registerDefaults:defaultsDict];
    [userDefaults synchronize];
    
    // read preferences values and setup labels.
    nameLabel.text = [userDefaults stringForKey:@"user_name"];
    ageLabel.text = [userDefaults stringForKey:@"user_age"];
}

- (void)viewDidUnload
{
    [self setNameLabel:nil];
    [self setAgeLabel:nil];
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

@end
