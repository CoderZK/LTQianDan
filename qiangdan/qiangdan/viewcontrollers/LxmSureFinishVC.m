//
//  LxmSureFinishVC.m
//  qiangdan
//
//  Created by 李晓满 on 2020/3/25.
//  Copyright © 2020 李晓满. All rights reserved.
//

#import "LxmSureFinishVC.h"
#import <AssetsLibrary/ALAssetsLibrary.h>
#import "MXPhotoPickerController.h"
#import "UIViewController+MXPhotoPicker.h"

@interface LxmSureFinishVC ()

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UIView *headerView;

@property (nonatomic, strong) LxmPutinView *moneyView;//金额

@property (nonatomic, strong) UILabel *textLabel;//上传支付凭证

@property (nonatomic, strong) UIImageView *imgView;//上传凭证

@property (nonatomic, strong) UIButton *submitButton;//提交

@property (nonatomic, strong) NSString *pic;

@end

@implementation LxmSureFinishVC

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    }
    return _lineView;
}

- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 1, ScreenW, self.view.bounds.size.height - 1)];
        _headerView.backgroundColor = [UIColor whiteColor];
    }
    return _headerView;
}

- (LxmPutinView *)moneyView {
    if (!_moneyView) {
        _moneyView = [LxmPutinView new];
        _moneyView.putinTF.placeholder = @"请输入金额";
        _moneyView.putinTF.keyboardType = UIKeyboardTypeDecimalPad;
        [_moneyView.lineView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_moneyView).offset(15);
        }];
        [_moneyView layoutIfNeeded];
    }
    return _moneyView;
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [UILabel new];
        _textLabel.textColor = [UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1.0];
        _textLabel.font = [UIFont systemFontOfSize:13];
        _textLabel.text = @"上传支付凭证";
        _textLabel.numberOfLines = 0;
    }
    return _textLabel;
}

- (UIButton *)submitButton {
    if (!_submitButton) {
        _submitButton = [UIButton new];
        [_submitButton setBackgroundImage:[UIImage imageNamed:@"red"] forState:UIControlStateNormal];
        _submitButton.layer.cornerRadius = 20;
        _submitButton.layer.masksToBounds = YES;
        [_submitButton setTitle:@"确认完成" forState:UIControlStateNormal];
        [_submitButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        _submitButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [_submitButton addTarget:self action:@selector(submitClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _submitButton;
}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView new];
        _imgView.image = [UIImage imageNamed:@"pingzheng_bg"];
        _imgView.contentMode = UIViewContentModeScaleAspectFill;
        _imgView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(uploadCardClick)];
        [_imgView addGestureRecognizer:tap];
        _imgView.tag = 123;
        _imgView.clipsToBounds = YES;
    }
    return _imgView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"确认完成";
    self.tableView.backgroundColor = UIColor.whiteColor;
    self.tableView.tableHeaderView = self.headerView;
    [self initView];
}

- (void)initView {
    [self.view addSubview:self.lineView];
    [self.headerView addSubview:self.moneyView];
    [self.headerView addSubview:self.textLabel];
    [self.headerView addSubview:self.imgView];
    [self.headerView addSubview:self.submitButton];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self.view);
        make.height.equalTo(@0.5);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView.mas_bottom);
        make.leading.bottom.trailing.equalTo(self.view);
    }];
    [self.moneyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView);
        make.leading.equalTo(self.headerView).offset(15);
        make.trailing.equalTo(self.headerView).offset(-15);
        make.height.equalTo(@60);
    }];
    [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.moneyView.mas_bottom).offset(20);
        make.leading.equalTo(self.headerView).offset(15);
        make.trailing.equalTo(self.headerView).offset(-15);
    }];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.textLabel.mas_bottom).offset(20);
        make.leading.equalTo(self.headerView).offset(15);
        make.width.height.equalTo(@85);
    }];
    [self.submitButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imgView.mas_bottom).offset(40);
        make.leading.equalTo(self.headerView).offset(15);
        make.trailing.equalTo(self.headerView).offset(-15);
        make.height.equalTo(@40);
    }];
}

/// 上传身份证
- (void)uploadCardClick {
    UIAlertController * actionController = [UIAlertController alertControllerWithTitle:nil message:@"选择图片上传方式" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction * a1 = [UIAlertAction actionWithTitle:@"打开相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self showMXPhotoCameraAndNeedToEdit:YES completion:^(UIImage *image, UIImage *originImage, CGRect cutRect) {
            if (image) {
                self.imgView.image = image;
                self.imgView.tag = 321;
            }else {
                [SVProgressHUD showErrorWithStatus:@"相片获取失败"];
            }
        }];
    }];
    
    UIAlertAction * a2 = [UIAlertAction actionWithTitle:@"从相册选取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self showMXPhotoPickerControllerAndNeedToEdit:YES completion:^(UIImage *image, UIImage *originImage, CGRect cutRect) {
            if (image) {
                self.imgView.image = image;
                self.imgView.tag = 321;
            }else {
                [SVProgressHUD showErrorWithStatus:@"相片获取失败"];
            }
        }];
    }];
    UIAlertAction * a3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [actionController addAction:a1];
    [actionController addAction:a2];
    [actionController addAction:a3];
    [self presentViewController:actionController animated:YES completion:nil];
}

/**
 上传图片
 */
- (void)upLoadFile:(UIImage *)image {
    [SVProgressHUD show];
    WeakObj(self);
    self.imgView.userInteractionEnabled = NO;
    [LxmNetworking NetWorkingUpLoad:fileUpload image:image parameters:@{@"token" : SESSION_TOKEN} name:@"file" success:^(NSURLSessionDataTask *task, id responseObject) {
        [SVProgressHUD dismiss];
        if ([responseObject[@"key"] integerValue] == 1000) {
            selfWeak.imgView.userInteractionEnabled = YES;
            [SVProgressHUD showSuccessWithStatus:@"支付凭证已上传!"];
            selfWeak.pic = [NSString stringWithFormat:@"%@", responseObject[@"result"][@"data"]];
            [selfWeak sureFinish];
        } else {
            [UIAlertController showAlertWithmessage:responseObject[@"message"]];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        selfWeak.imgView.userInteractionEnabled = YES;
        [SVProgressHUD dismiss];
    }];
}


/// 确认完成
- (void)submitClick: (UIButton *)btn {
    if (self.moneyView.putinTF.text.floatValue <= 0) {
        [SVProgressHUD showErrorWithStatus:@"请输入金额!"];
        return;
    }
    if (self.imgView.tag == 123) {
        [SVProgressHUD showErrorWithStatus:@"请上传支付凭证!"];
        return;
    }
    [self upLoadFile:self.imgView.image];
}

- (void)sureFinish {
    NSDictionary *dict = @{
        @"token" : SESSION_TOKEN,
        @"orderId" : self.orderId,
        @"money" : self.moneyView.putinTF.text,
        @"payPic" : self.pic
    };
    [SVProgressHUD show];
    WeakObj(self);
    [LxmNetworking networkingPOST:finish_order parameters:dict returnClass:LxmBaseModel.class success:^(NSURLSessionDataTask *task, LxmBaseModel *responseObject) {
        [SVProgressHUD dismiss];
        if (responseObject.key.intValue == 1000) {
            [SVProgressHUD showSuccessWithStatus:@"已确认完成!"];
            [selfWeak.navigationController popViewControllerAnimated:YES];
        } else {
            [UIAlertController showAlertWithmessage:responseObject.message];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [SVProgressHUD dismiss];
    }];
}


@end
