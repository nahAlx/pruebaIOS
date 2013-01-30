//
//  Lesson24ViewController.m
//  ImageGallery
//
//  Created by Abhishek Mishra on 23/11/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import "Lesson24ViewController.h"

@implementation Lesson24ViewController

@synthesize imageView;
@synthesize imageFileNames;
@synthesize currentImageIndex;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    imageFileNames = [[NSMutableArray alloc] initWithCapacity:10];
    currentImageIndex = 0;
    
    // full path to Documents directory
    NSArray *paths =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,    
                                                        NSUserDomainMask, YES);
    NSString *folderPath = [paths objectAtIndex:0];
    
    NSError* errVal;
    NSArray* directoryList = [[NSFileManager defaultManager] 
                              contentsOfDirectoryAtPath:folderPath error:&errVal];
    
    for (int iX = 0; iX < [directoryList count]; iX++)
    {
        // get file name
        NSString* fileName = (NSString*)[directoryList objectAtIndex:iX];
        
        // extract file extension
        NSArray* fileNameComponents = [fileName 
                                       componentsSeparatedByString:@"."];
        if ([fileNameComponents count] < 2)
            continue;
        
        NSString* fileExtension = (NSString*)[fileNameComponents 
                                              objectAtIndex:([fileNameComponents count] - 1)];
        
        if (([fileExtension isEqualToString:@"png"]) || 
            ([fileExtension isEqualToString:@"jpg"]))
        {
            [imageFileNames addObject:fileName];
        }
    }
    
    // show an alert that contains the number of readable
    // image files found in the documents directiry.
    NSString* messageText = [NSString stringWithFormat:@"Found %d usable files in the documents directory.", 
                                                       [imageFileNames count]];
    
    UIAlertView* alertMessage = [[UIAlertView alloc] initWithTitle:@"" 
                                                     message:messageText 
                                                     delegate:nil 
                                                     cancelButtonTitle:@"Ok" 
                                                     otherButtonTitles:nil];
    [alertMessage show];
    
    if ([imageFileNames count] > 0)
    {
        NSString* imageFile = [imageFileNames objectAtIndex:currentImageIndex];
        
        NSString* sourceFile = [folderPath stringByAppendingString:[NSString stringWithFormat:@"/%@", imageFile]];
        imageView.image = [[UIImage alloc] initWithContentsOfFile:sourceFile];
    }
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

- (IBAction)onPreviousImage:(id)sender 
{
    
    if ([imageFileNames count] == 0)
        return;
    
    if (currentImageIndex == 0)
        return;
    
    currentImageIndex--;
    
    // full path to Documents directory
    NSArray *paths =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                        NSUserDomainMask, YES);
    NSString *folderPath = [paths objectAtIndex:0];
    
    // path to image file in the documents directory
    NSString* imageFile = [imageFileNames objectAtIndex:currentImageIndex];
    NSString* sourceFile = [folderPath stringByAppendingString:[NSString 
                                                                stringWithFormat:@"/%@", imageFile]];
    imageView.image = [[UIImage alloc] initWithContentsOfFile:sourceFile];
    
} 

- (IBAction)onNextImage:(id)sender {
    
    if ([imageFileNames count] == 0)
        return;
    
    if (currentImageIndex == [imageFileNames count])
        return;
    
    currentImageIndex++;
    
    // full path to Documents directory
    NSArray *paths =NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                        NSUserDomainMask, YES);
    NSString *folderPath = [paths objectAtIndex:0];
    
    // path to image file in the documents directory
    NSString* imageFile = [imageFileNames objectAtIndex:currentImageIndex];
    NSString* sourceFile = [folderPath stringByAppendingString:[NSString 
                                                                stringWithFormat:@"/%@", imageFile]];
    imageView.image = [[UIImage alloc] initWithContentsOfFile:sourceFile];
} 

@end
