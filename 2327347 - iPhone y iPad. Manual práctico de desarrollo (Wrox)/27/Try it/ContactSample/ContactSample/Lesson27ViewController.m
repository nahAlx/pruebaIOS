//
//  Lesson27ViewController.m
//  ContactSample
//
//  Created by Abhishek Mishra on 06/12/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import "Lesson27ViewController.h"
#import "ContactDataXMLParserDelegate.h"

@implementation Lesson27ViewController

@synthesize tableOfContacts;

@synthesize listOfContacts;
@synthesize xmlParser;
@synthesize xmlData;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.listOfContacts = [[NSMutableArray alloc] initWithCapacity:10];
    
    tableOfContacts.delegate = self;
    tableOfContacts.dataSource = self;
}

- (void)viewDidUnload
{
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

- (IBAction)onLoadContacts:(id)sender 
{
    // load contacts.xml into NSData instance
    NSBundle* bundle = [NSBundle mainBundle];
    NSString* filePath = [bundle pathForResource:@"contacts" ofType:@"xml"];
    self.xmlData = [NSData dataWithContentsOfFile:filePath];
    
    // instantiate NSXMLParser
    self.xmlParser = [[NSXMLParser alloc] initWithData:xmlData];
    
    // set up parser delegate
    ContactDataXMLParserDelegate *parserDelegate = [[ContactDataXMLParserDelegate alloc] init];
    parserDelegate.viewController = self;
    [xmlParser setDelegate:parserDelegate];
    
    // parse the file.
    [xmlParser parse];
    self.xmlParser = nil;
    self.xmlData = nil;
    
    // reload table view
    [tableOfContacts reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)aTableView 
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)aTableView 
 numberOfRowsInSection:(NSInteger)section 
{
    return [listOfContacts count];
}

- (UITableViewCell *)tableView:(UITableView *)aTableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath 
{
    UITableViewCell *cell = [aTableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) 
    {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault 
                reuseIdentifier:@"Cell"];
    }
    
    ContactData* data = (ContactData*)[listOfContacts objectAtIndex:indexPath.row];
    [[cell textLabel] setText:[NSString stringWithFormat:@"%@ %@", data.firstName, data.lastName]];
    
    return  cell;
}

@end
