//
//  AppDelegate.m
//  dqxMonster
//
//  Created by HANSHAOWEN on 16/12/28.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#import "AppDelegate.h"
#import "DMTabBarController.h"
#import "DMMonsterDetailInfo.h"
//Tencent
#import "GDTTrack.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //初始化核心全局数据
    [self initData];
    
    //创建主窗口
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    [_window makeKeyAndVisible];
    
    //设置导航栏的样式
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName : DMNavigationBarTitleTextColor}];
    [[UINavigationBar appearance] setTintColor:DMLightGrayTextColor];
    //[[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setBarTintColor:DMNavigationBarTitleTextColor];
    
    _window.rootViewController = [[DMTabBarController alloc] init];
    
    //开屏广告
    /*
    GDTSplashAd *splash = [[GDTSplashAd alloc] initWithAppkey:@"1105924448" placementId:@"8000810884567461"];
    splash.delegate = self; //设置代理
    //根据iPhone设备不同设置不同背景图
    
    if ([[UIScreen mainScreen] bounds].size.height >= 568.0f) {
        splash.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"LaunchImage-568h"]];
    } else {
        splash.backgroundColor = [UIColor colorWithPatternImage:[UIImage
                                                                 imageNamed:@"LaunchImage"]]; }
     
    splash.fetchDelay = 6; //开发者可以设置开屏拉取时间,超时则放弃展示
    //[可选]拉取并展示全屏开屏广告
    [splash loadAdAndShowInWindow:self.window];
    self.splash = splash;
    */
    
    return YES;
}

