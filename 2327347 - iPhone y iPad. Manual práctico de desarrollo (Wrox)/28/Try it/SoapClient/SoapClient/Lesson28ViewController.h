//
//  Lesson28ViewController.h
//  SoapClient
//
//  Created by Abhishek Mishra on 25/11/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Lesson28ViewController : UIViewController <NSURLConnectionDataDelegate, UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *radiusField;
@property (weak, nonatomic) IBOutlet UITextView *resultView;

@property (nonatomic, strong) NSURLConnection* connection;
@property (nonatomic, strong) NSMutableData* receivedData;

- (IBAction)onButtonPressed:(id)sender;

@end
