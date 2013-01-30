//
//  Lesson30ViewController.m
//  PrintTest
//
//  Created by Abhishek Mishra on 01/12/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import "Lesson30ViewController.h"

@implementation Lesson30ViewController
@synthesize printButton;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    BOOL canPrint = [UIPrintInteractionController isPrintingAvailable];
    if (canPrint == NO)
        [printButton setHidden:YES];
}

- (void)viewDidUnload
{
    [self setPrintButton:nil];
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

- (IBAction)onPrint:(id)sender {
    UIImage* birdImage = [UIImage imageNamed:@"bird.png"];
    
    UIPrintInteractionController *pic = [UIPrintInteractionController 
                                         sharedPrintController];
    
    UIPrintInfo *printInfo = [UIPrintInfo printInfo];
    printInfo.outputType = UIPrintInfoOutputPhoto;
    printInfo.orientation = UIPrintInfoOrientationPortrait;
    printInfo.jobName = @"Bird Image Print";
    
    pic.printInfo = printInfo;
    pic.showsPageRange = NO;
    pic.printingItem = birdImage;
    
    void (^completionHandler)(UIPrintInteractionController *, BOOL, NSError *) =
    ^(UIPrintInteractionController *pic, BOOL completed, NSError *error) 
    {
        if (!completed && error)
        {
            UIAlertView* errorMessage = [[UIAlertView alloc] 
                                         initWithTitle:@"Printing Error"
                                         message:nil 
                                         delegate:nil 
                                         cancelButtonTitle:@"Ok" 
                                         otherButtonTitles:nil];
            [errorMessage show];
        }
        return;
    };
    
    [pic presentAnimated:YES completionHandler:completionHandler];
}
@end
