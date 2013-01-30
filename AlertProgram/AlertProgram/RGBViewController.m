//
//  RGBViewController.m
//  AlertProgram
//
//  Created by Family on 13/01/13.
//  Copyright (c) 2013 com.redgreenblueapp. All rights reserved.
//

#import "RGBViewController.h"

@interface RGBViewController ()

@end

@implementation RGBViewController

@synthesize laberUser;

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIAlertView *userAlertView = [[UIAlertView alloc] initWithTitle:@"alerta usuario" message:@"intruduce tu nombre" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil];
    userAlertView.alertViewStyle = UIAlertViewStylePlainTextInput;
    [userAlertView show];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

}

- (void) alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    UITextField *textoAlerta = [alertView textFieldAtIndex:0];
    laberUser.text = textoAlerta.text;
    
}

@end
