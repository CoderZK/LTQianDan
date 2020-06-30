//
//  LxmQiangDanAlertView.m
//  qiangdan
//
//  Created by 李晓满 on 2020/3/25.
//  Copyright © 2020 李晓满. All rights reserved.
//

#import "LxmQiangDanAlertView.h"

@interface LxmQiangDanAlertView ()

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) UIImageView *imgView;

@property (nonatomic, strong) UIView *contentView0;

@property (nonatomic, strong) UIButton *closeButton;

@property (nonatomic, strong) UILabel *timeLabel;//预约上门时间

@property (nonatomic, strong) UILabel *addressLabel;//预约上门地址

@property (nonatomic, strong) UILabel *nameLabel;//联系人

@property (nonatomic, strong) UIButton *connectButton;//马上联系

@end

@implementation LxmQiangDanAlertView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        UIButton * bgBtn = [[UIButton alloc] initWithFrame:self.bounds];
        [bgBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview: bgBtn];
        
        self.contentView = [[UIView alloc] initWithFrame:CGRectMake((ScreenW - 288.5)*0.5, (self.bounds.size.height - 367)*0.5, 288.5, 367)];
        [bgBtn addSubview:self.contentView];
        [self initContentSubviews];
        [self setConstrains];
    }
    return self;
}

/**
 添加视图
 */
- (void)initContentSubviews {
    [self.contentView addSubview:self.contentView0];
    [self.contentView addSubview:self.imgView];
    [self.contentView addSubview:self.closeButton];
    [self.contentView0 addSubview:self.timeLabel];
    [self.contentView0 addSubview:self.addressLabel];
    [self.contentView0 addSubview:self.nameLabel];
    [self.contentView0 addSubview:self.connectButton];
}

/**
 添加约束
 */
- (void)setConstrains {
    
    [self.contentView0 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(78.5);
        make.leading.trailing.equalTo(self.contentView);
        make.height.equalTo(@295.5);
    }];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView0).offset(-78.5);
        make.leading.trailing.equalTo(self.contentView);
        make.height.equalTo(@168.5);
    }];
    [self.closeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(80);
        make.trailing.equalTo(self.contentView);
        make.width.height.equalTo(@31);
    }];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView0).offset(120);
        make.leading.equalTo(self.contentView0).offset(22);
        make.trailing.equalTo(self.contentView0).offset(-22);
    }];
    [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeLabel.mas_bottom).offset(15);
        make.leading.equalTo(self.contentView0).offset(22);
        make.trailing.equalTo(self.contentView0).offset(-22);
    }];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.addressLabel.mas_bottom).offset(15);
        make.leading.equalTo(self.contentView0).offset(22);
        make.trailing.equalTo(self.contentView0).offset(-22);
    }];
    [self.connectButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLabel.mas_bottom).offset(25);
        make.leading.equalTo(self.contentView0).offset(44);
        make.trailing.equalTo(self.contentView0).offset(-44);
        make.height.equalTo(@33);
    }];
}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView new];
        _imgView.image = [UIImage imageNamed:@"qiangdan_bg"];
    }
    return _imgView;
}

- (UIView *)contentView0 {
    if (!_contentView0) {
        _contentView0 = [UIView new];
        _contentView0.layer.cornerRadius = 10;
        _contentView0.layer.masksToBounds = YES;
        _contentView0.backgroundColor = [UIColor whiteColor];
    }
    return _contentView0;
}

- (UIButton *)closeButton {
    if (!_closeButton) {
        _closeButton = [UIButton new];
        [_closeButton setImage:[UIImage imageNamed:@"close"] forState:UIControlStateNormal];
        _closeButton.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
        [_closeButton addTarget:self action:@selector(closeButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _closeButton;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.font = [UIFont systemFontOfSize:12];
        _timeLabel.textColor = CharacterDarkColor;
    }
    return _timeLabel;
}

- (UILabel *)addressLabel {
    if (!_addressLabel) {
        _addressLabel = [UILabel new];
        _addressLabel.font = [UIFont systemFontOfSize:12];
        _addressLabel.textColor = CharacterDarkColor;
        _addressLabel.numberOfLines = 0;
    }
    return _addressLabel;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.textColor = CharacterDarkColor;
    }
    return _nameLabel;
}

- (UIButton *)connectButton {
    if (!_connectButton) {
        _connectButton = [UIButton new];
        [_connectButton setBackgroundImage:[UIImage imageNamed:@"red"] forState:UIControlStateNormal];
        [_connectButton setImage:[UIImage imageNamed:@"phone"] forState:UIControlStateNormal];
        [_connectButton setTitle:@"马上联系" forState:UIControlStateNormal];
        [_connectButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        _connectButton.imageEdgeInsets = UIEdgeInsetsMake(0, -3, 0, 3);
        _connectButton.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, -3);
        _connectButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _connectButton.layer.cornerRadius = 16.5;
        _connectButton.layer.masksToBounds = YES;
        [_connectButton addTarget:self action:@selector(contactNowClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _connectButton;
}



-(void)show {
    self.alpha = 1;
    _contentView.transform = CGAffineTransformMakeScale(0.1, 0.1);
    [[UIApplication sharedApplication].delegate.window addSubview:self];
    WeakObj(self);
    [UIView animateWithDuration:0.3 delay:0 usingSpringWithDamping:0.7 initialSpringVelocity:20 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        selfWeak.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        selfWeak.contentView.transform = CGAffineTransformIdentity;
    } completion:nil];
}

- (void)dismiss {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    WeakObj(self);
    [UIView animateWithDuration:0.3 animations:^{
        selfWeak.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)closeButtonClick:(UIButton *)btn {
    [self dismiss];
}

- (void)setModel:(LxmQiangDanGetOrderModel *)model {
    _model = model;
    _timeLabel.text = [NSString stringWithFormat:@"预约时间: %@",_model.meet_date];
    _addressLabel.text = [NSString stringWithFormat:@"上门地址: %@%@%@", _model.province, _model.city, _model.address_detail];
    _nameLabel.text = [NSString stringWithFormat:@"联系人:　 %@",_model.link_name];
}

- (void)contactNowClick:(UIButton *)btn {
    [self dismiss];
  
        
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",_model.link_tel]]];

  
    
}

@end
