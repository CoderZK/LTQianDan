//
//  LxmLoginView.m
//  qiangdan
//
//  Created by 李晓满 on 2020/3/20.
//  Copyright © 2020 李晓满. All rights reserved.
//

#import "LxmLoginView.h"
#import "LxmSeeMoreDetailVC.h"

@implementation LxmLoginView

@end

@interface LxmYinYingView ()

@property (nonatomic, strong) UIView *contentView;//

@property (nonatomic, strong) UIView *yinyingView;

@end
@implementation LxmYinYingView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.yinyingView];
        [self addSubview:self.contentView];
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.leading.equalTo(self).offset(15);
            make.bottom.trailing.equalTo(self).offset(-15);
        }];
        [self.yinyingView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.leading.equalTo(self).offset(25);
            make.bottom.trailing.equalTo(self).offset(-25);
        }];
    }
    return self;
}

- (UIView *)contentView {
    if (!_contentView) {
        _contentView = [UIView new];
        _contentView.backgroundColor = [UIColor whiteColor];
        _contentView.layer.cornerRadius = 10;
        _contentView.layer.masksToBounds = YES;
    }
    return _contentView;
}

- (UIView *)yinyingView {
    if (!_yinyingView) {
        _yinyingView = [UIView new];
        _yinyingView.backgroundColor = [UIColor whiteColor];
        _yinyingView.layer.shadowColor = [CharacterDarkColor colorWithAlphaComponent:0.5].CGColor;
        _yinyingView.layer.shadowRadius = 10;
        _yinyingView.layer.shadowOpacity = 0.5;
        _yinyingView.layer.shadowOffset = CGSizeMake(0, 0);
    }
    return _yinyingView;
}

@end


/// 输入view
@implementation LxmPutinView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.putinTF];
        [self addSubview:self.lineView];
        [self.putinTF mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.top.equalTo(self);
            make.bottom.equalTo(self.lineView.mas_top);
        }];
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.bottom.equalTo(self);
            make.height.equalTo(@0.5);
        }];
    }
    return self;
}

- (UITextField *)putinTF {
    if (!_putinTF) {
        _putinTF = [UITextField new];
        _putinTF.textColor = [UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1];
        _putinTF.font = [UIFont systemFontOfSize:15];
    }
    return _putinTF;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1.0];
    }
    return _lineView;
}

@end


@implementation LxmSelectTitleButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.textLabel];
        [self addSubview:self.iconImgView];
        [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(self);
            make.centerY.equalTo(self);
            make.width.equalTo(@9);
            make.height.equalTo(@5);
        }];
        [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(self.iconImgView.mas_leading).offset(-3);
            make.center.equalTo(self);
        }];
    }
    return self;
}

- (UILabel *)textLabel {
    if (!_textLabel) {
        _textLabel = [[UILabel alloc] init];
        _textLabel.font = [UIFont systemFontOfSize:18];
        _textLabel.textColor = UIColor.blackColor;
    }
    return _textLabel;
}

- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
        _iconImgView.image = [UIImage imageNamed:@"arrow_down"];
    }
    return _iconImgView;
}

@end

@implementation LxmSelectLeftTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.leading.bottom.equalTo(self);
            make.trailing.equalTo(self).offset(-0.5);
        }];
    }
    return self;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:13];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

@end

@implementation LxmSelectRightTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self addSubview:self.titleLabel];
        [self addSubview:self.iconImgView];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self);
            make.leading.equalTo(self).offset(15);
        }];
        [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.trailing.equalTo(self).offset(-15);
            make.width.equalTo(@12);
            make.height.equalTo(@8);
        }];
    }
    return self;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
        _titleLabel.font = [UIFont systemFontOfSize:13];
    }
    return _titleLabel;
}

- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
        _iconImgView.image = [UIImage imageNamed:@"select_y"];
    }
    return _iconImgView;
}

@end




@interface LxmSelectView ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *bgView;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UIButton *allButton;

@property (nonatomic, strong) UITableView *leftTableView;

@property (nonatomic, strong) UITableView *rigtTableView;

@property (nonatomic, assign) NSInteger leftCurrentIndex;

@property (nonatomic, assign) NSInteger rightCurrentIndex;

@property (nonatomic, strong) LxmHomeFirstTypeRootModel *typeModel;//一级分类model

@property (nonatomic, strong) LxmHomeFirstTypeRootModel *secondTypeModel;//二级级分类model



@property (nonatomic, strong) NSString *secondName;

@end

@implementation LxmSelectView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.bgView];
        [self initBgView];
        [self setConstrains];
        [self addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        self.leftCurrentIndex = 111;
        self.rightCurrentIndex = 111;
    }
    return self;
}

/**
 添加视图
 */
- (void)initBgView {
    [self.bgView addSubview:self.lineView];
    [self.bgView addSubview:self.allButton];
    [self.bgView addSubview:self.leftTableView];
    [self.bgView addSubview:self.rigtTableView];
}

/**
 添加约束
 */
