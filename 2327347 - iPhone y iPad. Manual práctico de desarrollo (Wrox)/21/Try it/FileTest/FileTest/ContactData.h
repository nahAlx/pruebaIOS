//
//  ContactData.h
//  FileTest
//
//  Created by Abhishek Mishra on 23/11/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ContactData : NSObject <NSCoding>
@property (strong, nonatomic) NSString* contactName;
@property (strong, nonatomic) NSString* phoneNumber;
@end
