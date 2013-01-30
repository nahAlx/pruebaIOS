//
//  DetailViewController.h
//  Lesson12
//
//  Created by Gene Backlin on 7/30/11.
//  Copyright 2011 MariZack Consulting. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController {
    UILabel *displayLabel;
}


@property (strong, nonatomic) IBOutlet UILabel *displayLabel;
@property (strong, nonatomic) NSString *detailText;

@end