- (void)setConstrains {
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self.bgView);
        make.height.equalTo(@0.5);
    }];
    [self.allButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView.mas_bottom);
        make.leading.trailing.equalTo(self.bgView);
        make.height.equalTo(@40);
    }];
    [self.leftTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.allButton.mas_bottom);
        make.leading.bottom.equalTo(self.bgView);
        make.width.equalTo(@100);
    }];
    [self.rigtTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.allButton.mas_bottom);
        make.trailing.bottom.equalTo(self.bgView);
        make.leading.equalTo(self.leftTableView.mas_trailing);
    }];
}


- (void)btnClick {
    [self dismiss];
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    }
    return _lineView;
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}

- (UIButton *)allButton {
    if (!_allButton) {
        _allButton = [UIButton new];
        [_allButton setTitle:@"全部" forState:UIControlStateNormal];
        _allButton.titleLabel.font = [UIFont systemFontOfSize:13];
        [_allButton setTitleColor:RedColor forState:UIControlStateSelected];
        [_allButton setTitleColor:CharacterDarkColor forState:UIControlStateNormal];
        [_allButton addTarget:self action:@selector(allButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _allButton;
}

- (UITableView *)leftTableView {
    if (!_leftTableView) {
        _leftTableView = [[UITableView alloc] init];
        _leftTableView.delegate = self;
        _leftTableView.dataSource = self;
        _leftTableView.backgroundColor = [UIColor colorWithRed:246/255.0 green:246/255.0 blue:246/255.0 alpha:1.0];
        _leftTableView.showsVerticalScrollIndicator = NO;
        _leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _leftTableView;
}

- (UITableView *)rigtTableView {
    if (!_rigtTableView) {
        _rigtTableView = [[UITableView alloc] init];
        _rigtTableView.delegate = self;
        _rigtTableView.dataSource = self;
        _rigtTableView.showsVerticalScrollIndicator = NO;
        _rigtTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _rigtTableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == _leftTableView) {
        return self.typeModel.result.list.count;
    }
    return self.secondTypeModel.result.list.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == _leftTableView) {
        LxmSelectLeftTableCell * cell = [tableView dequeueReusableCellWithIdentifier:@"LxmSelectLeftTableCell"];
        if (!cell) {
            cell = [[LxmSelectLeftTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LxmSelectLeftTableCell"];
        }
        cell.titleLabel.backgroundColor = indexPath.row == self.leftCurrentIndex ? UIColor.whiteColor : UIColor.clearColor;
        cell.titleLabel.text = self.typeModel.result.list[indexPath.row].category_name;
        cell.titleLabel.textColor = indexPath.row == self.leftCurrentIndex ? RedColor : CharacterDarkColor;
        return cell;
    }
    LxmSelectRightTableCell * cell = [tableView dequeueReusableCellWithIdentifier:@"LxmSelectRightTableCell"];
    if (!cell) {
        cell = [[LxmSelectRightTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LxmSelectRightTableCell"];
    }
    cell.titleLabel.text = self.secondTypeModel.result.list[indexPath.row].category_name;
    cell.iconImgView.hidden = indexPath.row == self.rightCurrentIndex ? NO : YES;
    cell.titleLabel.textColor = indexPath.row == self.rightCurrentIndex ? RedColor : CharacterDarkColor;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    self.allButton.selected = NO;
    if (tableView == _leftTableView) {
        if (self.leftCurrentIndex == 111) {
            self.rightCurrentIndex = 0;
            [self.rigtTableView reloadData];
        }
        self.leftCurrentIndex = indexPath.row;
        self.firstTypeId = self.typeModel.result.list[indexPath.row].id;
        [self loadSecondTypeData:self.firstTypeId];
        [self.leftTableView reloadData];
    } else {
        if (self.rightCurrentIndex == 111) {
            self.leftCurrentIndex = 0;
            [self.leftTableView reloadData];
        }
        self.rightCurrentIndex = indexPath.row;
        self.secondTypeId = self.secondTypeModel.result.list[indexPath.row].id;
        self.secondName = self.secondTypeModel.result.list[indexPath.row].category_name;
        [self.rigtTableView reloadData];
        [self dismiss];
    }
    
}

- (void)allButtonClick:(UIButton *)btn {
    btn.selected = YES;
    self.secondName = @"全部";
    self.secondTypeId = @"";
    self.firstTypeId = @"";
    self.rightCurrentIndex = 111;
    self.leftCurrentIndex = 111;
    [self.leftTableView reloadData];
    [self.rigtTableView reloadData];
    [self dismiss];
}




- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 44;
}

- (void)showAtView:(UIView *)view {
    self.frame = view.bounds;
    self.backgroundColor = UIColor.clearColor;
    CGFloat height = 44*8;
    self.bgView.frame = CGRectMake(0, -height, self.frame.size.width, height);
    
    [view addSubview:self];
    WeakObj(self);
    [UIView animateWithDuration:0.3 animations:^{
        selfWeak.backgroundColor = [UIColor.blackColor colorWithAlphaComponent:0.3];
        CGRect rect = selfWeak.bgView.frame;
        rect.origin.y = 0;
        selfWeak.bgView.frame =  rect;
    }];
    [self loadFirstTypeData];
}

- (void)dismiss {
    if (self.dismissBlock) {
        self.dismissBlock(self.firstTypeId, self.secondTypeId, self.secondName);
    }
    WeakObj(self);
    [UIView animateWithDuration:0.3 animations:^{
        selfWeak.backgroundColor = UIColor.clearColor;
        CGRect rect = self.bgView.frame;
        rect.origin.y = -rect.size.height;
        selfWeak.bgView.frame =  rect;
    } completion:^(BOOL finished) {
        [selfWeak removeFromSuperview];
    }];
}

/// 获取首页一级分类
- (void)loadFirstTypeData {
    if (!self.typeModel) {
        [SVProgressHUD show];
    }
    WeakObj(self);
    NSMutableDictionary * dict = @{}.mutableCopy;
    dict[@"token"] = [LxmTool ShareTool].session_token;
    [LxmNetworking networkingPOST:first_type_list parameters:dict returnClass:LxmHomeFirstTypeRootModel.class success:^(NSURLSessionDataTask *task, LxmHomeFirstTypeRootModel *responseObject) {
        [selfWeak endRefrish];
        if (responseObject.key.intValue == 1000) {
            selfWeak.typeModel = responseObject;
            if (selfWeak.typeModel.result.list.count >= 1) {
                
                
                    NSString *firstid = selfWeak.typeModel.result.list[0].id;
                    
                    for (int i = 0 ; i< selfWeak.typeModel.result.list.count; i++) {
                        if ([selfWeak.typeModel.result.list[i].id isEqualToString:self.firstTypeId]) {
                            firstid = selfWeak.typeModel.result.list[i].id;
                            self.leftCurrentIndex = i;
                            break;
                        }
                    }
                    selfWeak.firstTypeId = firstid;
                    [selfWeak loadSecondTypeData:selfWeak.firstTypeId];
                
            }
            [selfWeak.leftTableView reloadData];
        } else {
            [UIAlertController showAlertWithmessage:responseObject.message];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [selfWeak endRefrish];
    }];
}

/// 根据一级分类获取二级分类
- (void)loadSecondTypeData:(NSString *)firstTypeID {
    [SVProgressHUD show];
    WeakObj(self);
    NSMutableDictionary * dict = @{}.mutableCopy;
    dict[@"firstTypeId"] = firstTypeID;
    dict[@"token"] = [LxmTool ShareTool].session_token;
    [LxmNetworking networkingPOST:second_type_list parameters:dict returnClass:LxmHomeFirstTypeRootModel.class success:^(NSURLSessionDataTask *task, LxmHomeFirstTypeRootModel *responseObject) {
        [selfWeak endRefrish0];
        if (responseObject.key.intValue == 1000) {
            selfWeak.secondTypeModel = responseObject;
            if (selfWeak.secondTypeModel.result.list.count >= 1) {
                NSString * secondName  = self.secondTypeModel.result.list[0].category_name;
                NSString * secondId = selfWeak.secondTypeModel.result.list[0].id;
                
                for (int i = 0 ; i < selfWeak.secondTypeModel.result.list.count; i++) {
                    if ([selfWeak.secondTypeModel.result.list[i].id isEqualToString:self.secondTypeId]) {
                        secondId = selfWeak.secondTypeModel.result.list[i].id;
                        secondName = self.secondTypeModel.result.list[0].category_name;
                        selfWeak.rightCurrentIndex = i;
                        break;
                    }
                }
                selfWeak.secondTypeId = secondId;
                selfWeak.secondName = secondName;
            }
            [selfWeak.rigtTableView reloadData];
        } else {
            [UIAlertController showAlertWithmessage:responseObject.message];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [selfWeak endRefrish0];
    }];
}


- (void)endRefrish {
    [SVProgressHUD dismiss];
    [self.leftTableView.mj_header endRefreshing];
    [self.leftTableView.mj_footer endRefreshing];
}

- (void)endRefrish0 {
    [SVProgressHUD dismiss];
    [self.rigtTableView.mj_header endRefreshing];
    [self.rigtTableView.mj_footer endRefreshing];
}


@end

#pragma 抢单大厅cell 部分视图

 @implementation LxmQingDanListLableDetailCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.leftLabel];
        [self addSubview:self.rightLabel];
        [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.leading.equalTo(self).offset(15);
            make.width.equalTo(@80);
        }];
        [self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self);
            make.leading.equalTo(self.leftLabel.mas_trailing);
            make.trailing.equalTo(self).offset(-15);
        }];
    }
    return self;
}

- (UILabel *)leftLabel {
    if (!_leftLabel) {
        _leftLabel = [UILabel new];
        _leftLabel.textColor = CharacterGrayColor;
        _leftLabel.font = [UIFont systemFontOfSize:13];
    }
    return _leftLabel;
}

- (UILabel *)rightLabel {
    if (!_rightLabel) {
        _rightLabel = [UILabel new];
        _rightLabel.textColor = CharacterDarkColor;
        _rightLabel.font = [UIFont systemFontOfSize:13];
        _rightLabel.textAlignment = NSTextAlignmentRight;
    }
    return _rightLabel;
}

@end

@interface LxmQingDanListGoodsView ()

@property (nonatomic, strong) UIImageView *goodsImgView;//商品图片

@property (nonatomic, strong) UILabel *goodsNameLabel;//商品名称

@property (nonatomic, strong) UILabel *moneyLabel;//商品价格

@end
@implementation LxmQingDanListGoodsView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.goodsImgView];
        [self addSubview:self.goodsNameLabel];
        [self addSubview:self.moneyLabel];
        [self.goodsImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(15);
            make.centerY.equalTo(self);
            make.width.height.equalTo(@36);
        }];
        [self.goodsNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.goodsImgView.mas_trailing).offset(10);
            make.centerY.equalTo(self);
        }];
        [self.moneyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(self).offset(-15);
            make.centerY.equalTo(self);
        }];
    }
    return self;
}

