//
//  AppDelegate.m
//  qiangdan
//
//  Created by 李晓满 on 2020/3/20.
//  Copyright © 2020 李晓满. All rights reserved.
//

#import "AppDelegate.h"
#import "LxmLoginVC.h"
#import "LxmQiangDanListVC.h"
#import "LYGuideViewController.h"
#import "LxmPushModel.h"
#import "LxmWebViewController.h"

#import <UMPush/UMessage.h>
#import <UMCommon/UMCommon.h>

#import <UserNotifications/UserNotifications.h>
//https://lanhuapp.com/url/YR5KS-b3iNv   电商
//https://lanhuapp.com/url/KCZf4-VpZB9   回收
//https://www.czmakj.com/collect/API%E6%96%87%E6%A1%A3.html
//抢单端账户 15681670112 123456

#define UMKey @"5eb38828895cca7b7f0002bd"
#define UMSecert @"5xhokrqy5j7oeel93zmcgjkvdthlomik"


@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    //    if (SESSION_TOKEN && ISLOGIN) {
    //        self.window.rootViewController = [[BaseNavigationController alloc] initWithRootViewController:[LxmQiangDanListVC new]];
    //    } else {
    //        self.window.rootViewController = [[BaseNavigationController alloc] initWithRootViewController:[LxmLoginVC new]];
    //    }
    self.window.rootViewController = [self instantiateRootVC];
 

    [self initPush];
    [self initUMeng:launchOptions];
    
    [self.window makeKeyAndVisible];
    return YES;
}

-(void)initPush
{
    //1.向系统申请推送
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
#ifdef __IPHONE_8_0
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        
        UIUserNotificationSettings *uns = [UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound) categories:nil];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        [[UIApplication sharedApplication] registerUserNotificationSettings:uns];
    }
    else
    {
        UIRemoteNotificationType apn_type = (UIRemoteNotificationType)(UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeSound|UIRemoteNotificationTypeBadge);
        [[UIApplication sharedApplication] registerForRemoteNotificationTypes:apn_type];
    }
#else
    UIRemoteNotificationType apn_type = (UIRemoteNotificationType)(UIRemoteNotificationTypeAlert|UIRemoteNotificationTypeSound|UIRemoteNotificationTypeBadge);
    [[UIApplication sharedApplication] registerForRemoteNotificationTypes:apn_type];
#endif
    
}


-(void)initUMeng:(NSDictionary *)launchOptions
{
    [UMConfigure initWithAppkey:UMKey channel:@"App Store"];
    // Push组件基本功能配置
    UMessageRegisterEntity * entity = [[UMessageRegisterEntity alloc] init];
    //type是对推送的几个参数的选择，可以选择一个或者多个。默认是三个全部打开，即：声音，弹窗，角标
    entity.types = UMessageAuthorizationOptionBadge|UMessageAuthorizationOptionSound|UMessageAuthorizationOptionAlert;
    if (@available(iOS 10.0, *)) {
        [UNUserNotificationCenter currentNotificationCenter].delegate=self;
        
    } else {
        // Fallback on earlier versions
    }
    [UMessage registerForRemoteNotificationsWithLaunchOptions:launchOptions Entity:entity     completionHandler:^(BOOL granted, NSError * _Nullable error) {
        
        
        if (error) {
            NSLog(@"error===%@",error.description);
        }
        
        if (granted) {
            
        }else{
        }
    }];
    
}


