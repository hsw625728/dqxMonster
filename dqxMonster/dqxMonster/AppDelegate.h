//
//  AppDelegate.h
//  dqxMonster
//
//  Created by HANSHAOWEN on 16/12/28.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GDTSplashAd.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,GDTSplashAdDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) GDTSplashAd *splash;
@property (nonatomic, copy) NSMutableDictionary *gMonsterInfo;
@property (nonatomic, copy) NSMutableDictionary *gMonsterCategroy;


@end