- (UIImageView *)goodsImgView {
    if (!_goodsImgView) {
        _goodsImgView = [UIImageView new];
        _goodsImgView.image = [UIImage imageNamed:@"iphone"];
    }
    return _goodsImgView;
}

- (UILabel *)goodsNameLabel {
    if (!_goodsNameLabel) {
        _goodsNameLabel = [UILabel new];
        _goodsNameLabel.font = [UIFont boldSystemFontOfSize:15];
        _goodsNameLabel.textColor = CharacterDarkColor;
        _goodsNameLabel.text = @"iPhone X";
    }
    return _goodsNameLabel;
}

- (UILabel *)moneyLabel {
    if (!_moneyLabel) {
        _moneyLabel = [UILabel new];
        _moneyLabel.font = [UIFont boldSystemFontOfSize:15];
        _moneyLabel.textColor = RedColor;
        _moneyLabel.text = @"¥2222";
    }
    return _moneyLabel;
}

- (void)setModel:(LxmQiangDanModel *)model {
    _model = model;
    [_goodsImgView sd_setImageWithURL:[NSURL URLWithString:_model.main_pic] placeholderImage:[UIImage imageNamed:@""]];
    _goodsNameLabel.text = _model.good_name;
    _moneyLabel.text = [NSString stringWithFormat:@"¥%.2f", _model.about_price.doubleValue];
}

