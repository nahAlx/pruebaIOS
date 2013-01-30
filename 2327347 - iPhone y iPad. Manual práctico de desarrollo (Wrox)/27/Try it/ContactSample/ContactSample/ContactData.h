//
//  ContactData.h
//  ContactSample
//
//  Created by Abhishek Mishra on 06/12/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactData : NSObject

@property int contactId;
@property (nonatomic, strong) NSMutableString* firstName;
@property (nonatomic, strong) NSMutableString* lastName;
@property (nonatomic, strong) NSMutableString* address;
@property (nonatomic, strong) NSMutableString* phone;

@end
