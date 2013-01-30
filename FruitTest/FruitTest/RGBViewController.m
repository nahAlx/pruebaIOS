//
//  RGBViewController.m
//  FruitTest
//
//  Created by Family on 10/01/13.
//  Copyright (c) 2013 com.redgreenblueapp. All rights reserved.
//

#import "RGBViewController.h"
#import "RGBFruitObject.h"

@interface RGBViewController ()

@end

@implementation RGBViewController
@synthesize fruits;


- (void)viewDidLoad
{
    [super viewDidLoad];
    RGBFruitObject *apple = [[RGBFruitObject alloc] init];
    apple.fruitName=@"manzana";
    apple.urlImage=@"apple.bng";
    apple.genus=@"chustas";
    apple.family=@"caca";
    RGBFruitObject *banana = [[RGBFruitObject alloc] init];
    apple.fruitName=@"banana";
    apple.urlImage=@"banana.png";
    apple.genus=@"chustas";
    apple.family=@"caca";
    RGBFruitObject *orange = [[RGBFruitObject alloc] init];
    apple.fruitName=@"orange";
    apple.urlImage=@"orange.png";
    apple.genus=@"chustas";
    apple.family=@"caca";
    RGBFruitObject *peach = [[RGBFruitObject alloc] init];
    apple.fruitName=@"peach";
    apple.urlImage=@"peach.png";
    apple.genus=@"chustas";
    apple.family=@"caca";
    
    fruits = [[NSArray alloc] initWithObjects:apple,banana,orange,peach, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
