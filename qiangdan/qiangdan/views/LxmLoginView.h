//
//  LxmLoginView.h
//  qiangdan
//
//  Created by 李晓满 on 2020/3/20.
//  Copyright © 2020 李晓满. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LxmLoginView : UIView

@end

@interface LxmYinYingView : UIView

@end

/// 输入view
@interface LxmPutinView : UIView

@property (nonatomic, strong) UITextField *putinTF;//输入

@property (nonatomic, strong) UIView *lineView;//线

@end


@interface LxmSelectTitleButton : UIButton

@property (nonatomic, strong) UILabel *textLabel;//文字

@property (nonatomic, strong) UIImageView *iconImgView;//图片

@end


@interface LxmSelectLeftTableCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;

@end

@interface LxmSelectRightTableCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIImageView *iconImgView;

@end


@interface LxmSelectView : UIControl

- (void)showAtView:(UIView *)view;

- (void)dismiss;

@property (nonatomic, copy) void(^dismissBlock)(NSString *firstTypeId, NSString *secondTypeId, NSString *secondName);

@property(nonatomic,strong)NSString *firstTypeId;
@property(nonatomic,strong)NSString *secondTypeId;


@end

#pragma 抢单大厅cell 部分视图

@interface LxmQingDanListLableDetailCell : UITableViewCell

@property (nonatomic, strong) UILabel *leftLabel;

@property (nonatomic, strong) UILabel *rightLabel;

@end

@interface LxmQingDanListGoodsView : UIView

@property (nonatomic, strong) LxmQiangDanModel *model;


@end

//抢单大厅cell
@interface LxmQingDanListCell : UITableViewCell

@property (nonatomic, copy) void(^qiangDanBlock)(LxmQiangDanModel *model);

@property (nonatomic, strong) LxmQiangDanModel *model;

@end


@interface LxmDaiShangMenListCell : UITableViewCell

@property (nonatomic, copy) void(^sureFinishBlock)(LxmQiangDanModel *model);

@property (nonatomic, strong) LxmQiangDanModel *model;

@end
