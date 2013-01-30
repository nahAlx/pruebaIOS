//
//  Lesson7ViewController.m
//  AlertSample
//
//  Created by Abhishek Mishra on 15/11/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import "Lesson7ViewController.h"

@implementation Lesson7ViewController
@synthesize userLabel;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    UIAlertView* message = [[UIAlertView alloc] 
                            initWithTitle:@"What is your name?" 
                            message:nil 
                            delegate:self 
                            cancelButtonTitle:@"Ok" 
                            otherButtonTitles:nil];
    
    message.alertViewStyle = UIAlertViewStylePlainTextInput;
    [message show];
}

- (void)viewDidUnload
{
    [self setUserLabel:nil];
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

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    UITextField* field1 = [alertView textFieldAtIndex:0];
    userLabel.text = [NSString stringWithFormat:@"User name:%@", field1.text];
}

@end
