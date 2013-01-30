//
//  Lesson36ViewController.h
//  ImagePicker
//
//  Created by Abhishek Mishra on 03/12/2011.
//  Copyright (c) 2011 ASM Technology. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Lesson36ViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *cameraButton;

- (IBAction)onCamera:(id)sender;
- (IBAction)onPhotoLibrary:(id)sender;
@end
