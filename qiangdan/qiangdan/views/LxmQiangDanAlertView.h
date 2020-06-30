//
//  LxmQiangDanAlertView.h
//  qiangdan
//
//  Created by 李晓满 on 2020/3/25.
//  Copyright © 2020 李晓满. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LxmQiangDanAlertView : UIView

- (void)show;

- (void)dismiss;

@property (nonatomic, strong) LxmQiangDanGetOrderModel *model;

@end

