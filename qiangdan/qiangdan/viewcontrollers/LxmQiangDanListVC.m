//
//  LxmQiangDanListVC.m
//  qiangdan
//
//  Created by 李晓满 on 2020/3/20.
//  Copyright © 2020 李晓满. All rights reserved.
//

#import "LxmQiangDanListVC.h"
#import "LxmQiangDanAlertView.h"
#import "LxmDaiShangMenListVC.h"
#import "LxmLoginVC.h"

@interface LxmQiangDanListVC ()

@property (nonatomic, strong) UIButton *leftButton;//导航栏左侧按钮

@property (nonatomic, strong) UIButton *rightButton;//导航栏右侧按钮

@property (nonatomic, strong) LxmSelectTitleButton *titleButton;

@property (nonatomic, strong) LxmSelectView *selectedView;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) NSString *firstTypeId;

@property (nonatomic, strong) NSString *secondTypeId;

@property (nonatomic, assign) NSInteger page;

@property (nonatomic, assign) NSInteger allPageNum;

@property (nonatomic, strong) NSMutableArray <LxmQiangDanModel *>*dataArr;

@property (nonatomic, strong) LxmEmptyView *emptyView;//空界面

@end

@implementation LxmQiangDanListVC

- (LxmEmptyView *)emptyView {
    if (!_emptyView) {
        _emptyView = [[LxmEmptyView alloc] init];
        _emptyView.textLabel.text = @"暂无抢单内容~";
        _emptyView.imgView.image = [UIImage imageNamed:@"empty"];
        _emptyView.hidden = YES;
    }
    return _emptyView;
}


- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    }
    return _lineView;
}

- (LxmSelectView *)selectedView {
    if (!_selectedView) {
        _selectedView = [LxmSelectView new];
        _selectedView.firstTypeId = self.firstTypeId;
        _selectedView.secondTypeId = self.secondTypeId;
        WeakObj(self);
        _selectedView.dismissBlock = ^(NSString *firstTypeId, NSString *secondTypeId, NSString *secondName) {
            selfWeak.firstTypeId = firstTypeId;
            selfWeak.secondTypeId = secondTypeId;
            selfWeak.titleButton.selected = NO;
            selfWeak.titleButton.iconImgView.transform = CGAffineTransformIdentity;
            selfWeak.titleButton.textLabel.text = secondName.isValid ? secondName : @"全部";
            NSLog(@"一类id: %@ ----- 二类id: %@, 名称: %@",firstTypeId, secondTypeId, secondName);
            selfWeak.page = 1;
            selfWeak.allPageNum = 1;
            [selfWeak loadData];
        };
    }
    return _selectedView;
}

- (UIButton *)leftButton {
    if (!_leftButton) {
        _leftButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        _leftButton.imageEdgeInsets = UIEdgeInsetsMake(11, 0, 11, 22);
        [_leftButton addTarget:self action:@selector(navButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_leftButton setImage:[UIImage imageNamed:@"exit"] forState:UIControlStateNormal];
    }
    return _leftButton;
}

- (UIButton *)rightButton {
    if (!_rightButton) {
        _rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
        _rightButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
        [_rightButton addTarget:self action:@selector(navButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_rightButton setTitle:@"待上门" forState:UIControlStateNormal];
        [_rightButton setTitleColor:RedColor forState:UIControlStateNormal];
        _rightButton.titleLabel.font = [UIFont systemFontOfSize:14];
        _rightButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    }
    return _rightButton;
}

- (LxmSelectTitleButton *)titleButton {
    if (!_titleButton) {
        _titleButton = [[LxmSelectTitleButton alloc] initWithFrame:CGRectMake(0, 0, 120, 40)];
        _titleButton.textLabel.text = @"全部";
        [_titleButton addTarget:self action:@selector(titleSelectClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _titleButton;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.titleView = self.titleButton;
    self.tableView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.leftButton];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:self.rightButton];
    [self initView];
    
    self.dataArr = [NSMutableArray array];
    self.allPageNum = 1;
    self.page = 1;
    [self loadData];
    WeakObj(self);
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       StrongObj(self);
       self.page = 1;
       self.allPageNum = 1;
       [self loadData];
    }];

    self.tableView.mj_footer = [MJRefreshAutoFooter footerWithRefreshingBlock:^{
       StrongObj(self);
       [self loadData];
    }];
    [self.view addSubview:self.emptyView];
    [self.emptyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.bottom.equalTo(self.view);
    }];
}

