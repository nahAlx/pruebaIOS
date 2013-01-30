//
//  ViewController.m
//  Lesson29
//
//  Created by Gene Backlin on 11/23/11.
//  Copyright (c) 2011 MariZack Consulting. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize phaseLabel;
@synthesize tapCountLabel;
@synthesize touchCountLabel;
@synthesize touchView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self becomeFirstResponder];
    
    [self updateDisplayWithPhase:@"" tapCount:0 touchCount:0];
    [self createGestureRecognizers];
}

- (void)viewDidUnload
{
    [self setPhaseLabel:nil];
    [self setTapCountLabel:nil];
    [self setTouchCountLabel:nil];
    [self setTouchView:nil];
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

- (BOOL)canBecomeFirstResponder {
    return YES;
}

#pragma mark - Create Gesture Recognizers

- (void)createGestureRecognizers {
    [self createSingleTapRecognizer];
    [self createDoubleTapRecognizer];
    [self createPinchRecognizer];
    [self createSwipeRecognizers];
}

- (void)createSingleTapRecognizer {
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] 
                                          initWithTarget:self 
                                          action:@selector(handleSingleTapEvent:)];
    [[self view] addGestureRecognizer:recognizer];
    [recognizer setDelegate:self];
}

- (void)createDoubleTapRecognizer {
    UITapGestureRecognizer *recognizer = [[UITapGestureRecognizer alloc] 
                                          initWithTarget:self 
                                          action:@selector(handleDoubleTapEvent:)];
    [[self view] addGestureRecognizer:recognizer];
    [recognizer setDelegate:self];
    [recognizer setNumberOfTapsRequired:2];
}

- (void)createPinchRecognizer {
    UIPinchGestureRecognizer *recognizer = [[UIPinchGestureRecognizer alloc] 
                                            initWithTarget:self 
                                            action:@selector(handlePinchEvent:)];
    [[self view] addGestureRecognizer:recognizer];
    [recognizer setDelegate:self];
}

- (void)createSwipeRecognizers {
    [self createSwipeRecognizer:UISwipeGestureRecognizerDirectionLeft];
    [self createSwipeRecognizer:UISwipeGestureRecognizerDirectionRight];
    [self createSwipeRecognizer:UISwipeGestureRecognizerDirectionUp];
    [self createSwipeRecognizer:UISwipeGestureRecognizerDirectionDown];
}

- (void)createSwipeRecognizer:(UISwipeGestureRecognizerDirection)direction {
    UISwipeGestureRecognizer *recognizer = [[UISwipeGestureRecognizer alloc] 
                                            initWithTarget:self 
                                            action:@selector(handleSwipeEvent:)];
    [[self view] addGestureRecognizer:recognizer];
	[recognizer setDirection:direction];    
}

#pragma mark - Event Handlers

- (void)handleSingleTapEvent:(UITapGestureRecognizer *)recognizer {
    [self updateDisplayWithPhase:@"UITapGestureRecognizer" tapCount:1 touchCount:1];
    [self moveImage:recognizer];
}

- (void)handleDoubleTapEvent:(UITapGestureRecognizer *)recognizer {
    [self updateDisplayWithPhase:@"UITapGestureRecognizer" tapCount:2 touchCount:1];
    [self moveImage:recognizer];
}

- (void)handlePinchEvent:(UIPinchGestureRecognizer *)recognizer {
    [self updateDisplayWithPhase:@"UIPinchGestureRecognizer" tapCount:1 touchCount:2];
    
    CGFloat scale = [(UIPinchGestureRecognizer *)recognizer scale];
    
	if ([recognizer state] == UIGestureRecognizerStateEnded) {
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.10];
		[[self touchView] setTransform:CGAffineTransformIdentity];
		[UIView commitAnimations];			
	} else {
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.10];
		[[self touchView] setTransform:CGAffineTransformMakeScale(scale, scale)];
		[UIView commitAnimations];
	}
}

- (void)handleSwipeEvent:(UISwipeGestureRecognizer *)recognizer {
	NSString *swipeDirection = nil;
	CGPoint location = [recognizer locationInView:[self view]];
	[[self touchView] setCenter:location];
	
	if([recognizer direction] == UISwipeGestureRecognizerDirectionLeft) {
		swipeDirection = @"UISwipeGestureRecognizerDirectionLeft";
        location.x -= 150.0;
	} else if([recognizer direction] == UISwipeGestureRecognizerDirectionRight) {
		swipeDirection = @"UISwipeGestureRecognizerDirectionRight";
        location.x += 150.0;
	} else if(([recognizer direction] == UISwipeGestureRecognizerDirectionUp)) {
		swipeDirection = @"UISwipeGestureRecognizerDirectionUp";
        location.y -= 150.0;
	} else if(([recognizer direction] == UISwipeGestureRecognizerDirectionDown)) {
		swipeDirection = @"UISwipeGestureRecognizerDirectionDown";
        location.y += 150.0;
	}
    
    if(swipeDirection != nil) {
        [self updateDisplayWithPhase:swipeDirection tapCount:1 touchCount:1];
		[UIView beginAnimations:nil context:nil];
		[UIView setAnimationDuration:0.50];
		[[self touchView] setCenter:location];
		[UIView commitAnimations];
    }
}

#pragma mark - Utility methods

- (void)updateDisplayWithPhase:(NSString *)phase 
                      tapCount:(int)tapCount 
                    touchCount:(int)touchCount {
	[[self phaseLabel] setText:[NSString stringWithFormat:@"Touch Phase: %@", phase]];
	[[self tapCountLabel] setText:[NSString stringWithFormat:@"Tap Count: %d", tapCount]];
	[[self touchCountLabel] setText:[NSString stringWithFormat:@"Touch Count: %d", touchCount]];
}

- (void)moveImage:(UIGestureRecognizer *)recognizer {
    CGPoint location = [recognizer locationInView:[self view]];
    
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:0.10];
	[[self touchView] setCenter:location];
	[UIView commitAnimations];
}


@end
