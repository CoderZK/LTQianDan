//
//  LxmDaiShangMenListVC.m
//  qiangdan
//
//  Created by 李晓满 on 2020/3/25.
//  Copyright © 2020 李晓满. All rights reserved.
//

#import "LxmDaiShangMenListVC.h"
#import "LxmSureFinishVC.h"

@interface LxmDaiShangMenListVC ()

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, assign) NSInteger page;

@property (nonatomic, assign) NSInteger allPageNum;

@property (nonatomic, strong) NSMutableArray <LxmQiangDanModel *>*dataArr;

@property (nonatomic, strong) LxmEmptyView *emptyView;//空界面

@end

@implementation LxmDaiShangMenListVC

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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.allPageNum = 1;
    self.page = 1;
    [self loadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"待上门";
    self.tableView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1.0];
    [self initView];
    self.dataArr = [NSMutableArray array];
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
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 300;
    
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
    [self.view addSubview:self.emptyView];
    [self.emptyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.leading.trailing.bottom.equalTo(self.view);
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    LxmDaiShangMenListCell * cell = [tableView dequeueReusableCellWithIdentifier:@"LxmDaiShangMenListCell"];
    if (!cell) {
        cell = [[LxmDaiShangMenListCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"LxmDaiShangMenListCell"];
    }
    cell.model = self.dataArr[indexPath.section];
    WeakObj(self);
    cell.sureFinishBlock = ^(LxmQiangDanModel *model) {
        //确认完成
        [selfWeak finishQiangDan:model];
    };
    return cell;
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    NSLog(@"====\n%lf",self.dataArr[indexPath.section].cellHeight0);
//
//    return self.dataArr[indexPath.section].cellHeight0;
//    
//}

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
        [LxmNetworking networkingPOST:order_door parameters:dict returnClass:LxmQiangDanRootModel.class success:^(NSURLSessionDataTask *task, LxmQiangDanRootModel *responseObject) {
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


//确认完成
- (void)finishQiangDan:(LxmQiangDanModel *)model {
    LxmSureFinishVC *vc = [LxmSureFinishVC new];
    vc.orderId = model.id;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
