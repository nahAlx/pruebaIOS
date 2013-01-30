//
//  Lesson35ViewController.m
//  MapTest
//
//  Created by Abhishek Mishra on 01/12/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import "Lesson35ViewController.h"

@implementation Lesson35ViewController
@synthesize mapView;
@synthesize mapModeSegmentControl;
@synthesize parliamentAnnotation;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // setup the map's delegate
    mapView.delegate = self;
    
    // setup the map's location and zoom factor
    MKCoordinateRegion mapRegion; 
    mapRegion.center.latitude=51.5001524; 
    mapRegion.center.longitude=-0.1262362; 
    mapRegion.span.latitudeDelta=0.2; 
    mapRegion.span.longitudeDelta=0.2;
    
    [mapView setRegion:mapRegion animated:YES];
    
    // drop a pin on parliament square
    CLLocationCoordinate2D parliamentLocation = CLLocationCoordinate2DMake(51.5001524, -0.1262362);
    parliamentAnnotation = [[PlacemarkClass alloc] 
                            initWithCoordinate:parliamentLocation
                            title:@"Parliament Square" 
                            subtitle:@"Big Ben is here!"];
    [mapView addAnnotation:parliamentAnnotation];
}

- (void)viewDidUnload
{
    [self setMapModeSegmentControl:nil];
    [self setMapView:nil];
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
    return YES;
}

- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation
{
    MKPinAnnotationView *newAnnotation = [[MKPinAnnotationView alloc] 
                                          initWithAnnotation:annotation 
                                          reuseIdentifier:@"annotation1"];
    newAnnotation.pinColor = MKPinAnnotationColorGreen;
    newAnnotation.animatesDrop = YES; 
    newAnnotation.canShowCallout = YES;
    [newAnnotation setSelected:YES animated:YES]; 
    return newAnnotation;
}

- (IBAction)onSegmentChanged:(id)sender {
    
    if (mapModeSegmentControl.selectedSegmentIndex == 0){
        mapView.mapType = MKMapTypeStandard;
    }
    else if (mapModeSegmentControl.selectedSegmentIndex == 1){
        mapView.mapType = MKMapTypeSatellite;
    }
    else if (mapModeSegmentControl.selectedSegmentIndex == 2){
        mapView.mapType = MKMapTypeHybrid;
    }
}
@end
