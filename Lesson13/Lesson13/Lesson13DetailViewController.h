//
//  Lesson13DetailViewController.h
//  Lesson13
//
//  Created by Family on 28/01/13.
//  Copyright (c) 2013 com.redgreenblueapp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Lesson13DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