@end



//抢单大厅cell
@interface LxmQingDanListCell ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *contentView0;//

@property (nonatomic, strong) UIView *yinyingView;

@property (nonatomic, strong) LxmQingDanListGoodsView *topView;

@property (nonatomic, strong) UITableView *centerTableView;//中间view

@property (nonatomic, strong) UIButton *seeMoreDetailButton;//查看更多评估详情


@property (nonatomic, strong) UILabel *statusLB;//什么类型的订单
@property(nonatomic , strong)UILabel *statusTwoLB; //什么类型

@property (nonatomic, strong) UILabel *timeLabel;//预约上门时间

@property (nonatomic, strong) UILabel *addressLabel;//预约上门地址

@property (nonatomic, strong) UIButton *qiangdanButton;//抢单

@end
@implementation LxmQingDanListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.yinyingView];
        [self addSubview:self.contentView0];
        [self.contentView0 addSubview:self.topView];
        [self.contentView0 addSubview:self.centerTableView];
        [self.contentView0 addSubview:self.seeMoreDetailButton];
        [self.contentView0 addSubview:self.statusLB];
        [self.contentView0 addSubview:self.statusTwoLB];
        [self.contentView0 addSubview:self.timeLabel];
        [self.contentView0 addSubview:self.addressLabel];
        [self.contentView0 addSubview:self.qiangdanButton];
        [self.contentView0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.leading.equalTo(self).offset(15);
            make.trailing.equalTo(self).offset(-15);
            make.bottom.equalTo(self).offset(-2.5);
        }];
        [self.yinyingView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.leading.equalTo(self).offset(25);
            make.trailing.equalTo(self).offset(-25);
            make.bottom.equalTo(self).offset(-7);
        }];
        [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.leading.trailing.equalTo(self.contentView0);
            make.height.equalTo(@66);
        }];
        [self.centerTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.topView.mas_bottom);
            make.trailing.equalTo(self.contentView0).offset(-15);
            make.leading.equalTo(self.contentView0).offset(15);
            make.height.equalTo(@150);
        }];
        [self.seeMoreDetailButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.centerTableView.mas_bottom);
            make.leading.equalTo(self).offset(15);
            make.trailing.equalTo(self).offset(-15);
            make.height.equalTo(@50);
        }];
        [self.statusLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.seeMoreDetailButton.mas_bottom).offset(15);
            make.leading.equalTo(self.contentView0).offset(15);
//            make.width.equalTo(@80);
        }];
        
        [self.statusTwoLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.statusLB.mas_centerY);
            make.left.equalTo(self.statusLB.mas_right).offset(10);
            make.width.equalTo(@50);
            make.height.equalTo(@19);
        }];
        
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                   make.top.equalTo(self.statusLB.mas_bottom).offset(15);
                   make.leading.equalTo(self.contentView0).offset(15);
                   make.trailing.equalTo(self.contentView0).offset(-15);
               }];
        
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.timeLabel.mas_bottom).offset(10);
            make.leading.equalTo(self.contentView0).offset(15);
            make.trailing.equalTo(self.contentView0).offset(-15);
        }];
        [self.qiangdanButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.addressLabel.mas_bottom).offset(20);
            make.leading.equalTo(self.contentView0).offset(15);
            make.trailing.equalTo(self.contentView0).offset(-15);
            make.height.equalTo(@40);
        }];
        
    }
    return self;
}

