//
//  Lesson32ViewController.m
//  ImageFilters
//
//  Created by Abhishek Mishra on 01/12/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import "Lesson32ViewController.h"

@implementation Lesson32ViewController
@synthesize imageView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setImageView:nil];
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

- (IBAction)onHueAdjust:(id)sender {
    // input image, converted from UIImage to CIImage
    UIImage* inputImage = [UIImage imageNamed:@"building.png"];
    CIImage* inputCIImage = [CIImage imageWithCGImage:inputImage.CGImage];
    
    // the CIFilter, created and configured
    CIFilter* hueAdjust = [CIFilter filterWithName:@"CIHueAdjust"];
    [hueAdjust setDefaults];
    [hueAdjust setValue: inputCIImage forKey: @"inputImage"];
    [hueAdjust setValue: [NSNumber numberWithFloat: 2.094] 
                 forKey: @"inputAngle"];
    
    // the result image
    CIImage* resultCIImage = [hueAdjust valueForKey: @"outputImage"];
    
    // convert CIImage to UIImage
    CIContext* context = [CIContext contextWithOptions:nil];
    CGImageRef outputImageRef = [context createCGImage:resultCIImage 
                                              fromRect:CGRectMake(0, 0, 320, 480)];
    UIImage* outputImage = [UIImage imageWithCGImage:outputImageRef];
    imageView.image = outputImage;
}

- (IBAction)onSepia:(id)sender {
    // input image, converted from UIImage to CIImage
    UIImage* inputImage = [UIImage imageNamed:@"building.png"];
    CIImage* inputCIImage = [CIImage imageWithCGImage:inputImage.CGImage];
    
    // the CIFilter, created and configured
    CIFilter* sepiaFilter = [CIFilter filterWithName:@"CISepiaTone"]; 
    [sepiaFilter setDefaults];
    [sepiaFilter setValue: inputCIImage forKey: @"inputImage"];
    [sepiaFilter setValue: [NSNumber numberWithFloat: 0.5] 
                   forKey: @"inputIntensity"];
    
    // the result image
    CIImage* resultCIImage = [sepiaFilter valueForKey: @"outputImage"];
    
    // convert CIImage to UIImage
    CIContext* context = [CIContext contextWithOptions:nil];
    CGImageRef outputImageRef = [context createCGImage:resultCIImage 
                                              fromRect:CGRectMake(0, 0, 320, 480)];
    UIImage* outputImage = [UIImage imageWithCGImage:outputImageRef];
    imageView.image = outputImage;
}
@end
