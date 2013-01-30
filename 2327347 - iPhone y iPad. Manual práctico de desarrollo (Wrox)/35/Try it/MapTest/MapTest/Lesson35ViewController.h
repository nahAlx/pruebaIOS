//
//  Lesson35ViewController.h
//  MapTest
//
//  Created by Abhishek Mishra on 01/12/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "PlacemarkClass.h"

@interface Lesson35ViewController : UIViewController <MKMapViewDelegate> 

@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *mapModeSegmentControl;

@property (strong, nonatomic) PlacemarkClass* parliamentAnnotation;
- (IBAction)onSegmentChanged:(id)sender;
@end
