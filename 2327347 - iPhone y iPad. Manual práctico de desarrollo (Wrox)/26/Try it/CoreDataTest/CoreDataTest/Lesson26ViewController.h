//
//  Lesson26ViewController.h
//  CoreDataTest
//
//  Created by Abhishek Mishra on 02/12/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface Lesson26ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (weak, nonatomic) IBOutlet UITextField *phoneField;
@property (weak, nonatomic) IBOutlet UITextField *postcodeField;

@property (weak, nonatomic) IBOutlet UITableView *tableOfContacts;

@property (nonatomic, strong) NSManagedObjectModel* objectModel;
@property (nonatomic, strong) NSPersistentStoreCoordinator* coordinator;
@property (nonatomic, strong) NSManagedObjectContext* objectContext;

@property (strong, nonatomic) NSArray* existingContacts;

- (IBAction)onAdd:(id)sender;
- (void) fetchExistingContactData;
- (void) handleBackgroundTap:(UITapGestureRecognizer*)sender;

@end
