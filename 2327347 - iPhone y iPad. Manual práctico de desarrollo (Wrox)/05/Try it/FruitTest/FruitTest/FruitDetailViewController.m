//
//  FruitDetailViewController.m
//  FruitTest
//
//  Created by Abhishek Mishra on 13/11/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import "FruitDetailViewController.h"

@implementation FruitDetailViewController
@synthesize fruitImage;
@synthesize fruitName;
@synthesize fruitFamily;
@synthesize fruitGenus;
@synthesize dataObject;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
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
    
    fruitImage.image = [UIImage imageNamed:dataObject.imageFilename];
    fruitName.text = [NSString stringWithFormat:@"Name: %@", dataObject.fruitName];
    fruitFamily.text = [NSString stringWithFormat:@"Family: %@", dataObject.family];
    fruitGenus.text = [NSString stringWithFormat:@"Genus: %@", dataObject.genus];
}

- (void)viewDidUnload
{
    [self setFruitImage:nil];
    [self setFruitName:nil];
    [self setFruitFamily:nil];
    [self setFruitGenus:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)onBackButtonPressed:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
@end
