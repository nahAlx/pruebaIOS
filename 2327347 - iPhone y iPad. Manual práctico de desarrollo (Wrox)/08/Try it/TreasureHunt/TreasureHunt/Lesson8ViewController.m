//
//  Lesson8ViewController.m
//  TreasureHunt
//
//  Created by Abhishek Mishra on 16/11/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import "Lesson8ViewController.h"

@implementation Lesson8ViewController
@synthesize largeImage;
@synthesize animatedImage;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // install tap gestue recognizer.
    UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] 
                                             initWithTarget:self 
                                             action:@selector(handleTap:)];
    tapRecognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapRecognizer];
    
    // setup animatedImage
    NSArray* frameArray = [[NSArray alloc] initWithObjects:
                           [UIImage imageNamed:@"anim1.png"], 
                           [UIImage imageNamed:@"anim2.png"], 
                           [UIImage imageNamed:@"anim3.png"],
                           [UIImage imageNamed:@"anim4.png"],
                           [UIImage imageNamed:@"anim5.png"],
                           [UIImage imageNamed:@"anim6.png"],
                           nil]; 
    
    animatedImage.animationImages=frameArray;
    animatedImage.animationDuration = 0.5;
    animatedImage.animationRepeatCount = 1;
    animatedImage.userInteractionEnabled = NO;
    [animatedImage setHidden:YES];
}

- (void)viewDidUnload
{
    [self setLargeImage:nil];
    [self setAnimatedImage:nil];
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

- (void) handleTap:(UITapGestureRecognizer*)sender
{
    CGPoint startLocation = [sender locationInView:self.view];
    if ((startLocation.y >= 211) && (startLocation.y <= (211 + 104)))
    {
        [animatedImage setHidden:NO];
        [animatedImage startAnimating];
    }
}

@end
