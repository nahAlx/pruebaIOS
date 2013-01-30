//
//  DetailViewController.h
//  Leccion12
//
//  Created by Family on 22/01/13.
//  Copyright (c) 2013 com.redgreenblueapp. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *uiLabel;
@property (strong,nonatomic) NSString * text;
@end
