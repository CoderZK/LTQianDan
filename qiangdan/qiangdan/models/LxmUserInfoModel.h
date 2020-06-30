//
//  LxmUserInfoModel.h
//  vision time
//
//  Created by 李晓满 on 2019/12/12.
//  Copyright © 2019 李晓满. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LxmUserInfoModel : NSObject<NSCoding>

@property (nonatomic, strong) NSString *money;

@property (nonatomic, strong) NSString *telephone;

@property (nonatomic, strong) NSString *serve;

@property (nonatomic, strong) NSString *username;

@end

@interface LxmBaseModel : NSObject

@property (nonatomic, strong) NSString *key;/**总页数*/

@property (nonatomic, strong) NSString *message;/**总数*/

@property (nonatomic, strong) NSString *result;/**结果*/

@end


//首页一级分类

@interface LxmHomeFirstTypeModel : NSObject

@property (nonatomic, strong) NSString *type_pic;//分类图片

@property (nonatomic, strong) NSString *category_name;//分类名称

@property (nonatomic, strong) NSString *id;//分类ID

@end


@interface LxmHomeFirstTypeListModel : NSObject

@property (nonatomic, strong) NSString *allPageNumber;

@property (nonatomic, strong) NSString *count;

@property (nonatomic, strong) NSArray  <LxmHomeFirstTypeModel *>*list;/*所有分类*/

@end


@interface LxmHomeFirstTypeRootModel : NSObject

@property (nonatomic, strong) NSString *key;

@property (nonatomic, strong) NSString *message;

@property (nonatomic, strong) LxmHomeFirstTypeListModel *result;

@end

//抢单大厅model

@interface LxmGuJiaReasonModel : NSObject

@property (nonatomic, strong) NSString *pics;/**图片*/

@property (nonatomic, strong) NSString *text;/**理由*/

@end


@interface LxmGuJiaChoicesModel : NSObject

@property (nonatomic, strong) NSString *choice;/**选项*/

@property (nonatomic, strong) NSString *price;/**价格*/

@property (nonatomic, strong) LxmGuJiaReasonModel *reason;/**理由*/

@property (nonatomic, assign) BOOL isSelected;

@property (nonatomic, assign) CGFloat cellHeight;

@end


@interface LxmGujiaChoicesDataModel : NSObject

@property (nonatomic, assign) BOOL isSelect;//改区域是否被选择

@property (nonatomic, strong) NSString *question;/**使用情况"*/

@property (nonatomic, strong) NSString *type;/**1-单选 2-多选*/

@property (nonatomic, strong) LxmGuJiaReasonModel *reason;

@property (nonatomic, strong) NSArray <LxmGuJiaChoicesModel *> *choices;

@end



@interface LxmQiangDanModel : NSObject

@property (nonatomic, strong) NSString *main_pic;/**商品图片*/

@property (nonatomic, strong) NSString *create_time;/**din*/

@property (nonatomic, strong) NSString *meet_date;/**预约时间*/

@property (nonatomic, strong) NSString *meet_start_time;/**预约开始时间*/

@property (nonatomic, strong) NSString *meet_end_time;/**预约结束时间*/

@property (nonatomic, strong) NSString *type;/**1-上门订单 2-快递订单*/

@property (nonatomic, strong) NSString *content;/***/

@property (nonatomic, strong) NSArray <LxmGujiaChoicesDataModel *>*chooseArr;//可选择数组

@property (nonatomic, assign) NSInteger count;//可选数组总选项数

@property (nonatomic, assign) CGFloat cellHeight;//cell高度

@property (nonatomic, assign) CGFloat cellHeight0;//cell高度

@property (nonatomic, strong) NSString *address_detail;/***/

@property (nonatomic, strong) NSString *province;/***/

@property (nonatomic, strong) NSString *city;/***/

@property (nonatomic, strong) NSString *id;/***/

@property (nonatomic, strong) NSString *good_name;/**商品名称*/

@property (nonatomic, strong) NSString *door_status;/**商品名称*/

@property (nonatomic, strong) NSString *about_price;/**上门订单状态*/

@property (nonatomic, strong) NSString *link_name;/**联系人*/

@property (nonatomic, strong) NSString *link_tel;/**联系电话*/

@end


@interface LxmQiangDanListModel : NSObject

@property (nonatomic, strong) NSString *allPageNumber;

@property (nonatomic, strong) NSString *count;

@property (nonatomic, strong) NSArray  <LxmQiangDanModel *>*list;/* 物流列表 */

@end


@interface LxmQiangDanRootModel : NSObject

@property (nonatomic, strong) NSString *key;/**总页数*/

@property (nonatomic, strong) NSString *message;/**总数*/

@property (nonatomic, strong) LxmQiangDanListModel *result;/**结果*/

@end


//抢单

@interface LxmQiangDanGetOrderModel : NSObject

@property (nonatomic, strong) NSString *address_detail;/***/

@property (nonatomic, strong) NSString *province;/***/

@property (nonatomic, strong) NSString *city;/***/

@property (nonatomic, strong) NSString *link_tel;/**联系电话*/

@property (nonatomic, strong) NSString *meet_date;/**预约时间*/

@property (nonatomic, strong) NSString *meet_start_time;/**预约开始时间*/

@property (nonatomic, strong) NSString *meet_end_time;/**预约结束时间*/

@property (nonatomic, strong) NSString *link_name;/**联系人*/

@end


@interface LxmQiangDanGetOrderMapModel : NSObject

@property (nonatomic, strong) LxmQiangDanGetOrderModel *map;/***/

@end

@interface LxmQiangDanGetOrderRootModel : NSObject

@property (nonatomic, strong) NSString *key;/**总页数*/

@property (nonatomic, strong) NSString *message;/**总数*/

@property (nonatomic, strong) LxmQiangDanGetOrderMapModel *result;/**结果*/

@end
