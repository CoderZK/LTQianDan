//
//  LxmLoginVC.m
//  qiangdan
//
//  Created by 李晓满 on 2020/3/20.
//  Copyright © 2020 李晓满. All rights reserved.
//

#import "LxmLoginVC.h"
#import "LxmQiangDanListVC.h"
#import "LxmFirstFindPasswordVC.h"

@interface LxmLoginVC ()<UITextFieldDelegate>

@property (nonatomic, strong) UILabel *titleLabel;//登录

@property (nonatomic, strong) UIImageView *bgImgView;

@property (nonatomic, strong) LxmYinYingView *topView;

@property (nonatomic, strong) LxmPutinView *phoneView;//手机号

@property (nonatomic, strong) LxmPutinView *passwordView;//密码

@property (nonatomic, strong) UIButton *forgetPasswordButton;//忘记密码

@property (nonatomic, strong) UIButton *loginButton;//登录

@end

@implementation LxmLoginVC

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont boldSystemFontOfSize:25];
        _titleLabel.textColor = UIColor.whiteColor;
        _titleLabel.text = @"登录";
    }
    return _titleLabel;
}

- (UIImageView *)bgImgView {
    if (!_bgImgView) {
        _bgImgView = [UIImageView new];
        _bgImgView.image = [UIImage imageNamed:@"login_bg"];
    }
    return _bgImgView;
}

- (LxmYinYingView *)topView {
    if (!_topView) {
        _topView = [LxmYinYingView new];
    }
    return _topView;
}

- (LxmPutinView *)phoneView {
    if (!_phoneView) {
        _phoneView = [LxmPutinView new];
        _phoneView.putinTF.placeholder = @"请输入手机号";
        _phoneView.putinTF.keyboardType = UIKeyboardTypeNumberPad;
        _phoneView.putinTF.delegate = self;
    }
    return _phoneView;
}

- (LxmPutinView *)passwordView {
    if (!_passwordView) {
        _passwordView = [LxmPutinView new];
        _passwordView.putinTF.placeholder = @"请输入密码";
        _passwordView.putinTF.secureTextEntry = YES;
        _passwordView.putinTF.delegate = self;
    }
    return _passwordView;
}

- (UIButton *)forgetPasswordButton {
    if (!_forgetPasswordButton) {
        _forgetPasswordButton = [UIButton new];
        _forgetPasswordButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [_forgetPasswordButton setTitle:@"忘记密码" forState:UIControlStateNormal];
        [_forgetPasswordButton setTitleColor:[UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1.0] forState:UIControlStateNormal];
        _forgetPasswordButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [_forgetPasswordButton addTarget:self action:@selector(findPasswordClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forgetPasswordButton;
}


- (UIButton *)loginButton {
    if (!_loginButton) {
        _loginButton = [UIButton new];
        [_loginButton setBackgroundImage:[UIImage imageNamed:@"gray"] forState:UIControlStateNormal];
        [_loginButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [_loginButton setTitle:@"登录" forState:UIControlStateNormal];
        [_loginButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        _loginButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _loginButton.layer.cornerRadius = 22;
        _loginButton.clipsToBounds = YES;
        [_loginButton addTarget:self action:@selector(loginClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)dealloc {
//    [NSNotificationCenter.defaultCenter removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self initSubViews];
//    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(textFieldDidChanged) name:UITextFieldTextDidChangeNotification object:nil];
}

- (void)initSubViews {
    [self.view addSubview:self.bgImgView];
    [self.view addSubview:self.titleLabel];
    [self.view addSubview:self.topView];
    [self.topView addSubview:self.phoneView];
    [self.topView addSubview:self.passwordView];
    [self.topView addSubview:self.forgetPasswordButton];
    [self.topView addSubview:self.loginButton];
    [self.bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self.view);
        make.height.equalTo(@(ScreenW * 300/375));
    }];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.topView.mas_top).offset(-52);
        make.leading.equalTo(self.view).offset(15);
    }];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgImgView.mas_bottom).offset(-150);
        make.leading.trailing.equalTo(self.view);
        make.height.equalTo(@344);
    }];
    [self.phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topView).offset(40);
        make.leading.equalTo(self.topView).offset(30);
        make.trailing.equalTo(self.topView).offset(-30);
        make.height.equalTo(@50);
    }];
    [self.passwordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneView.mas_bottom);
        make.leading.equalTo(self.topView).offset(30);
        make.trailing.equalTo(self.topView).offset(-30);
        make.height.equalTo(@50);
    }];
    [self.forgetPasswordButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordView.mas_bottom);
        make.trailing.equalTo(self.topView).offset(-30);
        make.width.equalTo(@200);
        make.height.equalTo(@50);
    }];
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.forgetPasswordButton.mas_bottom).offset(20);
        make.leading.equalTo(self.topView).offset(30);
        make.trailing.equalTo(self.topView).offset(-30);
        make.height.equalTo(@44);
    }];
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (textField == self.phoneView.putinTF) {
        NSString * str = [textField.text stringByReplacingCharactersInRange:range withString:string];
        if (str.length == 0 ||  self.passwordView.putinTF.text.length < 6) {
               [self.loginButton setBackgroundImage:[UIImage imageNamed:@"gray"] forState:UIControlStateNormal];
            
           }else {
              [self.loginButton setBackgroundImage:[UIImage imageNamed:@"red"] forState:UIControlStateNormal];
           }
    }else {
        NSString * str = [textField.text stringByReplacingCharactersInRange:range withString:string];
        if (str.length < 6 ||  self.phoneView.putinTF.text.length == 0) {
               [self.loginButton setBackgroundImage:[UIImage imageNamed:@"gray"] forState:UIControlStateNormal];
            
           }else {
              [self.loginButton setBackgroundImage:[UIImage imageNamed:@"red"] forState:UIControlStateNormal];
           }
    }
    
    
       
    
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self.topView endEditing:YES];
    NSString *phone = self.phoneView.putinTF.text;
    NSString *password = self.passwordView.putinTF.text;
    if (![phone isValid] || ![password isValid] || password.length < 6) {
        [self.loginButton setBackgroundImage:[UIImage imageNamed:@"gray"] forState:UIControlStateNormal];
        return;
    }
    [self.loginButton setBackgroundImage:[UIImage imageNamed:@"red"] forState:UIControlStateNormal];
}

