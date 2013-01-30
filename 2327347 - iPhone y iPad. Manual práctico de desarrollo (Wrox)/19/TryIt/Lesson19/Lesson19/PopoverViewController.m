//
//  PopoverViewController.m
//  Lesson19
//
//  Created by Gene Backlin on 10/11/11.
//  Copyright (c) 2011 MariZack Consulting. All rights reserved.
//

#import "PopoverViewController.h"
#import "ModalViewController.h"

@implementation PopoverViewController
@synthesize delegate = _delegate;
@synthesize modalTypeSegmentedController = _modalTypeSegmentedController;

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
}

- (void)viewDidUnload
{
    [self setModalTypeSegmentedController:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

#pragma mark - IBAction methods

- (IBAction)showModalView:(id)sender {
    [[self delegate] showModalView:[self modalTypeSegmentedController]];
}


@end
