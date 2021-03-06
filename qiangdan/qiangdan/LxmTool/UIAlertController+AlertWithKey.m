//
//  UIAlertController+AlertWithKey.m
//  JawboneUP
//
//  Created by 李晓满 on 2017/11/7.
//  Copyright © 2017年 李晓满. All rights reserved.
//

#import "UIAlertController+AlertWithKey.h"
#import "UIViewController+TopVC.h"
@implementation UIAlertController (AlertWithKey)

+ (void)showAlertWithmessage:(NSString *)message {
    UIAlertController * alertController = [UIAlertController alertControllerWithTitle:@"温馨提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        if ([message isEqualToString:@"未登录"]) {
            [LxmTool ShareTool].session_token = nil;
            [LxmTool ShareTool].isLogin =NO;
             [UIApplication sharedApplication].keyWindow.rootViewController = [[BaseNavigationController alloc] initWithRootViewController:[LxmLoginVC new]];
            
        }
    }]];
    
    [[UIViewController topViewController] presentViewController:alertController animated:YES completion:nil];
}

@end
