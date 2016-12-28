//
//  DMMonsterDetailInfo.m
//  dqxMonster
//
//  Created by HANSHAOWEN on 16/12/28.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMMonsterDetailInfo.h"
@implementation DMMonsterDetailInfo

-(DMMonsterDetailInfo*)initMine:(NSString*)s1 nameJap:(NSString*)s2 name:(NSString*)s3 density:(NSString*)s4 weakLevel:(NSInteger)i1 hp:(NSInteger)i2 atk:(NSInteger)i3 arm:(NSInteger)i4 exp:(NSInteger)i5 expJap:(NSInteger)i6 gold:(NSInteger)i7 weight:(NSInteger)i8 fireRes:(NSInteger)i9 iceRes:(NSInteger)i10 thunderRes:(NSInteger)i11 earthRes:(NSInteger)i12 windRes:(NSInteger)i13 darkRes:(NSInteger)i14 lightRes:(NSInteger)i15 shuiRes:(NSInteger)i16 hunRes:(NSInteger)i17 meiRes:(NSInteger)i18 maRes:(NSInteger)i19 zhongRes:(NSInteger)i20 huanRes:(NSInteger)i21 fengRes:(NSInteger)i22 daRes:(NSInteger)i23 shuaiRes:(NSInteger)i24 shuRes:(NSInteger)i25 kongRes:(NSInteger)i26 jiRes:(NSInteger)i27 nengRes:(NSInteger)i28 naiRes:(NSInteger)i29 gongRes:(NSInteger)i30 fangRes:(NSInteger)i31 xingRes:(NSInteger)i32 zhongliangRes:(NSInteger)i33 jifeiRes:(NSInteger)i34 daduanRes:(NSInteger)i35 weightCheck1:(NSInteger)i36 weightCheckHalf1:(NSInteger)i37 weightCheck2:(NSInteger)i38 weightCheckHalf2:(NSInteger)i39 weightCheck3:(NSInteger)i40 weightCheckHalf3:(NSInteger)i41 weightCheck4:(NSInteger)i42 weightCheckHalf4:(NSInteger)i43 weightCheck5:(NSInteger)i44 weightCheckHalf5:(NSInteger)i45 dropItem:(NSString*)s5 dropItemRare:(NSString*)s6 skill:(NSString*)s7 desc1:(NSString*)s8 desc2:(NSString*)s9;{
    self =[super init];
    self.nameJap = s1;
    self.name = s2;
    self.category = s3;
    self.density = s4;
    self.weakLevel = i1;
    self.hp = i2;
    self.atk = i3;
    self.arm = i4;
    self.exp = i5;
    self.expJap = i6;
    self.gold = i7;
    self.weight = i8;
    self.fireRes = i9;
    self.iceRes = i10;
    self.thunderRes = i11;
    self.earthRes = i12;
    self.windRes = i13;
    self.darkRes = i14;
    self.lightRes = i15;
    self.shuiRes = i16;
    self.hunRes = i17;
    self.meiRes = i18;
    self.maRes = i19;
    self.zhongRes = i20;
    self.huanRes = i21;
    self.fengRes = i22;
    self.daRes = i23;
    self.shuaiRes = i24;
    self.shuRes = i25;
    self.kongRes = i26;
    self.jiRes = i27;
    self.nengRes = i28;
    self.naiRes = i29;
    self.gongRes = i30;
    self.fangRes = i31;
    self.xingRes = i32;
    self.zhongliangRes = i33;
    self.jifeiRes = i34;
    self.daduanRes = i35;
    self.weightCheck1 = i36;
    self.weightCheckHalf1 = i37;
    self.weightCheck2 = i38;
    self.weightCheckHalf2 = i39;
    self.weightCheck3 = i40;
    self.weightCheckHalf3 = i41;
    self.weightCheck4 = i42;
    self.weightCheckHalf4 = i43;
    self.weightCheck5 = i44;
    self.weightCheckHalf5 = i45;
    self.dropItem = s5;
    self.dropItemRare = s6;
    self.skill = s7;
    self.desc1 = s8;
    self.desc2 = s9;
    
    return self;
}

@end
