//
//  MasterViewController.m
//  Lesson13
//
//  Created by Gene Backlin on 8/8/11.
//  Copyright (c) 2011 MariZack Consulting. All rights reserved.
//

#import "MasterViewController.h"

#import "DetailViewController.h"

@implementation MasterViewController

@synthesize girlsArray;
@synthesize boysArray;
@synthesize sections;
@synthesize sectionsSorted;
@synthesize sorted;

@synthesize detailViewController = _detailViewController;

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
    }
    return self;
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
    [self setGirlsArray:[NSArray arrayWithObjects:@"Sue", @"Ann", @"Mary", @"Debra", @"Maggie", nil]];
    [self setBoysArray:[NSArray arrayWithObjects:@"Frank", @"Bill", @"Dick", @"Hank", @"Jean", nil]];
    [self setSections:[NSArray arrayWithObjects:@"Girls", @"Boys", nil]];
    [self setSectionsSorted:[[self sections] sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)]];
    [self setSorted:NO];
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

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [self titleForSection:section];
}

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    NSInteger sectionCount = 0;
    
    if([self sorted]) {
        sectionCount = [[self sectionsSorted] count];
    } else {
        sectionCount = [[self sections] count];
    }
    return sectionCount;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section { 
    return [[self arrayForSection:section] count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSInteger row = [indexPath row];
	NSInteger section = [indexPath section];
	NSString *cellText = [[self arrayForSection:section] objectAtIndex:row];
	
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
	// Configure the cell.
	[[cell textLabel] setText:cellText];
	
    return cell;
}

#pragma mark - Action methods

- (IBAction)toggleSections:(id)sender {
    NSArray *currentNames = nil;
    NSArray *newNames = nil;
    
    if([self sorted]) {
        currentNames = [self sectionsSorted];
        newNames = [self sections];
    } else {
        currentNames = [self sections];
        newNames = [self sectionsSorted];
    }
    
    [self setSorted:![self sorted]];
    
    [[self tableView] beginUpdates];
    
    NSUInteger currentIndex = 0;
    NSUInteger newIndex = 0;
    
    for(NSString *currentName in currentNames) {
        for(NSString *newName in newNames) {
            if([newName isEqualToString:currentName]) {
                [[self tableView] moveSection:currentIndex toSection:newIndex];
                newIndex = 0;
                break;
            }
            newIndex++;
        }
        currentIndex++;
    }
    
    [[self tableView] endUpdates];
}

#pragma mark - Utility methods

- (NSArray *)arrayForSection:(NSInteger)section {
    NSArray *selectedArray = nil;
    NSArray *sectionZero = nil;
    NSArray *sectionOne = nil;
    
    if([self sorted]) {
        sectionZero = [self boysArray];
        sectionOne = [self girlsArray];
    } else {
        sectionZero = [self girlsArray];
        sectionOne = [self boysArray];
    }
    
    switch (section) {
        case 0:
            selectedArray = sectionZero;
            break;
            
        case 1:
            selectedArray = sectionOne;
            break;
    }
    
    return selectedArray;
}

- (NSString *)titleForSection:(NSInteger)section {
    NSString *title = nil;
    
    if([self sorted]) {
        title = [[self sectionsSorted] objectAtIndex:section];
    } else {
        title = [[self sections] objectAtIndex:section];
    }
    
    return title;
}

#pragma mark - Segueway delegate

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSIndexPath *indexPath = [[self tableView] indexPathForSelectedRow];
    NSInteger row = [indexPath row];
    NSInteger section = [indexPath section];
    
    NSArray *names = [self arrayForSection:section];
    
    NSString *headerTitle = [self titleForSection:section];
    NSString *name = [names objectAtIndex:row];
    
    DetailViewController *detailViewController = [segue destinationViewController];
    [detailViewController setTitle:headerTitle];
    [detailViewController setDetailItem:name];
}

@end
