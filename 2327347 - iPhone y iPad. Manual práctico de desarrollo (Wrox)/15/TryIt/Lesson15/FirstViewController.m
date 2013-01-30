//
//  FirstViewController.m
//  Lesson15
//
//  Created by Gene Backlin on 10/12/11.
//  Copyright (c) 2011 MariZack Consulting. All rights reserved.
//

#import "FirstViewController.h"
#import "AppDelegate.h"

@implementation FirstViewController

@synthesize artistCountLabel = _artistCountLabel;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    AppDelegate *appDelegate = 
                 (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [[self artistCountLabel] setText:[NSString stringWithFormat:@"%d", 
                                      [[[appDelegate names] allKeys] count]]];
}

- (void)viewDidUnload
{
    [self setArtistCountLabel:nil];
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
