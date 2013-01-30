//
//  ViewController.m
//  Lesson19
//
//  Created by Gene Backlin on 10/11/11.
//  Copyright (c) 2011 MariZack Consulting. All rights reserved.
//

#import "ViewController.h"
#import "PopoverViewController.h"
#import "ModalViewController.h"

@implementation ViewController

@synthesize modalTypePopoverController = _modalTypePopoverController;
@synthesize modalButton = _modalButton;

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
    [self setModalButton:nil];
    [self setModalTypePopoverController:nil];
    [super viewDidUnload];
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
    return YES;
}

#pragma mark - IBAction methods

- (IBAction)selectModalType:(id)sender {
    UIPopoverController *popoverController = [self modalTypePopoverController];
    if(popoverController == nil){   
		PopoverViewController *controller = 
        [[self storyboard] instantiateViewControllerWithIdentifier:@"PopoverView"];
        [controller setDelegate:self];
		popoverController = 
        [[UIPopoverController alloc] initWithContentViewController:controller]; 
        [popoverController setPopoverContentSize:CGSizeMake(320.0, 320.0)];
        [self setModalTypePopoverController:popoverController];
	}
    
    [popoverController presentPopoverFromBarButtonItem:[self modalButton] 
                              permittedArrowDirections:UIPopoverArrowDirectionUp 
                                              animated:YES];
}

#pragma mark - Delegate methods

- (void)showModalView:(UISegmentedControl *)sender {
    UIPopoverController *popoverController = [self modalTypePopoverController];
    ModalViewController *modalView = [[self storyboard] instantiateViewControllerWithIdentifier:@"ModalView"];
    ;
	switch ([sender selectedSegmentIndex]) {
		case 0:
            [modalView setModalTransitionStyle:UIModalTransitionStyleCrossDissolve];
			[modalView setModalPresentationStyle:UIModalPresentationFullScreen];
            [modalView setText:@"UIModalPresentationFullScreen"];
			break;
            
		case 1:
            [modalView setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
			[modalView setModalPresentationStyle:UIModalPresentationPageSheet];
            [modalView setText:@"UIModalPresentationPageSheet"];
			break;
            
		case 2:
            [modalView setModalTransitionStyle:UIModalTransitionStyleCoverVertical];
			[modalView setModalPresentationStyle:UIModalPresentationFormSheet];
            [modalView setText:@"UIModalPresentationFormSheet"];
			break;
			
		case 3:
            [modalView setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
			[modalView setModalPresentationStyle:UIModalPresentationCurrentContext];
            [modalView setText:@"UIModalPresentationCurrentContext"];
			break;
	}
    
    [self dismissPopover:popoverController];
    
	[self presentModalViewController:modalView animated:YES];
}

#pragma mark - Utility methods

- (void)dismissPopover:(UIPopoverController *)popoverController {
    if (popoverController != nil) {
        [popoverController dismissPopoverAnimated:YES];
    }
	[self setModalTypePopoverController:nil];
}


@end
