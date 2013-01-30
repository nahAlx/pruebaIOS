//
//  RGBViewController.m
//  UserAlertSheet
//
//  Created by Family on 13/01/13.
//  Copyright (c) 2013 com.redgreenblueapp. All rights reserved.
//

#import "RGBViewController.h"

@interface RGBViewController ()

@end

@implementation RGBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	UIActionSheet *userActionSheet = [[UIActionSheet alloc] initWithTitle:@"user actionSheet" delegate:self cancelButtonTitle:@"cancelar" destructiveButtonTitle:@"destructive" otherButtonTitles:@"otro boton", nil];
    
    [userActionSheet showInView:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
}

@end
