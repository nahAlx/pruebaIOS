//
//  ViewController.m
//  Lesson22
//
//  Created by Gene Backlin on 10/9/11.
//  Copyright (c) 2011 MariZack Consulting. All rights reserved.
//

#import "ViewController.h"


@implementation ViewController

@synthesize nameArray;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNameArray:[self readFromPropertyList:@"NameList"]];
}

- (void)viewDidUnload
{
    [self setNameArray:nil];
    
    [super viewDidUnload];
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
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self nameArray] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *names = [[self nameArray] 
					 sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];

    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [[cell textLabel] setText:[names objectAtIndex:[indexPath row]]];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSArray *names = [[self nameArray] 
                      sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    [self alert:[names objectAtIndex:[indexPath row]]];
}

#pragma mark - Alert methods

- (void)alert:(NSString *)aMessage {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Lesson 22" 
													message:aMessage
												   delegate:self 
										  cancelButtonTitle:nil 
										  otherButtonTitles:@"OK", nil];
	[alert show];
}

#pragma mark - Property List methods

- (NSArray *)readFromPropertyList:(NSString *)filename {
    NSString *errorDesc = nil; 
    NSPropertyListFormat format; 
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:filename 
                                                          ofType:@"plist"]; 
    NSData *plistXML = [[NSFileManager defaultManager] 
                        contentsAtPath:plistPath]; 
    NSDictionary *temp = (NSDictionary *)[NSPropertyListSerialization 
                                          propertyListFromData:plistXML 
                                          mutabilityOption:NSPropertyListMutableContainersAndLeaves 
                                          format:&format errorDescription:&errorDesc]; 
    if (!temp) { 
        NSLog(@"%s at line %d with message: %@", __FUNCTION__, __LINE__, errorDesc); 
    }
    
    return [temp objectForKey:@"names"];
    
}

@end
