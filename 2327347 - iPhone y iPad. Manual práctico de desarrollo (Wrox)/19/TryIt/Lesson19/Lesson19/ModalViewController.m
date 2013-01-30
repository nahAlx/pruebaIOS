//
//  ModalViewController.m
//  Lesson19
//
//  Created by Gene Backlin on 10/11/11.
//  Copyright (c) 2011 MariZack Consulting. All rights reserved.
//

#import "ModalViewController.h"

@implementation ModalViewController
@synthesize text = _text;
@synthesize textLabel = _textLabel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [[self textLabel] setText:[self text]];
}

- (void)viewDidUnload
{
    [self setText:nil];
    [self setTextLabel:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

#pragma mark - IBAction methods

- (IBAction)done:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}


@end