//设置根视图控制器
- (UIViewController *)instantiateRootVC{
    
    //    //没有引导页
    //    TabBarController *BarVC=[[TabBarController alloc] init];
    //    return BarVC;
    
    
    
    //获取app运行的版本号
    NSString *currentVersion =[[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
    //取出本地缓存的版本号
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *localVersion = [defaults objectForKey:@"appversion"];
    if ([currentVersion isEqualToString:localVersion]) {
        if (SESSION_TOKEN && ISLOGIN) {
            return  [[BaseNavigationController alloc] initWithRootViewController:[LxmQiangDanListVC new]];
        } else {
            return  [[BaseNavigationController alloc] initWithRootViewController:[LxmLoginVC new]];
        }
        
        //        TabBarController * tabVc = [[TabBarController alloc] init];
        //        return tabVc;
        
    }else{
        LYGuideViewController *guideVc = [[LYGuideViewController alloc] init];
        return guideVc;
    }
}

//跳转主页
- (void)showHomeVC{
    
    if (SESSION_TOKEN && ISLOGIN) {
        self.window.rootViewController =  [[BaseNavigationController alloc] initWithRootViewController:[LxmQiangDanListVC new]];
    } else {
        self.window.rootViewController =   [[BaseNavigationController alloc] initWithRootViewController:[LxmLoginVC new]];
    }
    //更新本地储存的版本号
    NSString *currentVersion = [[NSBundle mainBundle] objectForInfoDictionaryKey:(NSString *)kCFBundleVersionKey];
    [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:@"appversion"];
    //同步到物理文件存储
    [[NSUserDefaults standardUserDefaults] synchronize];
}




- (BOOL)initLocationPush:(UIApplication *)application finishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeAlert|UIUserNotificationTypeBadge|UIUserNotificationTypeSound categories:nil];
    [application registerUserNotificationSettings:setting];
    if (launchOptions[UIApplicationLaunchOptionsLocalNotificationKey]) {
        // 这里添加处理代码
    }
    return YES;
}





//在用户接受推送通知后系统会调用
-(void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken
{
    
    //    self.pushToken = deviceToken;
    //    if (![LxmTool ShareTool].isClosePush)
    //    {
    [UMessage registerDeviceToken:deviceToken];
    NSString * token = @"";
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 13) {
        if (![deviceToken isKindOfClass:[NSData class]]) {
            //记录获取token失败的描述
            return;
        }
        const unsigned *tokenBytes = (const unsigned *)[deviceToken bytes];
        token = [NSString stringWithFormat:@"%08x%08x%08x%08x%08x%08x%08x%08x",
                 ntohl(tokenBytes[0]), ntohl(tokenBytes[1]), ntohl(tokenBytes[2]),
                 ntohl(tokenBytes[3]), ntohl(tokenBytes[4]), ntohl(tokenBytes[5]),
                 ntohl(tokenBytes[6]), ntohl(tokenBytes[7])];
        NSLog(@"deviceToken1:%@", token);
    } else {
        token = [NSString
                 stringWithFormat:@"%@",deviceToken];
        token = [token stringByReplacingOccurrencesOfString:@"<" withString:@""];
        token = [token stringByReplacingOccurrencesOfString:@">" withString:@""];
        token = [token stringByReplacingOccurrencesOfString:@" " withString:@""];
        
    }
    //将deviceToken给后台
    NSLog(@"send_token:%@",token);
    [LxmTool ShareTool].deviceToken = token;
    [[LxmTool ShareTool] uploadDeviceToken];

 
    
}


