//
//  Lesson34ViewController.h
//  CLTest
//
//  Created by Abhishek Mishra on 04/12/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import <CoreLocation/CoreLocation.h> 
#import <UIKit/UIKit.h>

@interface Lesson34ViewController : UIViewController <CLLocationManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *latValue;
@property (weak, nonatomic) IBOutlet UILabel *lonValue;
@property (weak, nonatomic) IBOutlet UILabel *distValue;
@property (weak, nonatomic) IBOutlet UIButton *toggleButton;

@property BOOL hasInitialized;
@property BOOL hasStarted;
@property (strong, nonatomic) CLLocationManager* locationManager; 

- (IBAction)onButtonPressed:(id)sender;
@end
