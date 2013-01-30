//
//  Lesson37ViewController.m
//  AccelTest
//
//  Created by Abhishek Mishra on 01/12/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import "Lesson37ViewController.h"

@implementation Lesson37ViewController
@synthesize playerImage;
@synthesize accelX;
@synthesize accelY;
@synthesize accelZ;
@synthesize gyroX;
@synthesize gyroY;
@synthesize gyroZ;

@synthesize filteredX;
@synthesize filteredY;
@synthesize filteredZ;
@synthesize xVelocity;
@synthesize motionManager;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // instantiate CMMotionManager
    self.motionManager = [[CMMotionManager alloc] init];
    
    // initialize horizontal velocity
    xVelocity = 0.0;
    
    // set up to receive acceleration
    self.motionManager.accelerometerUpdateInterval = 1.0 / 60.0;
    [self.motionManager startAccelerometerUpdatesToQueue:
     [NSOperationQueue currentQueue]
                                             withHandler:^(CMAccelerometerData *accelData, NSError *error)
     {
         // get acceleration values along three axes
         double rawX = accelData.acceleration.x;
         double rawY = accelData.acceleration.y;
         double rawZ = accelData.acceleration.z;
         
         // filter the raw acceleration values using 
         // a high-pass filter
         filteredX = rawX - ((rawX * 0.1) + 
                             (filteredX * 0.9));
         filteredY = rawY - ((rawY * 0.1) + 
                             (filteredY * 0.9));
         filteredZ = rawZ - ((rawZ * 0.1) + 
                             (filteredZ * 0.9));
         
         // display the values
         accelX.text = [NSString stringWithFormat:@"%2.3f", 
                        filteredX];
         accelY.text = [NSString stringWithFormat:@"%2.3f", 
                        filteredY];
         accelZ.text = [NSString stringWithFormat:@"%2.3f", 
                        filteredZ];
         
         // slide playerImage along the X axis
         xVelocity = xVelocity + filteredX;
         float newPlayerX = playerImage.frame.origin.x + 
         xVelocity;
         
         // clamp new position between [20.0, 700.0]
         if (newPlayerX <= 20.0)
         {
             newPlayerX = 20.0;
             xVelocity = 0.0;
         }
         
         if (newPlayerX > 700.0)
         {
             newPlayerX = 700.0;
             xVelocity = 0.0;
         }
         
         playerImage.frame = CGRectMake(newPlayerX,  
                                        playerImage.frame.origin.y, 
                                        playerImage.frame.size.width, 
                                        playerImage.frame.size.height);
     }];
    
    
    if (self.motionManager.gyroAvailable)
    {
        self.motionManager.gyroUpdateInterval = 1.0/60.0;
        
        [self.motionManager startGyroUpdatesToQueue:
         [NSOperationQueue currentQueue]
                                        withHandler:^(CMGyroData *rotationData, NSError *error)
         {
             // get rotation-rate values along three axes
             double rawX = rotationData.rotationRate.x;
             double rawY = rotationData.rotationRate.y;
             double rawZ = rotationData.rotationRate.z;
             
             // display the values
             gyroX.text = [NSString stringWithFormat:@"%2.3f", 
                           rawX];
             gyroY.text = [NSString stringWithFormat:@"%2.3f",  
                           rawY];
             gyroZ.text = [NSString stringWithFormat:@"%2.3f", 
                           rawZ];
         }];
    }
    else
    {
        gyroX.text = @"--";
        gyroY.text = @"--";
        gyroZ.text = @"--";
        
        UIAlertView* noGyroscope = [[UIAlertView alloc] 
                                    initWithTitle:@""
                                    message:@"No gyroscope detected!" 
                                    delegate:nil 
                                    cancelButtonTitle:@"Ok" 
                                    otherButtonTitles:nil];
        [noGyroscope show];
    }
}

- (void)viewDidUnload
{
    [self setPlayerImage:nil];
    [self setAccelX:nil];
    [self setAccelY:nil];
    [self setAccelZ:nil];
    [self setGyroX:nil];
    [self setGyroY:nil];
    [self setGyroZ:nil];
    [super viewDidUnload];

    if (self.motionManager != nil)
    {
        [self.motionManager stopAccelerometerUpdates];
        if (self.motionManager.gyroAvailable)
        {
            [self.motionManager stopGyroUpdates];
        }
    }
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
    return YES;
}

@end
