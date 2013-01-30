//
//  SecondViewController.m
//  Lesson15
//
//  Created by Gene Backlin on 10/12/11.
//  Copyright (c) 2011 MariZack Consulting. All rights reserved.
//

#import "SecondViewController.h"
#import "AppDelegate.h"

@implementation SecondViewController

@synthesize artistTableView;
@synthesize artists = _artists;

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
    AppDelegate *appDelegate = 
         (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [self setArtists:[appDelegate names]];
}

- (void)viewDidUnload
{
    [self setArtistTableView:nil];
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
    return [[[self artists] allKeys] count];
}

- (NSInteger)tableView:(UITableView *)tableView 
      numberOfRowsInSection:(NSInteger)section
{
    NSArray *keys = [[[self artists] allKeys] 
        sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    NSString *key = [keys objectAtIndex:section];

    return [[[self artists] objectForKey:key] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *keys = [[[self artists] allKeys] 
        sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    NSString *key = [keys objectAtIndex:[indexPath section]];
    NSArray *paintings = [[self artists] objectForKey:key];
    NSString *cellText = [paintings objectAtIndex:[indexPath row]];
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] 
                initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    [[cell textLabel] setText:cellText];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView 
               titleForHeaderInSection:(NSInteger)section {
    NSArray *keys = [[[self artists] allKeys] 
        sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    return [keys objectAtIndex:section];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView 
            didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
