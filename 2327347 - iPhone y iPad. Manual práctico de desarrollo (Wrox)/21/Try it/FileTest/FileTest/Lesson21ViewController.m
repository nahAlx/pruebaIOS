//
//  Lesson21ViewController.m
//  FileTest
//
//  Created by Abhishek Mishra on 23/11/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import "Lesson21ViewController.h"
#import "ContactData.h"

@implementation Lesson21ViewController

@synthesize arrayOfContacts;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // target file in Documents directory
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory 
                                                         , NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    NSString* filePath = [documentsDir 
                          stringByAppendingPathComponent:@"ContactData.dat"];
    
    // if file does not exist, show error message.
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath] == NO)
    {
        UIAlertView* errorMessage = [[UIAlertView alloc] 
                                     initWithTitle:@"ContactData.dat not found!" 
                                     message:@"Creating objects..." 
                                     delegate:nil 
                                     cancelButtonTitle:@"Ok" 
                                     otherButtonTitles:nil];
        [errorMessage show];
        
        ContactData* c1 = [[ContactData alloc] init];
        c1.contactName = @"Peter Kramer";
        c1.phoneNumber = @"44 79830 11460";
        
        ContactData* c2 = [[ContactData alloc] init];
        c2.contactName = @"Mark Andrews";
        c2.phoneNumber = @"44 79110 07491";
        
        arrayOfContacts = [NSArray arrayWithObjects:c1, c2, nil];
    }
    
    // if file exists, then show how many objects were loaded.
    else
    {
        arrayOfContacts = [NSKeyedUnarchiver unarchiveObjectWithFile:filePath];
        
        NSString* messageText = [NSString stringWithFormat:@"Loaded %d objects", [arrayOfContacts count]];
                                 UIAlertView* message = [[UIAlertView alloc] 
                                                         initWithTitle:@"ContactData.dat found!" 
                                                         message:messageText
                                                         delegate:nil 
                                                         cancelButtonTitle:@"Ok" 
                                                         otherButtonTitles:nil];
                                 [message show];
    }
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

- (IBAction)onSaveToFile:(id)sender 
{
    // target file in Documents directory
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 
                                                         NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    NSString* filePath = [documentsDir 
                          stringByAppendingPathComponent:@"ContactData.dat"];
    
    // save to file
    BOOL result = [NSKeyedArchiver archiveRootObject:arrayOfContacts 
                                              toFile:filePath];
    
    if (result == YES)
    {
        UIAlertView* message = [[UIAlertView alloc] 
                                initWithTitle:@"File has been saved!" 
                                message:@""
                                delegate:nil 
                                cancelButtonTitle:@"Ok" 
                                otherButtonTitles:nil];
        [message show];
    }
    else
    {
        UIAlertView* message = [[UIAlertView alloc] 
                                initWithTitle:@"Error saving to file!" 
                                message:@""
                                delegate:nil 
                                cancelButtonTitle:@"Ok" 
                                otherButtonTitles:nil];
        [message show]; 
    }
}

@end
