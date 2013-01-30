//
//  Lesson21ViewController.h
//  FileTest
//
//  Created by Abhishek Mishra on 23/11/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Lesson21ViewController : UIViewController
@property (nonatomic, strong) NSArray* arrayOfContacts;

- (IBAction)onSaveToFile:(id)sender;
@end