- (UIView *)contentView0 {
    if (!_contentView0) {
        _contentView0 = [UIView new];
        _contentView0.backgroundColor = [UIColor whiteColor];
        _contentView0.layer.cornerRadius = 10;
        _contentView0.layer.masksToBounds = YES;
    }
    return _contentView0;
}

- (UIView *)yinyingView {
    if (!_yinyingView) {
        _yinyingView = [UIView new];
        _yinyingView.backgroundColor = [UIColor whiteColor];
        _yinyingView.layer.shadowColor = [CharacterDarkColor colorWithAlphaComponent:0.3].CGColor;
        _yinyingView.layer.shadowRadius = 5;
        _yinyingView.layer.shadowOpacity = 0.5;
        _yinyingView.layer.shadowOffset = CGSizeMake(0, 0);
    }
    return _yinyingView;
}

- (UITableView *)centerTableView {
    if (!_centerTableView) {
        _centerTableView = [UITableView new];
        _centerTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _centerTableView.delegate = self;
        _centerTableView.dataSource = self;
        _centerTableView.showsVerticalScrollIndicator = NO;
        _centerTableView.scrollEnabled = NO;
        _centerTableView.backgroundColor = [UIColor colorWithRed:252/255.0 green:252/255.0 blue:252/255.0 alpha:1];
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW - 120, 25)];
        view.backgroundColor = [UIColor colorWithRed:252/255.0 green:252/255.0 blue:252/255.0 alpha:1];
        _centerTableView.tableHeaderView = view;
    }
    return _centerTableView;
}

- (UIButton *)seeMoreDetailButton {
    if (!_seeMoreDetailButton) {
        _seeMoreDetailButton = [UIButton new];
        [_seeMoreDetailButton setTitle:@"查看更多评估详情 >" forState:UIControlStateNormal];
        [_seeMoreDetailButton setTitleColor:[UIColor colorWithRed:82/255.0 green:153/255.0 blue:250/255.0 alpha:1] forState:UIControlStateNormal];
        _seeMoreDetailButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _seeMoreDetailButton.backgroundColor = [UIColor colorWithRed:252/255.0 green:252/255.0 blue:252/255.0 alpha:1];
        [_seeMoreDetailButton addTarget:self action:@selector(seeMoreDetailClick) forControlEvents:UIControlEventTouchUpInside];
        _seeMoreDetailButton.clipsToBounds = YES;
    }
    return _seeMoreDetailButton;
}

- (LxmQingDanListGoodsView *)topView {
    if (!_topView) {
        _topView = [LxmQingDanListGoodsView new];
    }
    return _topView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _model.chooseArr.count>4?4:_model.chooseArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _model.chooseArr[section].choices.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LxmQingDanListLableDetailCell * cell = [tableView dequeueReusableCellWithIdentifier:@"LxmQingDanListLableDetailCell"];
    if (!cell) {
        cell = [[LxmQingDanListLableDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LxmQingDanListLableDetailCell"];
    }
    cell.leftLabel.hidden = indexPath.row != 0;
    cell.leftLabel.text = _model.chooseArr[indexPath.section].question;
    cell.rightLabel.text = _model.chooseArr[indexPath.section].choices[indexPath.row].choice;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}


- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.font = [UIFont systemFontOfSize:13];
        _timeLabel.textColor = CharacterDarkColor;
        _timeLabel.text = @"预约时间: 03月10日(星期二)12:00-13:00";
    }
    return _timeLabel;
}

-(UILabel *)statusLB {
    if (!_statusLB) {
        _statusLB = [UILabel new];
        _statusLB.font = [UIFont systemFontOfSize:13];
        _statusLB.textColor = CharacterDarkColor;
        _statusLB.text = @"回收方式:";
    }
    return _statusLB;
}

-(UILabel *)statusTwoLB {
    if (!_statusTwoLB) {
        _statusTwoLB = [UILabel new];
        _statusTwoLB.font = [UIFont systemFontOfSize:11];
        _statusTwoLB.textColor = RedColor;
        _statusTwoLB.backgroundColor = [UIColor colorWithRed:255/255.0 green:237/255.0 blue:237/255.0 alpha:1.0];
        _statusTwoLB.textAlignment = NSTextAlignmentCenter;
        _statusTwoLB.text = @"回收方式:";
    }
    return _statusTwoLB;
}

- (UILabel *)addressLabel {
    if (!_addressLabel) {
        _addressLabel = [UILabel new];
        _addressLabel.font = [UIFont systemFontOfSize:13];
        _addressLabel.textColor = CharacterDarkColor;
        _addressLabel.text = @"上门地址: 邳州市碾庄镇200";
    }
    return _addressLabel;
}

