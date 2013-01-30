//
//  Lesson11ViewController.m
//  CustomPickerTest
//
//  Created by Abhishek Mishra on 17/11/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import "Lesson11ViewController.h"

@implementation Lesson11ViewController
@synthesize resultLabel;
@synthesize fruitPicker;

@synthesize dataForComponent1;
@synthesize dataForComponent2;
@synthesize dataForComponent3;

@synthesize nameToImageMapping;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    dataForComponent1 = [[NSArray alloc] initWithObjects:@"Apple", 
                         @"Banana", @"Lemon", @"Orange", 
                         @"Peach", @"Pear", @"Pineapple", nil];
    
    dataForComponent2 = [[NSArray alloc] initWithObjects:@"Banana",
                         @"Orange", @"Pear", @"Apple", 
                         @"Pineapple", @"Lemon", @"Peach", nil];
    
    dataForComponent3 = [[NSArray alloc] initWithObjects:@"Pear", 
                         @"Peach", @"Lemon", @"Pineapple", 
                         @"Apple", @"Banana", @"Orange", nil];
    
    nameToImageMapping = [[NSDictionary alloc] 
                          initWithObjectsAndKeys:@"apple.png", @"Apple",
                          @"banana.png", @"Banana",
                          @"lemon.png", @"Lemon", 
                          @"orange.png", @"Orange",
                          @"peach.png", @"Peach",
                          @"pear.png", @"Pear",  
                          @"pineapple.png", @"Pineapple", 
                          nil];
    
    resultLabel.text = @"Match the fruits in each row!";
}

- (void)viewDidUnload
{
    [self setFruitPicker:nil];
    [self setResultLabel:nil];
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
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0)
        return [dataForComponent1 count];
    if (component == 1)
        return [dataForComponent2 count];
    
    return [dataForComponent3 count];
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 50;
}

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    // get the fruit name
    NSString* keyString;
    if (component == 0)
        keyString = [dataForComponent1 objectAtIndex:row];
    else if (component == 1)
        keyString = [dataForComponent2 objectAtIndex:row];
    else if (component == 2)
        keyString = [dataForComponent3 objectAtIndex:row];
    
    NSString* imageFileName = [nameToImageMapping objectForKey:keyString];
    
    if(view == nil)
    {
        return [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageFileName]];
    }
    
    ((UIImageView*)view).image = [UIImage imageNamed:imageFileName];
    return view;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // get selected fruit in each component
    int selectedRowInComponent1 = [pickerView selectedRowInComponent:0];
    NSString* fruitInComponent1 = [dataForComponent1 objectAtIndex:selectedRowInComponent1];
    
    int selectedRowInComponent2 = [pickerView selectedRowInComponent:1];
    NSString* fruitInComponent2 = [dataForComponent2 objectAtIndex:selectedRowInComponent2];
    
    int selectedRowInComponent3 = [pickerView selectedRowInComponent:2];
    NSString* fruitInComponent3 = [dataForComponent3 objectAtIndex:selectedRowInComponent3];
    
    // if the same fruit is selected in
    // each row, then show a message
    if ([fruitInComponent1 isEqualToString:fruitInComponent2] &&
        [fruitInComponent2 isEqualToString:fruitInComponent3])
    {
        resultLabel.text = @"Jackpot!";
    }
    else
    {
        resultLabel.text = @"Match the fruits in each row!";
    }
}


@end
