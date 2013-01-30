//
//  Lesson38ViewController.m
//  BackgroundLocation
//
//  Created by Abhishek Mishra on 01/12/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import "Lesson38ViewController.h"

@implementation Lesson38ViewController
@synthesize latValue;
@synthesize lonValue;
@synthesize distValue;
@synthesize countValue;
@synthesize toggleButton;

@synthesize totalDistanceTravelled;
@synthesize numberOfUpdatesProcessed;
@synthesize hasInitialized;
@synthesize hasStarted;
@synthesize locationManager;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // setup Core Location
    hasInitialized = YES;
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.purpose = @"This application will display your current location and the distance travelled since the first reading.";
    
    // setup button
    hasStarted = NO;
    [toggleButton setTitle:@"Start Location Updates" 
                  forState:UIControlStateNormal]; 
    
    // initialize number of updates processed
    numberOfUpdatesProcessed = 0;
    
    // initialize distance travelled
    totalDistanceTravelled = 0;
    distValue.text = [NSString stringWithFormat:@"%2.3f", 
                      totalDistanceTravelled];
    countValue.text = [NSString stringWithFormat:@"%d", 
                       numberOfUpdatesProcessed];
}

- (void)viewDidUnload
{
    [self setLatValue:nil];
    [self setLonValue:nil];
    [self setDistValue:nil];
    [self setCountValue:nil];
    [self setToggleButton:nil];
    [super viewDidUnload];

    if (hasInitialized == YES)
        [self.locationManager stopUpdatingLocation];
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

- (IBAction)onButtonPressed:(id)sender {
    // do not do anything if location manager is not setup
    if (hasInitialized == NO)
        return;
    
    // start 
    if (hasStarted == NO)
    {
        [toggleButton setTitle:@"Stop Location Updates" 
                      forState:UIControlStateNormal];
        [self.locationManager startUpdatingLocation];
        hasStarted = YES;
        return;
    }
    
    // stop
    else if (hasStarted == YES)
    {
        [toggleButton setTitle:@"Start Location Updates" 
                      forState:UIControlStateNormal];
        [self.locationManager stopUpdatingLocation];
        hasStarted = NO;
        return; 
    }
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    if (error.code == kCLErrorDenied)
    {
        hasInitialized = NO;
        [self.locationManager stopUpdatingLocation];
    }
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    // lat/lon values should only be considered if
    // horizontalAccuracy is not negative.
    if (newLocation.horizontalAccuracy >= 0)
    {
        CLLocationDegrees currentLatitude = newLocation.coordinate.latitude;
        CLLocationDegrees currentLongitude =  
        newLocation.coordinate.longitude;
        
        // must have more than one update to compute distance travelled.
        if (numberOfUpdatesProcessed > 0)
        {
            CLLocationDistance distanceTravelled = [oldLocation 
                                                    distanceFromLocation:newLocation];
            totalDistanceTravelled += distanceTravelled;
        }
        
        // increment numberOfUpdatesProcessed
        numberOfUpdatesProcessed++;
        
        // update UI
        latValue.text   = [NSString stringWithFormat:@"%2.3f", 
                           currentLatitude];
        lonValue.text   = [NSString stringWithFormat:@"%2.3f", 
                           currentLongitude];
        distValue.text  = [NSString stringWithFormat:@"%2.3f", 
                           totalDistanceTravelled];
        countValue.text = [NSString stringWithFormat:@"%d", 
                           numberOfUpdatesProcessed];
    }
}

@end
