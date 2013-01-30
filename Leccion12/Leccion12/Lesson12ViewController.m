//
//  Lesson12ViewController.m
//  Leccion12
//
//  Created by Family on 22/01/13.
//  Copyright (c) 2013 com.redgreenblueapp. All rights reserved.
//

#import "Lesson12ViewController.h"
#import "DetailViewController.h"

@interface Lesson12ViewController ()

@end

@implementation Lesson12ViewController

@synthesize uiTextField;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    DetailViewController * detail = [segue destinationViewController];
    [detail setText:[uiTextField text]];

}

@end
