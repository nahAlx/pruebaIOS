//
//  ThirdViewController.m
//  Lesson15
//
//  Created by Gene Backlin on 10/13/11.
//  Copyright (c) 2011 MariZack Consulting. All rights reserved.
//

#import "ThirdViewController.h"
#import "AppDelegate.h"


@implementation ThirdViewController

@synthesize paintings = _paintings;

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
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    AppDelegate *appDelegate = 
    (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [self setPaintings:[self getPaintingsFromDictionary:[appDelegate names]]];
}

- (void)viewDidUnload
{
    [self setPaintings:nil];
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
    return [[self paintings] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *rec = [[[self paintings] 
                      sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] 
                     objectAtIndex:[indexPath row]];
    NSString *cellText = [[rec componentsSeparatedByString:@"|"] objectAtIndex:0];
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
                                      reuseIdentifier:CellIdentifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    }
    
    [[cell textLabel] setText:cellText];
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *rec = [[[self paintings] 
                      sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)] 
                     objectAtIndex:[indexPath row]];
    NSString *msg = [NSString stringWithFormat:@"%@\n%@", 
                     [[rec componentsSeparatedByString:@"|"] objectAtIndex:0], 
                     [[rec componentsSeparatedByString:@"|"] objectAtIndex:1]];
    
    [self alert:msg];
}

- (NSArray *)getPaintingsFromDictionary:(NSDictionary *)artists {
    NSMutableArray *paintingList = [NSMutableArray array];
    NSArray *keys = [artists allKeys];
    for(NSString *key in keys) {
        NSArray *list = [artists objectForKey:key];
        for(NSString *painting in list) {
            NSString *rec = [NSString stringWithFormat:@"%@|%@", painting, key];
            [paintingList addObject:rec];
        }
    }
    return paintingList;
}

#pragma mark - Alert methods

- (void)alert:(NSString *)aMessage {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Lesson 15" 
													message:aMessage
												   delegate:self 
										  cancelButtonTitle:nil 
										  otherButtonTitles:@"OK", nil];
	[alert show];
}


@end
