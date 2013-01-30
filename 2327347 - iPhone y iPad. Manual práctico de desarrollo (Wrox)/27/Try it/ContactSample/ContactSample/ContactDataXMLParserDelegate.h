//
//  ContactDataXMLParserDelegate.h
//  ContactSample
//
//  Created by Abhishek Mishra on 06/12/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Lesson27ViewController.h"
#import "ContactData.h"

@interface ContactDataXMLParserDelegate : NSObject <NSXMLParserDelegate>

@property (nonatomic, weak) Lesson27ViewController* viewController;
@property (nonatomic, strong) ContactData* tmpContactInfo;
@property (nonatomic, strong) NSMutableString* currentElementValue;

@end
