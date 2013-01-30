//
//  FruitDetailViewController.h
//  FruitTest
//
//  Created by Abhishek Mishra on 13/11/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FruitClass.h"

@interface FruitDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *fruitImage;
@property (weak, nonatomic) IBOutlet UILabel *fruitName;
@property (weak, nonatomic) IBOutlet UILabel *fruitFamily;
@property (weak, nonatomic) IBOutlet UILabel *fruitGenus;
@property (strong, nonatomic) FruitClass* dataObject;
- (IBAction)onBackButtonPressed:(id)sender;
@end
