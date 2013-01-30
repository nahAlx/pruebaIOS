//
//  Lesson10ViewController.m
//  DateSample
//
//  Created by Abhishek Mishra on 04/12/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import "Lesson10ViewController.h"

@implementation Lesson10ViewController
@synthesize topLabel;
@synthesize bottomLabel;
@synthesize datePicker;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    bottomLabel.text = @""; 
    topLabel.text = @"Please select a date!";
}

- (void)viewDidUnload
{
    [self setDatePicker:nil];
    [self setTopLabel:nil];
    [self setBottomLabel:nil];
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

- (IBAction)onValueChanged:(id)sender {
    // get todays date
    NSDate* todaysDate = [[NSDate alloc] init];
    
    // get date from date picker
    NSDate* pickerDate = datePicker.date;
    
    // difference between intervals (in days)
    NSTimeInterval dateDifference = [pickerDate 
                                     timeIntervalSinceDate:todaysDate];
    
    double numDays = dateDifference / (3600 * 24);
    bottomLabel.text = [NSString stringWithFormat:@"Difference from today (in days) = %2.0f", numDays];
    
    // display the selected day as a string.
    NSDateFormatter* dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"MMMM d, yyyy"]; 
    
    topLabel.text = [NSString stringWithFormat:@"Selected date:%@",
                     [dateFormat stringFromDate:pickerDate]];
}
@end
