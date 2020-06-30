//
//  LxmFirstFindPasswordVC.m
//  huishou
//
//  Created by 李晓满 on 2020/3/17.
//  Copyright © 2020 李晓满. All rights reserved.
//

#import "LxmFirstFindPasswordVC.h"
#import "LxmLoginView.h"
#import "LxmSecondFindPasswordVC.h"
#import "LxmLoginVC.h"

@interface LxmFirstFindPasswordVC ()<UITextFieldDelegate>

@property (nonatomic, strong) UIView *headerView;

@property (nonatomic, strong) LxmPutinView *phoneView;//手机号

@property (nonatomic, strong) LxmPutinView *codeView;//验证码

@property (nonatomic, strong) UIView *lineView;//线

@property (nonatomic, strong) UIView *topLineView;//线

@property (nonatomic, strong) UIButton *sendCodeButton;//发送验证码

@property (nonatomic, strong) UIButton *nextButton;//下一步

@property (nonatomic, strong) NSTimer *timer;//倒计时

@property (nonatomic, assign) int time;//倒计时时间

@property (nonatomic, assign) BOOL isClickSendCode;//是否点击了发送验证码

@end

@implementation LxmFirstFindPasswordVC

- (UIView *)topLineView {
    if (!_topLineView) {
        _topLineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW, 1)];
        _topLineView.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1.0];
    }
    return _topLineView;
}

- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 1, ScreenW, self.view.bounds.size.height - 1)];
        _headerView.backgroundColor = [UIColor whiteColor];
    }
    return _headerView;
}

- (LxmPutinView *)phoneView {
    if (!_phoneView) {
        _phoneView = [LxmPutinView new];
        _phoneView.putinTF.placeholder = @"请输入手机号";
        _phoneView.putinTF.keyboardType = UIKeyboardTypeNumberPad;
        _phoneView.putinTF.delegate = self;
        if (self.phone.isValid) {
            _phoneView.putinTF.text = self.phone;
            _phoneView.userInteractionEnabled = NO;
        } else {
            _phoneView.userInteractionEnabled = YES;
        }
    }
    return _phoneView;
}

- (LxmPutinView *)codeView {
    if (!_codeView) {
        _codeView = [LxmPutinView new];
        _codeView.putinTF.placeholder = @"请输入验证码";
        _codeView.lineView.hidden = YES;
        _codeView.putinTF.delegate = self;
    }
    return _codeView;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1.0];
    }
    return _lineView;
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    if (textField == self.phoneView.putinTF) {
        NSString * str = [textField.text stringByReplacingCharactersInRange:range withString:string];
        if (str.length == 0 ||  self.codeView.putinTF.text.length < 6) {
               [self.nextButton setBackgroundImage:[UIImage imageNamed:@"gray"] forState:UIControlStateNormal];
            
           }else {
              [self.nextButton setBackgroundImage:[UIImage imageNamed:@"red"] forState:UIControlStateNormal];
           }
    }else {
        NSString * str = [textField.text stringByReplacingCharactersInRange:range withString:string];
        if (str.length < 6 ||  self.phoneView.putinTF.text.length == 0) {
               [self.nextButton setBackgroundImage:[UIImage imageNamed:@"gray"] forState:UIControlStateNormal];
            
           }else {
              [self.nextButton setBackgroundImage:[UIImage imageNamed:@"red"] forState:UIControlStateNormal];
           }
    }
    
    
       
    
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self.headerView endEditing:YES];
    NSString *phone = self.phoneView.putinTF.text;
    NSString *code = self.codeView.putinTF.text;
    if (![phone isValid] || ![code isValid] || code.length < 6) {
        [self.nextButton setBackgroundImage:[UIImage imageNamed:@"gray"] forState:UIControlStateNormal];
        return;
    }
    [self.nextButton setBackgroundImage:[UIImage imageNamed:@"red"] forState:UIControlStateNormal];
}

- (UIButton *)sendCodeButton {
    if (!_sendCodeButton) {
        _sendCodeButton = [UIButton new];
        [_sendCodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
        [_sendCodeButton setTitleColor:[UIColor colorWithRed:252/255.0 green:87/255.0 blue:91/255.0 alpha:1.0] forState:UIControlStateNormal];
        _sendCodeButton.titleLabel.font = [UIFont systemFontOfSize:13];
        _sendCodeButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [_sendCodeButton addTarget:self action:@selector(sendCodeClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendCodeButton;
}

- (UIButton *)nextButton {
    if (!_nextButton) {
        _nextButton = [UIButton new];
        [_nextButton setBackgroundImage:[UIImage imageNamed:@"gray"] forState:UIControlStateNormal];
        [_nextButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [_nextButton setTitle:@"下一步" forState:UIControlStateNormal];
        _nextButton.layer.cornerRadius = 22;
        [_nextButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        _nextButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _nextButton.clipsToBounds = YES;
        [_nextButton addTarget:self action:@selector(nextClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextButton;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"找回密码";
    self.tableView.tableHeaderView = self.headerView;
    [self initSubviews];
    [self setConstrains];
}

- (void)initSubviews {
    [self.view addSubview:self.topLineView];
    [self.headerView addSubview:self.phoneView];
    [self.headerView addSubview:self.codeView];
    [self.headerView addSubview:self.sendCodeButton];
    [self.headerView addSubview:self.lineView];
    [self.headerView addSubview:self.nextButton];
}

- (void)setConstrains {
    [self.topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self.view);
        make.height.equalTo(@1);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.topLineView.mas_bottom);
        make.leading.bottom.trailing.equalTo(self.view);
    }];
    [self.phoneView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView);
        make.leading.equalTo(self.headerView).offset(15);
        make.trailing.equalTo(self.headerView).offset(-15);
        make.height.equalTo(@60);
    }];
    [self.codeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneView.mas_bottom);
        make.leading.equalTo(self.headerView).offset(15);
        make.trailing.equalTo(self.headerView).offset(-110);
        make.height.equalTo(@60);
    }];
    [self.sendCodeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.phoneView.mas_bottom);
        make.trailing.equalTo(self.headerView).offset(-15);
        make.width.equalTo(@80);
        make.height.equalTo(@60);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.codeView);
        make.leading.equalTo(self.headerView).offset(15);
        make.trailing.equalTo(self.headerView).offset(-15);
        make.height.equalTo(@1);
    }];
    [self.nextButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView.mas_bottom).offset(25);
        make.leading.equalTo(self.headerView).offset(15);
        make.trailing.equalTo(self.headerView).offset(-15);
        make.height.equalTo(@44);
    }];
}

