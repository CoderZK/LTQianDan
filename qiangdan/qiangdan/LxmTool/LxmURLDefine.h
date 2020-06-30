//
//  LxmURLDefine.h
//  shenbian
//
//  Created by 李晓满 on 2018/11/12.
//  Copyright © 2018年 李晓满. All rights reserved.
//

#import <Foundation/Foundation.h>

#define ISLOGIN [LxmTool ShareTool].isLogin
#define TOKEN [LxmTool ShareTool].session_token

#define Base_URL @"https://huishou.zftgame.com/collect"

//https://www.czmakj.com/collect/API%E6%96%87%E6%A1%A3.html
@interface LxmURLDefine : NSObject
/**
 上传推送token
 */
#define  umeng_id_up  Base_URL"/app/user/umeng_id_up"

/**
 登录
 */
#define  app_login  Base_URL"/app/login_grab"

/**
 退出登录
 */
#define  app_logout  Base_URL"/app/logout"

/**
 发送验证码
 */
#define  sendCode  Base_URL"/app/sendCode"
/**
 app-忘记密码第一步
 */
#define  app_forgetPassword1  Base_URL"/app/forgetPassword1"
/**
 app-忘记密码
 */
#define  app_forgetPassword  Base_URL"/app/forgetPassword"
/**
 首页一级分类
 */
//#define  first_type_list  Base_URL"/app/first_type_list"
#define  first_type_list  Base_URL"/app/user/get_first_serve_list"

/**
 根据一级分类获取二级分类
 */
//#define  second_type_list  Base_URL"/app/second_type_list"
#define  second_type_list  Base_URL"/app/user/get_second_serve_list"
/**
 商家-抢单大厅
 */
#define  order_hall  Base_URL"/app/user/order_hall"
/**
 商家-待上门订单
 */
#define  order_door  Base_URL"/app/user/order_door"
/**
 商家-抢单
 */
#define  get_order  Base_URL"/app/user/get_order"
/**
 商家-抢单
 */
#define  finish_order  Base_URL"/app/user/finish_order"
/**
 图片上传
 */
#define  fileUpload  Base_URL"/app/fileUpload"

/**
 上传token
 */
#define  umeng_id_up  Base_URL"/app/user/umeng_id_up"
@end

