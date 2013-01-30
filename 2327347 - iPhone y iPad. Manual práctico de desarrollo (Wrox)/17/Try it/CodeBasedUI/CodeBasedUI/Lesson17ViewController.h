//
//  Lesson17ViewController.h
//  CodeBasedUI
//
//  Created by Abhishek Mishra on 18/11/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Lesson17ViewController : UIViewController
@property (nonatomic, strong) UIButton* infoButton;
@property (nonatomic, strong) UILabel* countryName;
@property (nonatomic, strong) UIImageView* flagView;

- (void) onShowInfo:(id)sender;
@end
