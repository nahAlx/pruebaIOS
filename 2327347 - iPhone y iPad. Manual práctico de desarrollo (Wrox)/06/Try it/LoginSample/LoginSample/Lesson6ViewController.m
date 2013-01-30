//
//  Lesson6ViewController.m
//  LoginSample
//
//  Created by Abhishek Mishra on 14/11/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import "Lesson6ViewController.h"

@implementation Lesson6ViewController
@synthesize usernameField;
@synthesize passwordField;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] 
                                             initWithTarget:self 
                                             action:@selector(handleBackgroundTap:)];
    tapRecognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapRecognizer];
}

- (void)viewDidUnload
{
    [self setUsernameField:nil];
    [self setPasswordField:nil];
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

- (IBAction)onDismissKeyboard:(id)sender {
    [usernameField resignFirstResponder];
    [passwordField resignFirstResponder];
}

- (IBAction)onLogin:(id)sender {
    [usernameField resignFirstResponder];
    [passwordField resignFirstResponder];
    
    NSString* username = usernameField.text;
    
    int length = [username length];
    if (length == 0)
        return;
    
    NSString* alertMessage = [NSString stringWithFormat:@"Welcome %@", 
                              username];
    
    UIAlertView* welcomeMessage = [[UIAlertView alloc] 
                                   initWithTitle:@"Login succesfull"
                                   message:alertMessage 
                                   delegate:nil 
                                   cancelButtonTitle:@"Ok" 
                                   otherButtonTitles:nil];
    
    [welcomeMessage show];
}

- (void) handleBackgroundTap:(UITapGestureRecognizer*)sender
{
    [usernameField resignFirstResponder];
}

@end
