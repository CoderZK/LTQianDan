//
//  LxmUserInfoModel.m
//  vision time
//
//  Created by 李晓满 on 2019/12/12.
//  Copyright © 2019 李晓满. All rights reserved.
//

#import "LxmUserInfoModel.h"

@implementation LxmUserInfoModel

MJCodingImplementation

@end

@implementation LxmBaseModel

@end

//首页一级分类

@implementation LxmHomeFirstTypeModel

@end


@implementation LxmHomeFirstTypeListModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"list" : @"LxmHomeFirstTypeModel"};
}

@end


@implementation LxmHomeFirstTypeRootModel

@end


//抢单大厅model

@implementation LxmQiangDanModel

@synthesize count = _count;
@synthesize cellHeight = _cellHeight;
@synthesize cellHeight0 = _cellHeight0;

- (NSArray<LxmGujiaChoicesDataModel *> *)chooseArr {
    if (_chooseArr.count == 0) {
        NSArray *chooseA = [self.content mj_JSONObject];
        NSMutableArray *tempArr = [NSMutableArray array];
        for (NSDictionary *dict in chooseA) {
            LxmGujiaChoicesDataModel *model = [LxmGujiaChoicesDataModel mj_objectWithKeyValues:dict];
            [tempArr addObject:model];
        }
        _chooseArr = tempArr;
    }
    return _chooseArr;
}

- (NSInteger)count {
    if (_count == 0) {
        for (LxmGujiaChoicesDataModel *m0 in self.chooseArr) {
            _count += m0.choices.count;
        }
    }
    return _count;
}

- (CGFloat)cellHeight {
    if (_cellHeight == 0) {
        _cellHeight = self.count > 4 ? 420 + 30 : (250 + 30 * self.count + 30);
    }
    return _cellHeight;
}

- (CGFloat)cellHeight0 {
    if (_cellHeight0 == 0) {
        _cellHeight0 = self.count > 4 ? 480 : (310 + 30 * self.count);
    }
    return _cellHeight0;
}

@end


@implementation LxmQiangDanListModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"list" : @"LxmQiangDanModel"};
}

@end


@implementation LxmQiangDanRootModel

@end


@implementation LxmGuJiaReasonModel

@end


@implementation LxmGuJiaChoicesModel

@synthesize cellHeight = _cellHeight;

- (CGFloat)cellHeight {
    if (_cellHeight == 0) {
        _cellHeight = [self.choice getSizeWithMaxSize:CGSizeMake(ScreenW - 60, 9999) withFontSize:15].height + 31;
        _cellHeight = _cellHeight > 51 ? _cellHeight : 51;
    }
    return _cellHeight;
}

@end


@implementation LxmGujiaChoicesDataModel

+ (NSDictionary *)mj_objectClassInArray {
    return @{@"choices" : @"LxmGuJiaChoicesModel"};
}

@end


//抢单

@implementation LxmQiangDanGetOrderModel

@end


@implementation LxmQiangDanGetOrderMapModel

@end

@implementation LxmQiangDanGetOrderRootModel

@end
