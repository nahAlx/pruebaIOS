//
//  ContactData.h
//  CoreDataTest
//
//  Created by Abhishek Mishra on 02/12/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ContactData : NSManagedObject

@property (nonatomic, retain) NSString * customerName;
@property (nonatomic, retain) NSString * phoneNumber;
@property (nonatomic, retain) NSString * postCode;

@end
