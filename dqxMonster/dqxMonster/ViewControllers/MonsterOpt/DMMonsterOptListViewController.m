//
//  DMMonsterOptListViewController.m
//  dqxMonster
//
//  Created by SHAOWENn HAN on 17/1/2.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMMonsterOptListViewController.h"
#import "DMTableMonsterListCell.h"
#import "View+MASAdditions.h"
#import "DMMonsterDetailViewController.h"
#import "DMMonsterDetailInfo.h"
//Tencent
#import "GDTMobBannerView.h" //导入GDTMobBannerView.h头文件

@interface DMMonsterOptListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
//Tencent
@property (strong, nonatomic) GDTMobBannerView *bannerView;//声明一个GDTMobBannerView的实例

@end

@implementation DMMonsterOptListViewController{
    NSMutableArray *dataSource;
}

#pragma mark - Lifecycle

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initDatas];
    [self setupViews];
    
    //Tencent 5 号广告位
    /*
    _bannerView = [[GDTMobBannerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - GDTMOB_AD_SUGGEST_SIZE_320x50.height, self.view.frame.size.width, GDTMOB_AD_SUGGEST_SIZE_320x50.height) appkey:@"1105924448" placementId:@"5010711871382098"];
    _bannerView.delegate = self; // 设置Delegate
    _bannerView.currentViewController = self; //设置当前的ViewController
    _bannerView.interval = 30; //【可选】设置广告轮播时间;范围为30~120秒,0表示不轮 播
    _bannerView.isGpsOn = NO; //【可选】开启GPS定位;默认关闭
    _bannerView.showCloseBtn = NO; //【可选】展示关闭按钮;默认显示
    _bannerView.isAnimationOn = YES; //【可选】开启banner轮播和展现时的动画效果; 默认开启
    [self.view addSubview:_bannerView]; //添加到当前的view中
    [_bannerView loadAdAndShow];
    [_bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(self.view.frame.size.width));
        make.height.equalTo(@50);
        make.bottom.left.equalTo(self.view);
    }];
     */
}
// 请求广告条数据成功后调用
- (void)bannerViewDidReceived{
    
    NSString *str = @"";
}
// 请求广告条数据失败后调用
- (void)bannerViewFailToReceived:(NSError *)error{
    
    NSError *temp = error;
    NSString *str = temp.domain;
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

#pragma mark - Private Method

- (void)initDatas {
    
}

- (void)setupViews {
    _tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        tableView.backgroundColor = [UIColor whiteColor];
        tableView.dataSource = self;
        tableView.delegate = self;
        [tableView registerClass:[DMTableMonsterListCell class] forCellReuseIdentifier:kDMTableMonsterListCellID];
        tableView.tableFooterView = [UIView new];
        //tableView.emptyDataSetSource = self;
        [self.view addSubview:tableView];
        
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.view);
            make.left.bottom.right.equalTo(self.view);
        }];
        
        tableView;
    });
    
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:kDMTableMonsterListCellID forIndexPath:indexPath];
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [DMTableMonsterListCell cellHeight];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [(DMTableMonsterListCell *)cell setMonsterName:dataSource[indexPath.row]];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DMMonsterDetailViewController *detailController = [[DMMonsterDetailViewController alloc] init];
    [detailController setMonsterName:dataSource[indexPath.row]];
    [self.navigationController pushViewController:detailController animated:YES];
    
    /*
     NSMutableArray *history;
     NSString *docPath =  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
     NSString *path = [docPath stringByAppendingPathComponent:@"RecipeHistory"];
     
     history = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
     if (ISNULL(history))
     history = [[NSMutableArray alloc] init];
     
     [history addObject:dataSource[indexPath.row]];
     if (history.count > 60)
     [history removeObjectAtIndex:0];
     
     [NSKeyedArchiver archiveRootObject:history toFile:path];
     */
}

