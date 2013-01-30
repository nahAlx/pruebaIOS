//
//  Lesson38ViewController.h
//  BackgroundLocation
//
//  Created by Abhishek Mishra on 01/12/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h> 

@interface Lesson38ViewController : UIViewController <CLLocationManagerDelegate>
@property (weak, nonatomic) IBOutlet UILabel *latValue;
@property (weak, nonatomic) IBOutlet UILabel *lonValue;
@property (weak, nonatomic) IBOutlet UILabel *distValue;
@property (weak, nonatomic) IBOutlet UILabel *countValue;
@property (weak, nonatomic) IBOutlet UIButton *toggleButton;

- (IBAction)onButtonPressed:(id)sender;

@property double totalDistanceTravelled;
@property long numberOfUpdatesProcessed;
@property BOOL hasInitialized;
@property BOOL hasStarted;
@property (strong, nonatomic) CLLocationManager* locationManager;

@end