//- (void)textFieldDidChanged {
//    NSString *phone = self.phoneView.putinTF.text;
//    NSString *password = self.passwordView.putinTF.text;
//    if (![phone isValid] || ![password isValid] ) {
//        [self.loginButton setBackgroundImage:[UIImage imageNamed:@"gray"] forState:UIControlStateNormal];
//        return;
//    }
//    if (password.length >= 6) {
//        [self.loginButton setBackgroundImage:[UIImage imageNamed:@"red"] forState:UIControlStateNormal];
//    } else {
//        [self.loginButton setBackgroundImage:[UIImage imageNamed:@"gray"] forState:UIControlStateNormal];
//    }
//}


//登录
- (void)loginClick: (UIButton *)btn{
    
    
    [self.topView endEditing:YES];
    NSString *phone = self.phoneView.putinTF.text;
    NSString *password = self.passwordView.putinTF.text;
    
    if (![phone isValid]) {
        [SVProgressHUD showErrorWithStatus:@"手机号不能为空!"];
        return;
    }
    if ([phone isContrainsKong]) {
        [SVProgressHUD showErrorWithStatus:@"不能输入带有空格的手机号!"];
        return;
    }
    if (phone.length != 11) {
        [SVProgressHUD showErrorWithStatus:@"请输入11位的手机号!"];
        return;
    }
   
    if (![password isValid]) {
        [SVProgressHUD showErrorWithStatus:@"请输入密码!"];
        return;
    }
    if (password.length <6) {
           [SVProgressHUD showErrorWithStatus:@"请输6位及以上密码!"];
           return;
       }
    if ([password isContrainsKong]) {
        [SVProgressHUD showErrorWithStatus:@"不能输入带有空格的密码!"];
        return;
    }
    NSDictionary *dict = @{
                           @"telephone" : phone,
                           @"password" : password,
                           @"deviceType":@"1",
                           };
    [SVProgressHUD show];
    self.loginButton.userInteractionEnabled = NO;
    WeakObj(self);
    [LxmNetworking networkingPOST:app_login parameters:dict returnClass:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        [SVProgressHUD dismiss];
        selfWeak.loginButton.userInteractionEnabled = YES;
        if ([responseObject[@"key"] integerValue] == 1000) {
            [LxmTool ShareTool].isLogin = YES;
            [LxmTool ShareTool].session_token = responseObject[@"result"][@"token"];
            [LxmTool ShareTool].userModel = [LxmUserInfoModel mj_objectWithKeyValues:responseObject[@"result"][@"map"]];
            UIApplication.sharedApplication.delegate.window.rootViewController = [[BaseNavigationController alloc] initWithRootViewController:[LxmQiangDanListVC new]];
            [[LxmTool ShareTool] uploadDeviceToken];
        } else {
            [UIAlertController showAlertWithmessage:responseObject[@"message"]];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        selfWeak.loginButton.userInteractionEnabled = YES;
        [SVProgressHUD dismiss];
    }];
    
}

/// 找回密码
- (void)findPasswordClick {
    LxmFirstFindPasswordVC *vc = [[LxmFirstFindPasswordVC alloc] init];
    vc.phone = self.phoneView.putinTF.text;
    [self.navigationController pushViewController:vc animated:YES];
}


@end