-(void)setSelectValue:(NSString*)emin expMax:(NSString*)emax goldMin:(NSString*)gmin goldMax:(NSString*)gmax weakMin:(NSString*)wmin weakMax:(NSString*)wmax resType1:(NSString*)rt1 resValue1:(NSString*)rv1 resType2:(NSString*)rt2 resValue2:(NSString*)rv2 resType3:(NSString*)rt3 resValue3:(NSString*)rv3{
    [dataSource removeAllObjects];
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    dataSource = [[NSMutableArray alloc] init];
    NSArray *keys = [delegate.gMonsterInfo allKeys];
    for (NSString *key in keys)
    {
        DMMonsterDetailInfo *info = [delegate.gMonsterInfo objectForKey:key];
        Boolean select = TRUE;
        if ([emax isEqualToString:@"不设定"]){
            select = TRUE;
        }
        else if(info.expJap < emin.integerValue || info.expJap > emax.integerValue){
            select = FALSE;
            continue;
        }
        
        if ([gmax isEqualToString:@"不设定"]){
            select = TRUE;
        }
        else if (select && (info.gold < gmin.integerValue || info.gold > gmax.integerValue)){
            select = FALSE;
            continue;
        }
        
        if ([wmax isEqualToString:@"不设定"]){
            select = TRUE;
        }
        else if (select && (info.weakLevel < wmin.integerValue || info.weakLevel > wmax.integerValue)){
            select = FALSE;
            continue;
        }
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        [dic setValue:[NSString stringWithFormat:@"%i", (int)info.fireRes] forKey:@"火"];
        [dic setValue:[NSString stringWithFormat:@"%i", (int)info.iceRes] forKey:@"冰"];
        [dic setValue:[NSString stringWithFormat:@"%i", (int)info.thunderRes] forKey:@"雷"];
        [dic setValue:[NSString stringWithFormat:@"%i", (int)info.earthRes] forKey:@"土"];
        [dic setValue:[NSString stringWithFormat:@"%i", (int)info.windRes] forKey:@"风"];
        [dic setValue:[NSString stringWithFormat:@"%i", (int)info.darkRes] forKey:@"暗"];
        [dic setValue:[NSString stringWithFormat:@"%i", (int)info.lightRes] forKey:@"光"];
        [dic setValue:[NSString stringWithFormat:@"%i", (int)info.shuiRes] forKey:@"睡眠"];
        [dic setValue:[NSString stringWithFormat:@"%i", (int)info.hunRes] forKey:@"混乱"];
        [dic setValue:[NSString stringWithFormat:@"%i", (int)info.meiRes] forKey:@"魅惑"];
        [dic setValue:[NSString stringWithFormat:@"%i", (int)info.maRes] forKey:@"麻痹"];
        [dic setValue:[NSString stringWithFormat:@"%i", (int)info.zhongRes] forKey:@"中毒"];
        [dic setValue:[NSString stringWithFormat:@"%i", (int)info.huanRes] forKey:@"幻觉"];
        [dic setValue:[NSString stringWithFormat:@"%i", (int)info.fengRes] forKey:@"封印"];
        [dic setValue:[NSString stringWithFormat:@"%i", (int)info.daRes] forKey:@"大笑"];
        [dic setValue:[NSString stringWithFormat:@"%i", (int)info.shuaiRes] forKey:@"摔倒"];
        [dic setValue:[NSString stringWithFormat:@"%i", (int)info.shuRes] forKey:@"束缚"];
        [dic setValue:[NSString stringWithFormat:@"%i", (int)info.kongRes] forKey:@"恐惧"];
        [dic setValue:[NSString stringWithFormat:@"%i", (int)info.jiRes] forKey:@"即死"];
        [dic setValue:[NSString stringWithFormat:@"%i", (int)info.nengRes] forKey:@"能量吸收"];
        [dic setValue:[NSString stringWithFormat:@"%i", (int)info.naiRes] forKey:@"耐性降低"];
        [dic setValue:[NSString stringWithFormat:@"%i", (int)info.gongRes] forKey:@"攻击降低"];
        [dic setValue:[NSString stringWithFormat:@"%i", (int)info.fangRes] forKey:@"防御降低"];
        [dic setValue:[NSString stringWithFormat:@"%i", (int)info.xingRes] forKey:@"行动延长"];
        [dic setValue:[NSString stringWithFormat:@"%i", (int)info.zhongliangRes] forKey:@"重量减少"];
        [dic setValue:[NSString stringWithFormat:@"%i", (int)info.jifeiRes] forKey:@"击飞"];
        [dic setValue:[NSString stringWithFormat:@"%i", (int)info.daduanRes] forKey:@"打断"];
        
        NSMutableDictionary *dicRes = [[NSMutableDictionary alloc] init];
        [dicRes setValue:@"2" forKey:@"免疫"];
        [dicRes setValue:@"3" forKey:@"抵抗"];
        [dicRes setValue:@"4" forKey:@"普通"];
        [dicRes setValue:@"5" forKey:@"易中"];
        [dicRes setValue:@"6" forKey:@"有效"];
        [dicRes setValue:@"7" forKey:@"极效"];
        if ([rt1 isEqualToString:@"不设定"]){
            select = TRUE;
        }
        else if(select && (((NSString*)dic[rt1]).intValue < ((NSString*)dicRes[rv1]).intValue)){
            select = FALSE;
            continue;
        }
        
        if ([rt2 isEqualToString:@"不设定"]){
            select = TRUE;
        }
        else if(select && (((NSString*)dic[rt2]).intValue < ((NSString*)dicRes[rv2]).intValue)){
            select = FALSE;
            continue;
        }
        
        if ([rt3 isEqualToString:@"不设定"]){
            select = TRUE;
        }
        else if(select && (((NSString*)dic[rt3]).intValue < ((NSString*)dicRes[rv3]).intValue)){
            select = FALSE;
            continue;
        }
        if (select)
        {
            [dataSource addObject:key];
        }
    }
    
    [_tableView reloadData];
}
@end
