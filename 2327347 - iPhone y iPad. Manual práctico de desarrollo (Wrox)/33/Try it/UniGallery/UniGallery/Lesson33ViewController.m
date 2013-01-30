//
//  Lesson33ViewController.m
//  UniGallery
//
//  Created by Abhishek Mishra on 01/12/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import "Lesson33ViewController.h"

@implementation Lesson33ViewController
@synthesize galleryImageView;

@synthesize imageFileNames;
@synthesize currentIndex;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == 
        UIUserInterfaceIdiomPhone) 
    {
        self.imageFileNames = [[NSArray alloc] 
                               initWithObjects:@"image_1.png"                                                            
                               @"image_2.png", 
                               @"image_3.png", 
                               @"image_4.png", 
                               @"image_5.png", 
                               nil];
    }
    else
    {
        self.imageFileNames = [[NSArray alloc] 
                               initWithObjects:@"image_1_ipad.png", 
                               @"image_2_ipad.png", 
                               @"image_3_ipad.png", 
                               @"image_4_ipad.png", 
                               @"image_5_ipad.png", 
                               nil];
    }
    
    // load first image
    currentIndex = 0;
    galleryImageView.image = [UIImage imageNamed:[imageFileNames 
                                                  objectAtIndex:currentIndex]];
    
    // left swipe
    UISwipeGestureRecognizer* left_swipe = [[UISwipeGestureRecognizer alloc] 
                                            initWithTarget:self 
                                            action:@selector(handleLeftSwipe:)];
    
    left_swipe.numberOfTouchesRequired = 1;
    left_swipe.cancelsTouchesInView = YES;
    left_swipe.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:left_swipe];
    
    // right swipe
    UISwipeGestureRecognizer* right_swipe = [[UISwipeGestureRecognizer  
                                              alloc] initWithTarget:self 
                                             action:@selector(handleRightSwipe:)];
    
    right_swipe.numberOfTouchesRequired = 1;
    right_swipe.cancelsTouchesInView = YES;
    right_swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:right_swipe];
    
}

- (void)viewDidUnload
{
    [self setGalleryImageView:nil];
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
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void) handleLeftSwipe:(UIGestureRecognizer *)gestureRecognizer
{
    if (currentIndex == ([imageFileNames count] - 1))
        return;
    
    currentIndex++;
    galleryImageView.image = [UIImage imageNamed:[imageFileNames 
                                                  objectAtIndex:currentIndex]];
}

- (void) handleRightSwipe:(UIGestureRecognizer *)gestureRecognizer
{
    if (currentIndex == 0)
        return;
    
    currentIndex--;
    galleryImageView.image = [UIImage imageNamed:[imageFileNames 
                                                  objectAtIndex:currentIndex]];
}

@end