- (void)initView {
    [self.view addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.equalTo(self.view);
        make.height.equalTo(@0.5);
    }];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView.mas_bottom);
        make.leading.bottom.trailing.equalTo(self.view);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LxmQingDanListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"LxmQingDanListCell"];
    if (!cell) {
        cell = [[LxmQingDanListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LxmQingDanListCell"];
    }
    cell.model = self.dataArr[indexPath.section];
    WeakObj(self);
    cell.qiangDanBlock = ^(LxmQiangDanModel *model) {
        [selfWeak qiangdanClick:model];
    };
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.dataArr[indexPath.section].cellHeight;
}


- (void)navButtonClick:(UIButton *)btn {
    if (btn == _leftButton) {//退出登录
        WeakObj(self);
        UIAlertController * alertView = [UIAlertController alertControllerWithTitle:nil message:@"确定要退出登录吗?" preferredStyle:UIAlertControllerStyleAlert];
        [alertView addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil]];
        [alertView addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            [selfWeak loginOut];
        }]];
        [self presentViewController:alertView animated:YES completion:nil];
    } else {//待上门
        LxmDaiShangMenListVC *vc = [LxmDaiShangMenListVC new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


/**
 导航栏titleview
 */
- (void)titleSelectClick:(LxmSelectTitleButton *)btn {
    btn.selected =  !btn.selected;
    btn.iconImgView.transform = btn.selected ? CGAffineTransformMakeRotation(M_PI) : CGAffineTransformIdentity;
    if (btn.selected) {
        [self.selectedView showAtView:self.view];
    } else {
        [self.selectedView dismiss];
    }
   
}

/// 退出登录
- (void)loginOut {
    [SVProgressHUD show];
    [LxmNetworking networkingPOST:app_logout parameters:@{@"token":SESSION_TOKEN} returnClass:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        [SVProgressHUD dismiss];
        if ([responseObject[@"key"] integerValue] == 1000) {
            [SVProgressHUD showSuccessWithStatus:@"已退出登录!"];
            [LxmTool ShareTool].session_token = nil;
            [LxmTool ShareTool].userModel = nil;
            [LxmTool ShareTool].isLogin = NO;
            UIApplication.sharedApplication.delegate.window.rootViewController = [[BaseNavigationController alloc] initWithRootViewController:[LxmLoginVC new]];
        }else {
            [UIAlertController showAlertWithmessage:responseObject[@"message"]];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [SVProgressHUD dismiss];
    }];
}

/**
 请求数据
 */
- (void)loadData {
    if (self.page <= self.allPageNum) {
        if (self.dataArr.count <= 0) {
            [SVProgressHUD show];
        }
        
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[@"token"] = SESSION_TOKEN;
        dict[@"pageNum"] =  @(self.page);
        dict[@"pageSize"] = @10;
        dict[@"firstTypeId"] = self.firstTypeId;
        dict[@"secondTypeId"] = self.secondTypeId;
        [LxmNetworking networkingPOST:order_hall parameters:dict returnClass:LxmQiangDanRootModel.class success:^(NSURLSessionDataTask *task, LxmQiangDanRootModel *responseObject) {
            [self endRefrish];
            if (responseObject.key.intValue == 1000) {
                self.allPageNum = responseObject.result.allPageNumber.intValue;
                if (self.page == 1) {
                    [self.dataArr removeAllObjects];
                }
                if (self.page <= responseObject.result.allPageNumber.intValue) {
                    [self.dataArr addObjectsFromArray:responseObject.result.list];
                }
                self.emptyView.hidden = self.dataArr.count > 0;
                self.page ++;
                [self.tableView reloadData];
            } else {
                [UIAlertController showAlertWithmessage:responseObject.message];
            }
        } failure:^(NSURLSessionDataTask *task, NSError *error) {
            [self endRefrish];
        }];
    }
}


///
/// @param model 抢单
- (void)qiangdanClick: (LxmQiangDanModel *)model {
    [SVProgressHUD show];
    WeakObj(self);
    [LxmNetworking networkingPOST:get_order parameters:@{@"token" : SESSION_TOKEN, @"orderId" : model.id} returnClass:LxmQiangDanGetOrderRootModel.class success:^(NSURLSessionDataTask *task, LxmQiangDanGetOrderRootModel *responseObject) {
        [SVProgressHUD dismiss];
        if (responseObject.key.intValue == 1000) {
            
            selfWeak.allPageNum = 1;
            selfWeak.page = 1;
            [selfWeak loadData];
            
            LxmQiangDanAlertView *alertView = [[LxmQiangDanAlertView alloc] initWithFrame:UIScreen.mainScreen.bounds];
            alertView.model = responseObject.result.map;
            [alertView show];
        } else {
            [UIAlertController showAlertWithmessage:responseObject.message];
        }
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        [SVProgressHUD show];
    }];
}

@end
