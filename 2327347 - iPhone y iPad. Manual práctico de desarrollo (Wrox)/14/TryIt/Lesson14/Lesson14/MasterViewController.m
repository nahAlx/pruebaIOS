//
//  MasterViewController.m
//  Lesson14
//
//  Created by Gene Backlin on 10/2/11.
//  Copyright (c) 2011 MariZack Consulting. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "Person.h"

@implementation MasterViewController

@synthesize contacts;

- (void)awakeFromNib
{
    [super awakeFromNib];
}

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
    NSDictionary *dict = [[NSDictionary alloc] initWithObjectsAndKeys:
                          [[Person alloc] initWithLastName:@"Jones" 
                                                 firstName:@"Joe" 
                                                     phone:@"312-555-1212"], @"Jones", 
                          [[Person alloc] initWithLastName:@"Barnes" 
                                                 firstName:@"Bill" 
                                                     phone:@"443-555-1212"], @"Barnes", 
                          [[Person alloc] initWithLastName:@"Smith" 
                                                 firstName:@"Andy" 
                                                     phone:@"775-555-1212"], @"Smith", 
                          nil];
    [self setContacts:dict];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section
{
    return [[[self contacts] allKeys] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
	NSArray *keys = [[[self contacts] allKeys] 
					 sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    NSString *key = [keys objectAtIndex:[indexPath row]];
    Person *person = [[self contacts] objectForKey:key];
    NSString *cellText = [person lastName];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
                                      reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    [[cell textLabel] setText:cellText];
    
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    DetailViewController *controller = (DetailViewController *)[segue destinationViewController];
    NSIndexPath *indexPath = [[self tableView] indexPathForSelectedRow];
    
	NSArray *keys = [[[self contacts] allKeys] 
					 sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    NSString *key = [keys objectAtIndex:[indexPath row]];
    Person *person = [[self contacts] objectForKey:key];
    [controller setPerson:person];
    [controller setTitle:@"Detail"];
}

@end
