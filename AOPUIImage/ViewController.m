//
//  ViewController.m
//  AOPUIImage
//
//  Created by xy on 16/2/2.
//  Copyright © 2016年 zenghui. All rights reserved.
//

#import "ViewController.h"
#import "ImagePickerReplaceMethodsHolder.h"
#import <objc/runtime.h>


#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

@interface ViewController ()

@end

@implementation ViewController


+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self hackForImagePicker];
    });
}

+ (void)hackForImagePicker {
    // fix bug of image picker under iOS 6.0
    // http://stackoverflow.com/questions/12522491/crash-on-presenting-uiimagepickercontroller-under-ios-6-0
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"6.0")
        && SYSTEM_VERSION_LESS_THAN(@"6.1")) {
        Method oldMethod1 = class_getInstanceMethod([UIImagePickerController class], @selector(shouldAutorotate));
        Method newMethod1 = class_getInstanceMethod([ImagePickerReplaceMethodsHolder class], @selector(shouldAutorotate));
        method_setImplementation(oldMethod1, method_getImplementation(newMethod1));
        
        Method oldMethod2 = class_getInstanceMethod([UIImagePickerController class], @selector(preferredInterfaceOrientationForPresentation));
        Method newMethod2 = class_getInstanceMethod([ImagePickerReplaceMethodsHolder class], @selector(preferredInterfaceOrientationForPresentation));
        method_setImplementation(oldMethod2, method_getImplementation(newMethod2));
    }
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