//iOS10以下使用这两个方法接收通知
-(void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler
{
    [UMessage setAutoAlert:NO];
    if([[[UIDevice currentDevice] systemVersion]intValue] < 10){
        [UMessage didReceiveRemoteNotification:userInfo];
    }
    //过滤掉Push的撤销功能，因为PushSDK内部已经调用的completionHandler(UIBackgroundFetchResultNewData)，
    //防止两次调用completionHandler引起崩溃
    if(![userInfo valueForKeyPath:@"aps.recall"])
    {
        completionHandler(UIBackgroundFetchResultNewData);
    }
}
//iOS10新增：处理前台收到通知的代理方法
-(void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions))completionHandler{
    NSDictionary * userInfo = notification.request.content.userInfo;
    if([notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
        [UMessage setAutoAlert:NO];
        //应用处于前台时的远程推送接受
        //必须加这句代码
        [UMessage didReceiveRemoteNotification:userInfo];
    }else{
        //应用处于前台时的本地推送接受
    }
    completionHandler(UNNotificationPresentationOptionSound|UNNotificationPresentationOptionBadge|UNNotificationPresentationOptionAlert);
}
//iOS10新增：处理后台点击通知的代理方法
-(void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)())completionHandler{
    NSDictionary * userInfo = response.notification.request.content.userInfo;
    NSLog(@"===\n3===%@",userInfo);
    if (@available(iOS 10.0, *)) {
        if([response.notification.request.trigger isKindOfClass:[UNPushNotificationTrigger class]]) {
            [UMessage didReceiveRemoteNotification:userInfo];
            [UMessage setAutoAlert:NO];
            //应用处于前台时的远程推送接受
            //必须加这句代码
            [UMessage didReceiveRemoteNotification:userInfo];
            
            
            LxmPushModel *model = [LxmPushModel mj_objectWithKeyValues:userInfo];
//            // 1-系统通知(infoUrl有值时跳转)，6  -充值失败(跳转充值结果页面)
            BaseNavigationController * nav  = (BaseNavigationController *)self.window.rootViewController;
            [self pageTo:model nav:nav];
            
        }else{
            //应用处于前台时的本地推送接受
            LxmPushModel *model = [LxmPushModel mj_objectWithKeyValues:userInfo];
//            // 1-系统通知(infoUrl有值时跳转)，6  -充值失败(跳转充值结果页面)
            BaseNavigationController * nav  = (BaseNavigationController *)self.window.rootViewController;
            [self pageTo:model nav:nav];
        }
    } else {
        // Fallback on earlier versions
    }
    if (@available(iOS 10.0, *)) {
        completionHandler(UNNotificationPresentationOptionSound|UNNotificationPresentationOptionBadge|UNNotificationPresentationOptionAlert);
    } else {
        // Fallback on earlier versions
    }
    
    
    
}



//10一下的系统
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo{
    [UMessage didReceiveRemoteNotification:userInfo];
    
    NSLog(@"===\n1===%@",userInfo);

    if (![LxmTool ShareTool].isLogin) {
        [SVProgressHUD showErrorWithStatus:@"您目前处于离线状态"];
        return;
    }
        LxmPushModel *model = [LxmPushModel mj_objectWithKeyValues:userInfo];
    //            // 1-系统通知(infoUrl有值时跳转)，6  -充值失败(跳转充值结果页面)
                BaseNavigationController * nav  = (BaseNavigationController *)self.window.rootViewController;
                [self pageTo:model nav:nav];
}

- (void)pageTo:(LxmPushModel *)model nav:(BaseNavigationController *)nav {
    
    if (model.infoType.intValue == 1) {
        if (model.infoUrl.isValid) {
            LxmWebViewController *vc = [[LxmWebViewController alloc] init];
            vc.navigationItem.title = @"系统消息";
            vc.loadUrl = [NSURL URLWithString:model.infoUrl];
            vc.hidesBottomBarWhenPushed = YES;
            [nav pushViewController:vc animated:YES];
        }
    }else if (model.infoType.intValue == 6) {
        self.window.rootViewController =  [[BaseNavigationController alloc] initWithRootViewController:[LxmQiangDanListVC new]];
    }
    
//    switch (model.infoType.intValue) {
//        case 1: {//系统消息
//            if (model.infoUrl.isValid) {
//                LxmWebViewController *vc = [[LxmWebViewController alloc] init];
//                vc.navigationItem.title = @"系统消息";
//                vc.loadUrl = [NSURL URLWithString:model.infoUrl];
//                [nav pushViewController:vc animated:YES];
//            }
//        }
//            break;
//        case 2: {//2-代理变动
//
//            LxmOrderDetailVC *vc = [[LxmOrderDetailVC alloc] initWithTableViewStyle:UITableViewStyleGrouped];
//            vc.orderId = model.infoId;
//            [nav pushViewController:vc animated:YES];
//
//        }
//            break;
//        case 3: {//3-钱包消息
//
//        }
//            break;
//        case 4: {//6-投诉消息
//            HSPayTwoVC *vc = [[HSPayTwoVC alloc] init];
//            vc.type = 1;
//            [nav pushViewController:vc animated:YES];
//
//        }
//            break;
//        case 5: {//7-素材消息
//            HSPayTwoVC *vc = [[HSPayTwoVC alloc] init];
//            vc.type = 3;
//            [nav pushViewController:vc animated:YES];
//        }
//            break;
//
//        default:
//            break;
//    }
}



@end
