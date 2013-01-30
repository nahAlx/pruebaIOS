//
//  Lesson6ViewController.h
//  LoginSample
//
//  Created by Abhishek Mishra on 14/11/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Lesson6ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
- (IBAction)onDismissKeyboard:(id)sender;
- (IBAction)onLogin:(id)sender;
- (void) handleBackgroundTap:(UITapGestureRecognizer*)sender;
@end
