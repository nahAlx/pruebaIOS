//
//  RGBViewController.h
//  Logate
//
//  Created by Family on 11/01/13.
//  Copyright (c) 2013 com.redgreenblueapp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RGBViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usertTextField;
@property (weak, nonatomic) IBOutlet UITextField *passTextField;

- (IBAction)pushNoticeMe:(id)sender;

- (IBAction)onDismiss:(id)sender;

- (IBAction)handleBackgroundTouch:(id)sender;

@end