- (UIButton *)qiangdanButton {
    if (!_qiangdanButton) {
        _qiangdanButton = [UIButton new];
        [_qiangdanButton setBackgroundImage:[UIImage imageNamed:@"red"] forState:UIControlStateNormal];
        [_qiangdanButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [_qiangdanButton setTitle:@"抢单" forState:UIControlStateNormal];
        [_qiangdanButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        _qiangdanButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _qiangdanButton.layer.cornerRadius = 20;
        _qiangdanButton.clipsToBounds = YES;
        [_qiangdanButton addTarget:self action:@selector(qiangdanClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _qiangdanButton;
}

/// 抢单
- (void)qiangdanClick:(UIButton *)btn {
    if (self.qiangDanBlock) {
        self.qiangDanBlock(self.model);
    }
}

- (void)setModel:(LxmQiangDanModel *)model {
    _model = model;
    _topView.model = _model;
    _timeLabel.text = [NSString stringWithFormat:@"预约时间: %@", _model.meet_date];
    if (_model.type.intValue == 1) {
        _addressLabel.text = [NSString stringWithFormat:@"上门地址: %@%@%@", _model.province, _model.city, _model.address_detail];
        _statusTwoLB.text = @"上门回收";
    } else if (_model.type.intValue == 2) {
        _addressLabel.text = [NSString stringWithFormat:@"发货地址: %@%@%@", _model.province, _model.city, _model.address_detail];
        _statusTwoLB.text = @"快递回收";
    }
    
    [self.centerTableView reloadData];
    if (_model.count > 4) {
        [self.centerTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.topView.mas_bottom);
            make.trailing.equalTo(self.contentView0).offset(-15);
            make.leading.equalTo(self.contentView0).offset(15);
            make.height.equalTo(@150);
        }];
        [self.seeMoreDetailButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.centerTableView.mas_bottom);
            make.leading.equalTo(self).offset(15);
            make.trailing.equalTo(self).offset(-15);
            make.height.equalTo(@50);
        }];
    } else {
        [self.centerTableView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.topView.mas_bottom);
            make.trailing.equalTo(self.contentView0).offset(-15);
            make.leading.equalTo(self.contentView0).offset(15);
            make.height.equalTo(@(30 + 30*_model.count));
        }];
        [self.seeMoreDetailButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.centerTableView.mas_bottom);
            make.leading.equalTo(self).offset(15);
            make.trailing.equalTo(self).offset(-15);
            make.height.equalTo(@0);
        }];
    }
}

- (void)seeMoreDetailClick {
    LxmSeeMoreDetailVC *vc = [LxmSeeMoreDetailVC new];
    vc.chooseArr = _model.chooseArr;
    [UIViewController.topViewController.navigationController pushViewController:vc animated:YES];
}

@end


@interface LxmDaiShangMenListCell ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *contentView0;//

@property (nonatomic, strong) UIView *yinyingView;

@property (nonatomic, strong) UIView *topView0;

@property (nonatomic, strong) UIView *lineView;//线

@property (nonatomic, strong) UILabel *statusLabel;//状态label

@property (nonatomic, strong) UIButton *actionButton;//操作按钮

@property (nonatomic, strong) LxmQingDanListGoodsView *topView;

@property (nonatomic, strong) UITableView *centerTableView;//中间view

@property (nonatomic, strong) UIButton *seeMoreDetailButton;//查看更多评估详情

@property (nonatomic, strong) UILabel *timeLabel;//预约上门时间

@property (nonatomic, strong) UILabel *addressLabel;//预约上门地址

@property (nonatomic, strong) UILabel *nameLabel;//联系人

@property (nonatomic, strong) UILabel *phoneLabel;//联系电话

@property (nonatomic, strong) UIButton *callButton;//电话

