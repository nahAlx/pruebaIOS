//
//  Lesson31ViewController.m
//  Bounce
//
//  Created by Abhishek Mishra on 05/12/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import "Lesson31ViewController.h"

@implementation Lesson31ViewController

@synthesize ballImage;
@synthesize animationTimer;

@synthesize velocityX;
@synthesize velocityY;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    velocityX = 10;
    velocityY = 17;
    
    animationTimer = [NSTimer scheduledTimerWithTimeInterval:0.1
                                                      target:self 
                                                    selector:@selector(onTimerFired:) 
                                                    userInfo:nil 
                                                     repeats:YES];
}

- (void)viewDidUnload
{
    [animationTimer invalidate];
    
    [self setBallImage:nil];
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
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}


- (void) onTimerFired:(NSTimer*)timer
{
    // current position of ball
    int ballRadius = 34;
    int currentX = ballImage.frame.origin.x + ballRadius;
    int currentY = ballImage.frame.origin.y + ballRadius;
    
    // new position of ball
    int newX = currentX + velocityX;
    int newY = currentY + velocityY;
    
    // ensure new position is within the bounds of the screen
    
    // left
    if (newX < ballRadius)
    {
        newX = ballRadius;
        velocityX = velocityX * -1;
    }
    
    // top
    if (newY < ballRadius)
    {
        newY = ballRadius;
        velocityY = velocityY * -1;
    }
    
    // right
    if (newX > 320 - ballRadius)
    {
        newX = 320 - ballRadius;
        velocityX = velocityX * -1;
    }
    
    // bottom
    if (newY > 460 - ballRadius)
    {
        newY = 460 - ballRadius;
        velocityY = velocityY * -1;
    }
    
    // put ball in new place.
    ballImage.frame = CGRectMake(newX - ballRadius, 
                                 newY - ballRadius, 
                                 ballRadius * 2, 
                                 ballRadius * 2);
}

@end