//开屏广告
//开屏广告成功展示
-(void)splashAdSuccessPresentScreen:(GDTSplashAd *)splashAd{
    
}
//开屏广告展示失败
-(void)splashAdFailToPresent:(GDTSplashAd *)splashAd withError:(NSError *)error{
    
}
//应用进入后台时回调
- (void)splashAdApplicationWillEnterBackground:(GDTSplashAd *)splashAd{
    
}
//开屏广告点击回调
- (void)splashAdClicked:(GDTSplashAd *)splashAd{
    
}
//开屏广告关闭回调
- (void)splashAdClosed:(GDTSplashAd *)splashAd{
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    [self.splash loadAdAndShowInWindow:self.window];
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    [GDTTrack activateApp];
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)initData{
    _gMonsterInfo = [[NSMutableDictionary alloc] init];
    _gMonsterCategroy = [[NSMutableDictionary alloc] init];
    NSString* sourceInfo = MONSTER_SOURCE_INFO;
    NSArray *monsterInfoStr = [sourceInfo componentsSeparatedByString:@"|日文名="];
    
    for (NSInteger index = 1; index < monsterInfoStr.count; index++)
    {
        DMMonsterDetailInfo *detailInfo = [[DMMonsterDetailInfo alloc] initMine:@""  nameJap:@"" name:@"" density:@"" weakLevel:-1 hp:-1 atk:-1 arm:-1 exp:-1 expJap:-1 gold:-1 weight:-1 fireRes:-1 iceRes:-1 thunderRes:-1 earthRes:-1 windRes:-1 darkRes:-1 lightRes:-1 shuiRes:-1 hunRes:-1 meiRes:-1 maRes:-1 zhongRes:-1 huanRes:-1 fengRes:-1 daRes:-1 shuaiRes:-1 shuRes:-1 kongRes:-1 jiRes:-1 nengRes:-1 naiRes:-1 gongRes:-1 fangRes:-1 xingRes:-1 zhongliangRes:-1 jifeiRes:-1 daduanRes:-1 weightCheck1:-1 weightCheckHalf1:-1 weightCheck2:-1 weightCheckHalf2:-1 weightCheck3:-1 weightCheckHalf3:-1 weightCheck4:-1 weightCheckHalf4:-1 weightCheck5:-1 weightCheckHalf5:-1 dropItem:@"" dropItemRare:@"" skill:@"" desc1:@"" desc2:@""];
        NSArray *tokens = [monsterInfoStr[index] componentsSeparatedByString:@"|"];
        detailInfo.nameJap = tokens[0];
        NSMutableDictionary *pairs = [[NSMutableDictionary alloc] initWithCapacity:64];
        for (NSInteger i = 1; i < tokens.count; i++)
        {
            NSArray *pair = [tokens[i] componentsSeparatedByString:@"="];
            [pairs setObject:pair[1] forKey:pair[0]];
        }
        NSString *right = [[NSString alloc] init];
        
        right = [pairs objectForKey:@"名称"];
        detailInfo.name = (right == nil ? @"" : right);
        right = [pairs objectForKey:@"系别"];
        detailInfo.category = (right == nil ? @"" : right);
        right = [pairs objectForKey:@"出现数量"];
        detailInfo.density = (right == nil ? @"" : right);
        
        right = [pairs objectForKey:@"变弱等级"];
        detailInfo.weakLevel = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"体力"];
        detailInfo.hp = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"攻击力"];
        detailInfo.atk = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"防御力"];
        detailInfo.arm = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"经验"];
        detailInfo.exp = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"日服经验"];
        detailInfo.expJap = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"金币"];
        detailInfo.gold = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"重量"];
        detailInfo.weight = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"火"];
        detailInfo.fireRes = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"冰"];
        detailInfo.iceRes = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"雷"];
        detailInfo.thunderRes = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"土"];
        detailInfo.earthRes = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"风"];
        detailInfo.windRes = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"暗"];
        detailInfo.darkRes = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"光"];
        detailInfo.lightRes = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"睡眠"];
        detailInfo.shuiRes = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"混乱"];
        detailInfo.hunRes = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"魅惑"];
        detailInfo.meiRes = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"麻痹"];
        detailInfo.maRes = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"中毒"];
        detailInfo.zhongRes = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"幻觉"];
        detailInfo.huanRes = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"封印"];
        detailInfo.fengRes = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"大笑"];
        detailInfo.daRes = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"摔倒"];
        detailInfo.shuaiRes = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"束缚"];
        detailInfo.shuRes = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"恐惧"];
        detailInfo.kongRes = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"即死"];
        detailInfo.jiRes = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"能量吸收"];
        detailInfo.nengRes = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"耐性降低"];
        detailInfo.naiRes = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"攻击降低"];
        detailInfo.gongRes = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"防御降低"];
        detailInfo.fangRes = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"行动延长"];
        detailInfo.xingRes = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"重量减少"];
        detailInfo.zhongliangRes = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"击飞"];
        detailInfo.jifeiRes = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"打断"];
        detailInfo.daduanRes = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"重量检查1"];
        detailInfo.weightCheck1 = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"重量检查1（半减）"];
        detailInfo.weightCheckHalf1 = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"重量检查2"];
        detailInfo.weightCheck2 = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"重量检查2（半减）"];
        detailInfo.weightCheckHalf2 = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"重量检查3"];
        detailInfo.weightCheck3 = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"重量检查3（半减）"];
        detailInfo.weightCheckHalf3 = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"重量检查4"];
        detailInfo.weightCheck4 = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"重量检查4（半减）"];
        detailInfo.weightCheckHalf4 = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"重量检查5"];
        detailInfo.weightCheck5 = (right == nil ? -1 : right.intValue);
        right = [pairs objectForKey:@"重量检查5（半减）"];
        detailInfo.weightCheckHalf5 = (right == nil ? -1 : right.intValue);
        
        
        right = [pairs objectForKey:@"普通掉落"];
        detailInfo.dropItem = (right == nil ? @"" : right);
        right = [pairs objectForKey:@"稀有掉落"];
        detailInfo.dropItemRare = (right == nil ? @"" : right);
        right = [pairs objectForKey:@"技能咒文"];
        detailInfo.skill = (right == nil ? @"" : right);
        //right = [pairs objectForKey:@"说明（日文参考）"];
        //detailInfo.des = (right == nil ? @"" : right);
        right = [pairs objectForKey:@"背景1"];
        detailInfo.desc1 = (right == nil ? @"" : right);
        right = [pairs objectForKey:@"背景2"];
        detailInfo.desc2 = (right == nil ? @"" : right);
        
        //怪物详细数据列表
        [_gMonsterInfo setObject:detailInfo forKey:detailInfo.name];
        
        //建立怪物名称索引
        NSMutableArray *monsterSet;
        monsterSet = [_gMonsterCategroy objectForKey:detailInfo.category];
        if (monsterSet == nil)
        {
            monsterSet = [[NSMutableArray alloc] init];
        }
        [monsterSet addObject:detailInfo.name];
        [_gMonsterCategroy setObject:monsterSet forKey:detailInfo.category];
    }
    NSString * spider = @"";
}

@end