@end
@implementation LxmDaiShangMenListCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.yinyingView];
        [self addSubview:self.contentView0];
        [self.contentView0 addSubview:self.topView0];
        [self.topView0 addSubview:self.lineView];
        [self.topView0 addSubview:self.statusLabel];
        [self.topView0 addSubview:self.actionButton];
        [self.contentView0 addSubview:self.topView];
        [self.contentView0 addSubview:self.centerTableView];
        [self.contentView0 addSubview:self.seeMoreDetailButton];
        [self.contentView0 addSubview:self.timeLabel];
        [self.contentView0 addSubview:self.addressLabel];
        [self.contentView0 addSubview:self.nameLabel];
        [self.contentView0 addSubview:self.phoneLabel];
        [self.contentView0 addSubview:self.callButton];
        [self.contentView0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.leading.equalTo(self).offset(15);
            make.trailing.equalTo(self).offset(-15);
            make.bottom.equalTo(self).offset(-2.5);
        }];
        [self.yinyingView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.leading.equalTo(self).offset(25);
            make.trailing.equalTo(self).offset(-25);
            make.bottom.equalTo(self).offset(-7);
        }];
        [self.topView0 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.leading.trailing.equalTo(self.contentView0);
            make.height.equalTo(@66);
        }];
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.trailing.bottom.equalTo(self.topView0);
            make.height.equalTo(@0.5);
        }];
        [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self.topView0).offset(15);
            make.centerY.equalTo(self.topView0);
        }];
        [self.actionButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(self.topView0).offset(-15);
            make.centerY.equalTo(self.topView0);
            make.width.equalTo(@94);
            make.height.equalTo(@25);
        }];
        [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.topView0.mas_bottom);
            make.leading.trailing.equalTo(self.contentView0);
            make.height.equalTo(@66);
        }];
        [self.centerTableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.topView.mas_bottom);
            make.trailing.equalTo(self.contentView0).offset(-15);
            make.leading.equalTo(self.contentView0).offset(15);
            make.height.equalTo(@150);
        }];
        [self.seeMoreDetailButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.centerTableView.mas_bottom);
            make.leading.equalTo(self).offset(15);
            make.trailing.equalTo(self).offset(-15);
            make.height.equalTo(@50);
        }];
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.seeMoreDetailButton.mas_bottom).offset(15);
            make.leading.equalTo(self.contentView0).offset(15);
            make.trailing.equalTo(self.contentView0).offset(-15);
        }];
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.timeLabel.mas_bottom).offset(10);
            make.leading.equalTo(self.contentView0).offset(15);
            make.trailing.equalTo(self.contentView0).offset(-15);
        }];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.addressLabel.mas_bottom).offset(10);
            make.leading.equalTo(self.contentView0).offset(15);
            make.trailing.equalTo(self.contentView0).offset(-15);
        }];
        [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.nameLabel.mas_bottom).offset(10);
            make.leading.equalTo(self.contentView0).offset(15);
        }];
        [self.callButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.phoneLabel);
            make.leading.equalTo(self.phoneLabel.mas_trailing).offset(5);
            make.trailing.lessThanOrEqualTo(self.contentView0).offset(-15);
            make.height.equalTo(@30);
            make.width.equalTo(@120);
            make.bottom.equalTo(self.contentView0.mas_bottom).offset(-20);
        }];
    }
    return self;
}

- (UIView *)contentView0 {
    if (!_contentView0) {
        _contentView0 = [UIView new];
        _contentView0.backgroundColor = [UIColor whiteColor];
        _contentView0.layer.cornerRadius = 10;
        _contentView0.layer.masksToBounds = YES;
    }
    return _contentView0;
}

- (UIView *)yinyingView {
    if (!_yinyingView) {
        _yinyingView = [UIView new];
        _yinyingView.backgroundColor = [UIColor whiteColor];
        _yinyingView.layer.shadowColor = [CharacterDarkColor colorWithAlphaComponent:0.3].CGColor;
        _yinyingView.layer.shadowRadius = 5;
        _yinyingView.layer.shadowOpacity = 0.5;
        _yinyingView.layer.shadowOffset = CGSizeMake(0, 0);
    }
    return _yinyingView;
}

- (UITableView *)centerTableView {
    if (!_centerTableView) {
        _centerTableView = [UITableView new];
        _centerTableView.separatorStyle = UITableViewCellSelectionStyleNone;
        _centerTableView.delegate = self;
        _centerTableView.dataSource = self;
        _centerTableView.showsVerticalScrollIndicator = NO;
        _centerTableView.scrollEnabled = NO;
        _centerTableView.backgroundColor = [UIColor colorWithRed:252/255.0 green:252/255.0 blue:252/255.0 alpha:1];
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, ScreenW - 120, 25)];
        view.backgroundColor = [UIColor colorWithRed:252/255.0 green:252/255.0 blue:252/255.0 alpha:1];
        _centerTableView.tableHeaderView = view;
    }
    return _centerTableView;
}

- (UIButton *)seeMoreDetailButton {
    if (!_seeMoreDetailButton) {
        _seeMoreDetailButton = [UIButton new];
        [_seeMoreDetailButton setTitle:@"查看更多评估详情 >" forState:UIControlStateNormal];
        [_seeMoreDetailButton setTitleColor:[UIColor colorWithRed:82/255.0 green:153/255.0 blue:250/255.0 alpha:1] forState:UIControlStateNormal];
        _seeMoreDetailButton.titleLabel.font = [UIFont systemFontOfSize:15];
        _seeMoreDetailButton.backgroundColor = [UIColor colorWithRed:252/255.0 green:252/255.0 blue:252/255.0 alpha:1];
        [_seeMoreDetailButton addTarget:self action:@selector(seeMoreDetailClick) forControlEvents:UIControlEventTouchUpInside];
        _seeMoreDetailButton.clipsToBounds = YES;
    }
    return _seeMoreDetailButton;
}

- (UIView *)topView0 {
    if (!_topView0) {
        _topView0 = [UIView new];
    }
    return _topView0;
}

