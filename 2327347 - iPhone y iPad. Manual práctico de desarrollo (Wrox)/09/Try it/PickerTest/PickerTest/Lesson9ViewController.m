//
//  Lesson9ViewController.m
//  PickerTest
//
//  Created by Abhishek Mishra on 17/11/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import "Lesson9ViewController.h"

@implementation Lesson9ViewController
@synthesize cityAndSubjectPicker;
@synthesize cities;
@synthesize placesOfInterest;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    cities = [[NSArray alloc] 
              initWithObjects:@"New York", @"London", @"Paris", @"Chicago", nil];
    
    placesOfInterest = [[NSArray alloc] 
                        initWithObjects:@"Museums", @"Clubs", @"Schools", 
                        @"Hotels", @"Airports", nil];
}

- (void)viewDidUnload
{
    [self setCityAndSubjectPicker:nil];
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

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0)
        return [cities count];
    
    return [placesOfInterest count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0)
        return [cities objectAtIndex:row];
    
    return [placesOfInterest objectAtIndex:row];
}

- (IBAction)onButtonPressed:(id)sender 
{
    int cityIndex = [cityAndSubjectPicker selectedRowInComponent:0];
    int placeIndex = [cityAndSubjectPicker selectedRowInComponent:1];
    NSString* messsageText = [[NSString alloc] 
                              initWithFormat:@"Are you looking for %@ in %@?", 
                              [placesOfInterest objectAtIndex:placeIndex],
                              [cities objectAtIndex:cityIndex]];
    
    UIAlertView* message = [[UIAlertView alloc] 
                            initWithTitle:@"" 
                            message:messsageText 
                            delegate:nil 
                            cancelButtonTitle:@"Yes" 
                            otherButtonTitles:nil];
    [message show];
}
@end
