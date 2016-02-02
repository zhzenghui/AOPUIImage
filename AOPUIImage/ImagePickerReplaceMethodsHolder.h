//
//  UIImagePickerController+NoAutorotate.h
//  DSACar
//
//  Created by xy on 16/2/1.
//  Copyright © 2016年 bitcar. All rights reserved.
//

#import <UIKit/UIKit.h>

// ImagePickerReplaceMethodsHolder.h
@interface ImagePickerReplaceMethodsHolder : NSObject

- (BOOL)shouldAutorotate;
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation;

@end