//
//  Lesson25ViewController.h
//  CloudTest
//
//  Created by Abhishek Mishra on 25/11/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CloudTestDocument.h"

@interface Lesson25ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *serviceStatus;
@property (weak, nonatomic) IBOutlet UITextView *documentContentView;

@property BOOL cloudServicesAreAvailable;
@property (strong) CloudTestDocument* cloudDocument;
@property (strong) NSMetadataQuery *searchQuery;

- (IBAction)onSaveDocument:(id)sender;

- (void) createDocument;
- (void) loadDocument;
- (void) queryDidFinish:(NSNotification *)notification;
- (void) refreshDocumentPreview:(NSNotification *)notification;

@end
