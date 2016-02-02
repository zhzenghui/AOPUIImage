//
//  UIImagePickerController+NoAutorotate.m
//  DSACar
//
//  Created by xy on 16/2/1.
//  Copyright © 2016年 bitcar. All rights reserved.
//

#import "ImagePickerReplaceMethodsHolder.h"



// ImagePickerReplaceMethodsHolder.m
@implementation ImagePickerReplaceMethodsHolder

- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationPortrait;
}


@end
