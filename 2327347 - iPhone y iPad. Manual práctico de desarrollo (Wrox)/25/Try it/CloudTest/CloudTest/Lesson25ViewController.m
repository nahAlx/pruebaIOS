//
//  Lesson25ViewController.m
//  CloudTest
//
//  Created by Abhishek Mishra on 25/11/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import "Lesson25ViewController.h"

@implementation Lesson25ViewController

@synthesize serviceStatus;
@synthesize documentContentView;

@synthesize cloudServicesAreAvailable;
@synthesize cloudDocument;
@synthesize searchQuery;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    documentContentView.text = @"";
    
    // register this class as an observer for the 'refreshDocumentPreview'
    // notification, this notification is sent by the document class when 
    // the contents of the document have ben updated.
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(refreshDocumentPreview:) 
                                                 name:@"refreshDocumentPreview" object:nil];
    
    // check if cloud services are available.
    NSURL* containerURL = [[NSFileManager defaultManager] URLForUbiquityContainerIdentifier:nil];
    if (containerURL != nil) 
    {
        // cloud access is available
        self.cloudServicesAreAvailable = YES;
        serviceStatus.text = @"Cloud Service Status: Available";
        
        // load existing document, or create a new document
        [self loadDocument];
    } 
    else 
    {
        // cloud access is not avaialable.
        self.cloudServicesAreAvailable = NO;
        serviceStatus.text = @"Cloud Service Status: Not Available";
        
        UIAlertView* cloudError = [[UIAlertView alloc] initWithTitle:@""
                                                             message:@"iCloud has not been setup on this device!"
                                                            delegate:nil 
                                                   cancelButtonTitle:@"Ok"
                                                   otherButtonTitles:nil];
        [cloudError show];
    }
}

- (void)viewDidUnload
{
    [self setServiceStatus:nil];
    [self setDocumentContentView:nil];
    [super viewDidUnload];

    if (self.cloudDocument != nil)
        [self.cloudDocument closeWithCompletionHandler:nil];
    self.cloudDocument = nil;
    
    self.searchQuery = nil;
    
    [[NSNotificationCenter defaultCenter] removeObserver:self 
                                                    name:@"refreshDocumentPreview"
                                                  object:nil];
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
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)loadDocument
{
    // search for iCloud document
    self.searchQuery = [[NSMetadataQuery alloc] init];
    [self.searchQuery setSearchScopes:[NSArray arrayWithObject:NSMetadataQueryUbiquitousDocumentsScope]];
    
    NSString* documentFileName = @"cloudDocument.txt";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"%K == %@", NSMetadataItemFSNameKey, documentFileName];
    [self.searchQuery setPredicate:pred];
    
    [[NSNotificationCenter defaultCenter] addObserver:self 
                                             selector:@selector(queryDidFinish:) 
                                                 name:NSMetadataQueryDidFinishGatheringNotification 
                                               object:nil];
    
    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
    [self.searchQuery startQuery];
}

- (void)queryDidFinish:(NSNotification *)notification 
{    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    // stop the query to prevent it from running constantly
    [self.searchQuery disableUpdates];
    [self.searchQuery stopQuery];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self 
                                                    name:NSMetadataQueryDidFinishGatheringNotification
                                                  object:nil];
    
    // this application expects this query to return a single
    // result. If no dcouments were found, then inform the user.
    if ([self.searchQuery resultCount] == 0)
    {
        UIAlertView* cloudMessage = [[UIAlertView alloc] initWithTitle:@""
                                                               message:@"Unable to find iCloud document, creating new document!"
                                                              delegate:nil 
                                                     cancelButtonTitle:@"Ok"
                                                     otherButtonTitles:nil];
        [cloudMessage show];
        
        self.searchQuery = nil;
        [self createDocument];
        return;
    }
    
    // process the result of the search
    if (self.cloudDocument == nil)
    {
        NSMetadataItem *item = [self.searchQuery resultAtIndex:0];
        NSURL *url = [item valueForAttribute:NSMetadataItemURLKey];
        self.cloudDocument = [[CloudTestDocument alloc] initWithFileURL:url];
    }
    
    [self.cloudDocument openWithCompletionHandler:^(BOOL success)
     {
         if (success)
         {       
             UIAlertView* cloudMessage = [[UIAlertView alloc] initWithTitle:@""
                                                                    message:@"iCloud document loaded!"
                                                                   delegate:nil 
                                                          cancelButtonTitle:@"Ok"
                                                          otherButtonTitles:nil];
             [cloudMessage show];
         } 
         else 
         {                
             UIAlertView* cloudMessage = [[UIAlertView alloc] initWithTitle:@""
                                                                    message:@"Could not load iCloud document!"
                                                                   delegate:nil 
                                                          cancelButtonTitle:@"Ok"
                                                          otherButtonTitles:nil];  
             
             [cloudMessage show];
         }
     }
     ];
    
}


- (IBAction)onSaveDocument:(id)sender 
{
    if (self.cloudDocument == nil)
        return;
    
    [documentContentView resignFirstResponder];
    self.cloudDocument.documentContent = documentContentView.text;
    
    [self.cloudDocument saveToURL:[self.cloudDocument fileURL] 
                 forSaveOperation:UIDocumentSaveForCreating 
                completionHandler:^(BOOL success) 
     {   
         if (success) 
         {
             [self.cloudDocument openWithCompletionHandler:nil];
         }
     }];
    
}

- (void) createDocument
{
    if (self.cloudDocument == nil)
    {
        NSURL *containerURL = [[NSFileManager defaultManager] URLForUbiquityContainerIdentifier:nil];
        NSURL *documentURL = [[containerURL URLByAppendingPathComponent:@"Documents"] URLByAppendingPathComponent:@"cloudDocument.txt"];
        self.cloudDocument = [[CloudTestDocument alloc] initWithFileURL:documentURL];
    }
    
    self.cloudDocument.documentContent = documentContentView.text;
    [self.cloudDocument saveToURL:[self.cloudDocument fileURL] 
                 forSaveOperation:UIDocumentSaveForCreating 
                completionHandler:^(BOOL success) 
     {   
         if (success) 
         {
             [self.cloudDocument openWithCompletionHandler:nil];
         }
     }];
}

- (void) refreshDocumentPreview:(NSNotification *)notification
{
    documentContentView.text = self.cloudDocument.documentContent;
}

@end
