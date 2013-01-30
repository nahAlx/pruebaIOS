//
//  Lesson20ViewController.m
//  TwitterTest
//
//  Created by Abhishek Mishra on 23/11/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import "Lesson20ViewController.h"
#import "Twitter/Twitter.h"

@implementation Lesson20ViewController
@synthesize statusLabel;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([TWTweetComposeViewController canSendTweet])
        statusLabel.text = @"Service Status: Can send tweets!";
    else
        statusLabel.text = @"Service Status: Unavaialble!";
}

- (void)viewDidUnload
{
    [self setStatusLabel:nil];
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

- (IBAction)onSendTweet:(id)sender 
{
    // display a alert if the service is not available.
    if ([TWTweetComposeViewController canSendTweet] == NO)
    {
        UIAlertView* serviceAlert = [[UIAlertView alloc]
                                     initWithTitle:@""
                                     message:@"Can't send tweets" 
                                     delegate:nil 
                                     cancelButtonTitle:@"Ok" 
                                     otherButtonTitles:nil];
        [serviceAlert show];
        return;
    }
    
    // create the tweet sheet
    TWTweetComposeViewController* tweetSheet = [[TWTweetComposeViewController alloc] init];
    
    // setup attachment
    UIImage* attachment = [UIImage imageNamed:@"beads.png"];
    [tweetSheet addImage:attachment];
    
    // show tweet sheet
    [self presentModalViewController:tweetSheet animated:YES];
    
}
@end
