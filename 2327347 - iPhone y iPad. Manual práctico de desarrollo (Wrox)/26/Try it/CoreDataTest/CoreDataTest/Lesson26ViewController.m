//
//  Lesson26ViewController.m
//  CoreDataTest
//
//  Created by Abhishek Mishra on 02/12/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import "Lesson26ViewController.h"
#import "ContactData.h"

@implementation Lesson26ViewController
@synthesize tableOfContacts;
@synthesize nameField;
@synthesize phoneField;
@synthesize postcodeField;

@synthesize objectModel;
@synthesize coordinator;
@synthesize objectContext;

@synthesize existingContacts;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{    
    [super viewDidLoad];

    // create managed object model
    objectModel = [NSManagedObjectModel mergedModelFromBundles:nil];
    
    // create persistent store coordinator
    coordinator = [[NSPersistentStoreCoordinator alloc] 
                   initWithManagedObjectModel:objectModel];
    
    // add persistent store
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory , NSUserDomainMask, YES);
    NSString *documentsDir = [paths objectAtIndex:0];
    NSString* filePath = [documentsDir stringByAppendingPathComponent:@"datastore.sqlite"];
    NSURL *databaseURL = [NSURL fileURLWithPath:filePath];
    
    NSError* error = nil;
    [coordinator addPersistentStoreWithType:NSSQLiteStoreType 
                                            configuration:nil 
                                                      URL:databaseURL 
                                                  options:nil 
                                                    error:&error];
    
    // create managed object context
    objectContext = [[NSManagedObjectContext alloc] init];
    [objectContext setPersistentStoreCoordinator:coordinator];
    
    // setup datasource and delegate for tableView
    tableOfContacts.dataSource = self;
    tableOfContacts.delegate = self;
    
    // get rows from database
    [self fetchExistingContactData];
    
    // add tap gesture recognizer
    UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] 
                                             initWithTarget:self 
                                             action:@selector(handleBackgroundTap:)];
    tapRecognizer.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapRecognizer];

}

- (void)viewDidUnload
{
    [self setNameField:nil];
    [self setPhoneField:nil];
    [self setPostcodeField:nil];
    [self setTableOfContacts:nil];
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

- (IBAction)onAdd:(id)sender 
{
    NSString* newName = nameField.text;
    NSString* newPhone = phoneField.text;
    NSString* newPostcode = postcodeField.text;
    
    ContactData * newContact = (ContactData*)[NSEntityDescription 
                                              insertNewObjectForEntityForName:@"ContactData"
                                              inManagedObjectContext:objectContext];
    
    newContact.customerName = newName;
    newContact.phoneNumber = newPhone;
    newContact.postCode = newPostcode;
    
    NSError* error;
    if ([objectContext save:&error])
    {
        [self fetchExistingContactData];
        [tableOfContacts reloadData];
    }
    
    // hide keyboard.
    [phoneField resignFirstResponder];
    [nameField resignFirstResponder];
    [postcodeField resignFirstResponder];
}

- (void) fetchExistingContactData
{
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription* entityDescription = [NSEntityDescription entityForName:@"ContactData"
                                                         inManagedObjectContext:objectContext];
    [fetchRequest setEntity:entityDescription];
    
    NSError* error;
    existingContacts = [objectContext executeFetchRequest:fetchRequest error:&error];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)aTableView numberOfRowsInSection:(NSInteger)section 
{
    return [existingContacts count];
}

- (UITableViewCell *)tableView:(UITableView *)aTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) 
    {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault 
                reuseIdentifier:@"Cell"];
    }
    
    ContactData* data = (ContactData*)[existingContacts 
                                       objectAtIndex:indexPath.row];
    [[cell textLabel] setText:data.customerName];
    
    return  cell;
}

- (void) handleBackgroundTap:(UITapGestureRecognizer*)sender
{
    [phoneField resignFirstResponder];
    [nameField resignFirstResponder];
    [postcodeField resignFirstResponder];
    
}

@end
