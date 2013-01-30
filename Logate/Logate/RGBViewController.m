//
//  RGBViewController.m
//  Logate
//
//  Created by Family on 11/01/13.
//  Copyright (c) 2013 com.redgreenblueapp. All rights reserved.
//

#import "RGBViewController.h"

@interface RGBViewController ()

@end

@implementation RGBViewController

@synthesize usertTextField;
@synthesize passTextField;


- (void)viewDidLoad
{
    [super viewDidLoad];
	UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleBackgroundTouch:)];
    
    gesture.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:gesture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)pushNoticeMe:(id)sender {
    [usertTextField resignFirstResponder];
    [passTextField resignFirstResponder];

    
    NSString *userText = usertTextField.text;
    
    if (userText == nil){
        return;
    }
    
    NSString *message = [NSString stringWithFormat:@"Hola fulano, te llamas %@",userText];
    
    UIAlertView * alerta = [[UIAlertView alloc] initWithTitle:@"a ver que sale"
        message:message delegate:nil
        cancelButtonTitle:@"OK"
        otherButtonTitles:nil,
        nil];
    
    [alerta show];
}

- (IBAction)onDismiss:(id)sender{
    [usertTextField resignFirstResponder];
    [passTextField resignFirstResponder];
}

- (IBAction)handleBackgroundTouch:(id)sender{
    [usertTextField resignFirstResponder];
    [passTextField resignFirstResponder];
}

@end
