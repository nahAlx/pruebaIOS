//
//  Lesson5ViewController.m
//  FruitTest
//
//  Created by Abhishek Mishra on 11/11/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import "Lesson5ViewController.h"
#import "FruitClass.h"
#import "FruitDetailViewController.h"

@implementation Lesson5ViewController

@synthesize arrayOfFruits;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    FruitClass* apple = [[FruitClass alloc] init];
    apple.fruitName = @"Apple";
    apple.imageFilename = @"apple.png";
    apple.family = @"Rosaceae";
    apple.genus = @"Malus";
    
    FruitClass* banana = [[FruitClass alloc] init];
    banana.fruitName = @"Banana";
    banana.imageFilename = @"banana.png";
    banana.family = @"Musaceae";
    banana.genus = @"Musa";
    
    FruitClass* orange = [[FruitClass alloc] init];
    orange.fruitName = @"Orange";
    orange.imageFilename = @"orange.png";
    orange.family = @"Rutaceae";
    orange.genus = @"Citrus";
    
    FruitClass* peach = [[FruitClass alloc] init];
    peach.fruitName = @"Peach";
    peach.imageFilename = @"peach.png";
    peach.family = @"Rosaceae";
    peach.genus = @"Prunus";
    
    arrayOfFruits = [[NSArray alloc] initWithObjects:apple, banana, orange, peach, nil];
}

- (void)viewDidUnload
{
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

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // apple segue
    if ([segue.identifier isEqualToString:@"appleSegue"])
    {
        FruitClass* appleData = [arrayOfFruits objectAtIndex:0];
        FruitDetailViewController* detailView = segue.destinationViewController;
        detailView.dataObject = appleData;
    }
    
    // banana segue
    if ([segue.identifier isEqualToString:@"bananaSegue"])
    {
        FruitClass* bananaData = [arrayOfFruits objectAtIndex:1];
        FruitDetailViewController* detailView = segue.destinationViewController;
        detailView.dataObject = bananaData;
    }
    
    // orange segue
    if ([segue.identifier isEqualToString:@"orangeSegue"])
    {
        FruitClass* orangeData = [arrayOfFruits objectAtIndex:2];
        FruitDetailViewController* detailView = segue.destinationViewController;
        detailView.dataObject = orangeData; 
    }
    
    // peach segue
    if ([segue.identifier isEqualToString:@"peachSegue"])
    {
        FruitClass* peachData = [arrayOfFruits objectAtIndex:3];
        FruitDetailViewController* detailView = segue.destinationViewController;
        detailView.dataObject = peachData;   
    }
    
}

@end
