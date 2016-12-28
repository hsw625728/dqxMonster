//
//  DMMonsterDetailInfo.h
//  dqxMonster
//
//  Created by HANSHAOWEN on 16/12/28.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#ifndef DMMonsterDetailInfo_h
#define DMMonsterDetailInfo_h
/*
 {{怪物图鉴
 |日文名=たけやりへい
 |名称=竹矛兵
 |系别=机械系
 |出现数量=多
 |变弱等级=21
 |体力=112
 |攻击力=61
 |防御力=76
 |经验=-1
 |日服经验=72
 |金币=6
 |重量=176
 |火=4
 |冰=4
 |雷=6
 |土=4
 |风=4
 |暗=6
 |光=4
 |睡眠=4
 |混乱=3
 |魅惑=3
 |麻痹=2
 |中毒=2
 |幻觉=3
 |封印=2
 |大笑=3
 |摔倒=4
 |束缚=4
 |恐惧=2
 |即死=3
 |能量吸收=3
 |耐性降低=3
 |攻击降低=4
 |防御降低=4
 |行动延长=3
 |重量减少=4
 |击飞=5
 |打断=5
 |重量检查1=94
 |重量检查1（半减）=47
 |重量检查2=106
 |重量检查2（半减）=53
 |重量检查3=129
 |重量检查3（半减）=65
 |重量检查4=147
 |重量检查4（半减）=73
 |重量检查5=220
 |重量检查5（半减）=110
 |普通掉落=满月草
 |稀有掉落=近卫兵矛
 |技能咒文=通常攻撃【1体 / ダメージ】[通][怒][押]<br/>おうえん【味方1体 / テンションアップ】[通]
 |说明（日文参考）=竹やりをかまえた謎の兵士。 仲間同士で おうえんしあい 竹林を荒らそうとする者を 必死で くい止めようとする。
 |背景1=挥舞竹矛的神秘士兵。伙伴间会相互声援，拼上性命阻止破坏竹林的人。
 |背景2=竹林是自己的故乡，是灵魂的归所……竹矛兵所有的思念之情都倾注给了竹林。
 }}

 */

//结构体的原始数据请参考上方的注释内容
@interface DMMonsterDetailInfo : NSObject

@property (nonatomic, copy) NSString *nameJap;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *category;
@property (nonatomic, copy) NSString *density;
@property (nonatomic, assign) NSInteger weakLevel;
@property (nonatomic, assign) NSInteger hp;
@property (nonatomic, assign) NSInteger atk;
@property (nonatomic, assign) NSInteger arm;
@property (nonatomic, assign) NSInteger exp;
@property (nonatomic, assign) NSInteger expJap;
@property (nonatomic, assign) NSInteger gold;
@property (nonatomic, assign) NSInteger weight;
@property (nonatomic, assign) NSInteger fireRes;
@property (nonatomic, assign) NSInteger iceRes;
@property (nonatomic, assign) NSInteger thunderRes;
@property (nonatomic, assign) NSInteger earthRes;
@property (nonatomic, assign) NSInteger windRes;
@property (nonatomic, assign) NSInteger darkRes;
@property (nonatomic, assign) NSInteger lightRes;
@property (nonatomic, assign) NSInteger shuiRes;
@property (nonatomic, assign) NSInteger hunRes;
@property (nonatomic, assign) NSInteger meiRes;
@property (nonatomic, assign) NSInteger maRes;
@property (nonatomic, assign) NSInteger zhongRes;
@property (nonatomic, assign) NSInteger huanRes;
@property (nonatomic, assign) NSInteger fengRes;
@property (nonatomic, assign) NSInteger daRes;
@property (nonatomic, assign) NSInteger shuaiRes;
@property (nonatomic, assign) NSInteger shuRes;
@property (nonatomic, assign) NSInteger kongRes;
@property (nonatomic, assign) NSInteger jiRes;
@property (nonatomic, assign) NSInteger nengRes;
@property (nonatomic, assign) NSInteger naiRes;
@property (nonatomic, assign) NSInteger gongRes;
@property (nonatomic, assign) NSInteger fangRes;
@property (nonatomic, assign) NSInteger xingRes;
@property (nonatomic, assign) NSInteger zhongliangRes;
@property (nonatomic, assign) NSInteger jifeiRes;
@property (nonatomic, assign) NSInteger daduanRes;
@property (nonatomic, assign) NSInteger weightCheck1;
@property (nonatomic, assign) NSInteger weightCheckHalf1;
@property (nonatomic, assign) NSInteger weightCheck2;
@property (nonatomic, assign) NSInteger weightCheckHalf2;
@property (nonatomic, assign) NSInteger weightCheck3;
@property (nonatomic, assign) NSInteger weightCheckHalf3;
@property (nonatomic, assign) NSInteger weightCheck4;
@property (nonatomic, assign) NSInteger weightCheckHalf4;
@property (nonatomic, assign) NSInteger weightCheck5;
@property (nonatomic, assign) NSInteger weightCheckHalf5;
@property (nonatomic, copy) NSString *dropItem;
@property (nonatomic, copy) NSString *dropItemRare;
@property (nonatomic, copy) NSString *skill;
@property (nonatomic, copy) NSString *desc1;
@property (nonatomic, copy) NSString *desc2;

-(DMMonsterDetailInfo*)initMine:(NSString*)s1 nameJap:(NSString*)s2 name:(NSString*)s3 density:(NSString*)s4 weakLevel:(NSInteger)i1 hp:(NSInteger)i2 atk:(NSInteger)i3 arm:(NSInteger)i4 exp:(NSInteger)i5 expJap:(NSInteger)i6 gold:(NSInteger)i7 weight:(NSInteger)i8 fireRes:(NSInteger)i9 iceRes:(NSInteger)i10 thunderRes:(NSInteger)i11 earthRes:(NSInteger)i12 windRes:(NSInteger)i13 darkRes:(NSInteger)i14 lightRes:(NSInteger)i15 shuiRes:(NSInteger)i16 hunRes:(NSInteger)i17 meiRes:(NSInteger)i18 maRes:(NSInteger)i19 zhongRes:(NSInteger)i20 huanRes:(NSInteger)i21 fengRes:(NSInteger)i22 daRes:(NSInteger)i23 shuaiRes:(NSInteger)i24 shuRes:(NSInteger)i25 kongRes:(NSInteger)i26 jiRes:(NSInteger)i27 nengRes:(NSInteger)i28 naiRes:(NSInteger)i29 gongRes:(NSInteger)i30 fangRes:(NSInteger)i31 xingRes:(NSInteger)i32 zhongliangRes:(NSInteger)i33 jifeiRes:(NSInteger)i34 daduanRes:(NSInteger)i35 weightCheck1:(NSInteger)i36 weightCheckHalf1:(NSInteger)i37 weightCheck2:(NSInteger)i38 weightCheckHalf2:(NSInteger)i39 weightCheck3:(NSInteger)i40 weightCheckHalf3:(NSInteger)i41 weightCheck4:(NSInteger)i42 weightCheckHalf4:(NSInteger)i43 weightCheck5:(NSInteger)i44 weightCheckHalf5:(NSInteger)i45 dropItem:(NSString*)s5 dropItemRare:(NSString*)s6 skill:(NSString*)s7 desc1:(NSString*)s8 desc2:(NSString*)s9;


@end

#endif /* DMMonsterDetailInfo_h */