- (LxmQingDanListGoodsView *)topView {
    if (!_topView) {
        _topView = [LxmQingDanListGoodsView new];
    }
    return _topView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _model.chooseArr.count > 4 ? 4 : _model.chooseArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _model.chooseArr[section].choices.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LxmQingDanListLableDetailCell * cell = [tableView dequeueReusableCellWithIdentifier:@"LxmQingDanListLableDetailCell"];
    if (!cell) {
        cell = [[LxmQingDanListLableDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LxmQingDanListLableDetailCell"];
    }
    cell.leftLabel.hidden = indexPath.row != 0;
    cell.leftLabel.text = _model.chooseArr[indexPath.section].question;
    cell.rightLabel.text = _model.chooseArr[indexPath.section].choices[indexPath.row].choice;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 30;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [UILabel new];
        _timeLabel.font = [UIFont systemFontOfSize:12];
        _timeLabel.textColor = CharacterDarkColor;
        _timeLabel.text = @"预约时间: 03月10日(星期二)12:00-13:00";
    }
    return _timeLabel;
}

- (UILabel *)addressLabel {
    if (!_addressLabel) {
        _addressLabel = [UILabel new];
        _addressLabel.font = [UIFont systemFontOfSize:12];
        _addressLabel.textColor = CharacterDarkColor;
    }
    return _addressLabel;
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.textColor = CharacterDarkColor;
        _nameLabel.text = @"联系人:　 王先生";
    }
    return _nameLabel;
}

- (UILabel *)phoneLabel {
    if (!_phoneLabel) {
        _phoneLabel = [UILabel new];
        _phoneLabel.font = [UIFont systemFontOfSize:12];
        _phoneLabel.textColor = CharacterDarkColor;
        _phoneLabel.text = @"联系电话: 13912341234";
    }
    return _phoneLabel;
}

- (UIButton *)callButton {
    if (!_callButton) {
        _callButton = [UIButton new];
        [_callButton setImage:[UIImage imageNamed:@"call_phone"] forState:UIControlStateNormal];
        _callButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [_callButton addTarget:self action:@selector(callNowClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _callButton;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0];
    }
    return _lineView;
}

- (UILabel *)statusLabel {
    if (!_statusLabel) {
        _statusLabel = [UILabel new];
        _statusLabel.font = [UIFont systemFontOfSize:14];
        _statusLabel.textColor = RedColor;
        _statusLabel.text = @"待上门";
    }
    return _statusLabel;
}

- (UIButton *)actionButton {
    if (!_actionButton) {
        _actionButton = [UIButton new];
        [_actionButton setBackgroundImage:[UIImage imageNamed:@"red"] forState:UIControlStateNormal];
        [_actionButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        [_actionButton setTitle:@"确认完成" forState:UIControlStateNormal];
        [_actionButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
        _actionButton.titleLabel.font = [UIFont systemFontOfSize:13];
        _actionButton.layer.cornerRadius = 12.5;
        _actionButton.clipsToBounds = YES;
        [_actionButton addTarget:self action:@selector(actionClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _actionButton;
}
//马上联系
- (void)callNowClick:(UIButton *)btn {
    
    
           
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@",_model.link_tel]]];

           
  

}

- (void)actionClick:(UIButton *)btn {
    if (self.sureFinishBlock) {
        self.sureFinishBlock(self.model);
    }
}

- (void)setModel:(LxmQiangDanModel *)model {
    _model = model;
    _topView.model = _model;
    _timeLabel.text = [NSString stringWithFormat:@"预约时间: %@", _model.meet_date];
    _addressLabel.text = [NSString stringWithFormat:@"上门地址: %@%@%@", _model.province, _model.city, _model.address_detail];
    [self.centerTableView reloadData];
    if (_model.count > 4) {
        [self.seeMoreDetailButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.centerTableView.mas_bottom);
            make.leading.equalTo(self).offset(15);
            make.trailing.equalTo(self).offset(-15);
            make.height.equalTo(@50);
        }];
        
        [self.centerTableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@150);
        }];
    
        
        [self.seeMoreDetailButton mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.centerTableView.mas_bottom);
            make.leading.equalTo(self).offset(15);
            make.trailing.equalTo(self).offset(-15);
            make.height.equalTo(@50);
        }];
        
    } else {
        
//        [self.seeMoreDetailButton mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.centerTableView.mas_bottom);
//            make.leading.equalTo(self).offset(15);
//            make.trailing.equalTo(self).offset(-15);
//            make.height.equalTo(@0);
//        }];
        CGFloat hh = 30* model.count + 30;
        [self.centerTableView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(hh));
        }];
        
        [self.seeMoreDetailButton mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.centerTableView.mas_bottom);
            make.leading.equalTo(self).offset(15);
            make.trailing.equalTo(self).offset(-15);
            make.height.equalTo(@0);
        }];
    }
     _phoneLabel.text = [NSString stringWithFormat:@"联系电话: %@", _model.link_tel];
    _nameLabel.text = [NSString stringWithFormat:@"联系人:　 %@",_model.link_name];
//    model.cellHeight0 = CGRectGetMaxY(_callButton.frame) + 30;
}

- (void)seeMoreDetailClick {
    LxmSeeMoreDetailVC *vc = [LxmSeeMoreDetailVC new];
    vc.chooseArr = _model.chooseArr;
    [UIViewController.topViewController.navigationController pushViewController:vc animated:YES];
}

@end
