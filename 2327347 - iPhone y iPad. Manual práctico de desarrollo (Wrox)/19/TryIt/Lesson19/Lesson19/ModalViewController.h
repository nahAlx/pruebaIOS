//
//  ModalViewController.h
//  Lesson19
//
//  Created by Gene Backlin on 10/11/11.
//  Copyright (c) 2011 MariZack Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ModalViewController : UIViewController

@property (strong, nonatomic) NSString *text;
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

- (IBAction)done:(id)sender;

@end