- (void)sendCodeClick:(UIButton *)sendCodeBtn {
    //type 10-注册, 20-修改密码，30-更换手机号
    NSString *phone  = self.phoneView.putinTF.text;
    if (![phone isValid]) {
        [SVProgressHUD showErrorWithStatus:@"手机号不能为空!"];
        return;
    }
    if (phone.length != 11) {
        [SVProgressHUD showErrorWithStatus:@"请输入11位的手机号!"];
        return;
    }
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"type"] = @"20";
    dict[@"telephone"] = phone;
    [SVProgressHUD show];
    self.isClickSendCode = YES;
    sendCodeBtn.userInteractionEnabled = NO;
    [LxmNetworking networkingPOST:sendCode parameters:dict returnClass:LxmBaseModel.class success:^(NSURLSessionDataTask *task, LxmBaseModel *responseObject) {
        sendCodeBtn.userInteractionEnabled = YES;
        [SVProgressHUD dismiss];
        if (responseObject.key.intValue == 1000) {
            [self.timer invalidate];
            self.timer = nil;
            self.time = 60;
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:[YYWeakProxy proxyWithTarget:self] selector:@selector(onTimer) userInfo:nil repeats:YES];

        } else {
            [UIAlertController showAlertWithmessage:responseObject.message];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [SVProgressHUD dismiss];
    }];
}


/**
 定时器 验证码
 */
- (void)onTimer {
    self.sendCodeButton.enabled = NO;
    [self.sendCodeButton setTitle:[NSString stringWithFormat:@"%ds",self.time--] forState:UIControlStateNormal];
    if (self.time < 0) {
        [self.timer invalidate];
        self.timer = nil;
        self.sendCodeButton.enabled = YES;
        [self.sendCodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    }
}

/// 下一步
- (void)nextClick:(UIButton *)btn {
    

    
//    LxmSecondFindPasswordVC *vc = [LxmSecondFindPasswordVC new];
//    [self.navigationController pushViewController:vc animated:YES];
    
    
    [self.headerView endEditing:YES];
    if (!self.isClickSendCode) {
        [SVProgressHUD showErrorWithStatus:@"请点击发送验证码!"];
        return;
    }
    NSString *phone  = self.phoneView.putinTF.text;
    NSString *code  = self.codeView.putinTF.text;
    if (![phone isValid]) {
        [SVProgressHUD showErrorWithStatus:@"手机号不能为空!"];
        return;
    }
    if (phone.length != 11) {
        [SVProgressHUD showErrorWithStatus:@"请输入11位的手机号!"];
        return;
    }
    if (![code isValid]) {
        [SVProgressHUD showErrorWithStatus:@"请输入验证码!"];
        return;
    }
    if (code.length != 6) {
        [SVProgressHUD showErrorWithStatus:@"请输6位验证码!"];
        return;
    }
    if ([code isContrainsKong]) {
        [SVProgressHUD showErrorWithStatus:@"不能输入带有空格的验证码!"];
        return;
    }
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"code"] = code;
    dict[@"telephone"] = phone;
    [SVProgressHUD show];
    WeakObj(self);
    btn.userInteractionEnabled = NO;
    [LxmNetworking networkingPOST:app_forgetPassword1 parameters:dict returnClass:LxmBaseModel.class success:^(NSURLSessionDataTask *task, LxmBaseModel *responseObject) {
        [SVProgressHUD dismiss];
        if (responseObject.key.intValue == 1000) {
            LxmSecondFindPasswordVC *vc = [LxmSecondFindPasswordVC new];
            vc.phone = phone;
            btn.userInteractionEnabled = YES;
            [selfWeak.navigationController pushViewController:vc animated:YES];
        } else {
            btn.userInteractionEnabled = YES;
            [UIAlertController showAlertWithmessage:responseObject.message];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        btn.userInteractionEnabled = YES;
        [SVProgressHUD dismiss];
    }];
}

@end
