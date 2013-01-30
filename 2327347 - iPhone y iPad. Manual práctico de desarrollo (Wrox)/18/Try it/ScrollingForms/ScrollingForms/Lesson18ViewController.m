//
//  Lesson18ViewController.m
//  ScrollingForms
//
//  Created by Abhishek Mishra on 22/11/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import "Lesson18ViewController.h"

@implementation Lesson18ViewController

@synthesize keyboardHeight;
@synthesize currentTextField;

@synthesize scrollView;
@synthesize usernameField;
@synthesize passwordField;
@synthesize addressField1;
@synthesize addressField2;
@synthesize postcodeField;


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    usernameField.delegate = self;
    passwordField.delegate = self;
    addressField1.delegate = self;
    addressField2.delegate = self;
    postcodeField.delegate = self;
} 

- (void)viewDidUnload
{
    [self setScrollView:nil];
    [self setUsernameField:nil];
    [self setPasswordField:nil];
    [self setAddressField1:nil];
    [self setAddressField2:nil];
    [self setPostcodeField:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] addObserver:self                                           
                                             selector:@selector(keyboardDidShow:)
                                                 name:UIKeyboardDidShowNotification 
                                               object:self.view.window];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidHide:) 
                                                 name:UIKeyboardDidHideNotification
                                               object:nil];
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
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidShowNotification 
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification 
                                                  object:nil];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void) keyboardDidShow:(NSNotification *) notification 
{ 
    // get height of keyboard
    NSDictionary* info = [notification userInfo];
    CGRect keyboardFrame = [[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    keyboardHeight =  keyboardFrame.size.height;
    
    // ensure current text field is visible, if not adjust the contentOffset
    // of the scrollView appropriately.
    float textFieldTop = currentTextField.frame.origin.y;
    float textFieldBottom = textFieldTop + currentTextField.frame.size.height;
    
    if (textFieldBottom > keyboardHeight)
    {
        [scrollView setContentOffset:CGPointMake(0, textFieldBottom - keyboardHeight) 
                            animated:YES];
    }
}

-(void) keyboardDidHide:(NSNotification *) notification 
{
    [scrollView setContentOffset:CGPointMake(0, 0) 
                        animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    // save reference to currently-active text field
    currentTextField = textField;
    
    // ensure this field is visible by adjusting the contentOffset
    // property of the scrollView instance appropruately.
    float textFieldTop = currentTextField.frame.origin.y;
    float textFieldBottom = textFieldTop + 
    currentTextField.frame.size.height;
    
    if ((textFieldBottom > keyboardHeight) && (keyboardHeight != 0.0))
    {
        [scrollView setContentOffset:CGPointMake(0, textFieldBottom - 
                                                 keyboardHeight) 
                            animated:YES];
    }
}


@end
