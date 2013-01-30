//
//  Lesson27ViewController.h
//  ContactSample
//
//  Created by Abhishek Mishra on 06/12/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Lesson27ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray* listOfContacts;
@property (strong, nonatomic) NSXMLParser* xmlParser;
@property (strong, nonatomic) NSData* xmlData;

@property (weak, nonatomic) IBOutlet UITableView *tableOfContacts;

- (IBAction)onLoadContacts:(id)sender;

@end
