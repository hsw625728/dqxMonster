//
//  DRCategoriesViewController.m
//  dqxRecipe
//
//  Created by HANSHAOWEN on 16/11/23.
//  Copyright © 2016年 mengyoutu.cn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMMonsterListViewController.h"
#import "View+MASAdditions.h"
#import "UIImage+Common.h"
#import "DMMonsterDetailInfo.h"
#import "DMTableMonsterListCell.h"
#import "DMTableHeaderView.h"
#import "DMMonsterDetailViewController.h"
//Tencent
#import "GDTMobBannerView.h" //导入GDTMobBannerView.h头文件

@interface DMMonsterListViewController() <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
//@property (strong, nonatomic) GADBannerView  *bannerView;
//Tencent
@property (strong, nonatomic) GDTMobBannerView *bannerView;//声明一个GDTMobBannerView的实例

@end

@implementation DMMonsterListViewController{
    AppDelegate *appDelegate;
}

#pragma mark - Lifecycle

- (void)dealloc {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - View Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = DMMonsterList;
    
    [self addNavigationBarLeftSearchItem];
    [self setupViews];
    
    //设置导航栏
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    [self initDatas];
    [self setupViews];
    
    //Tencent 4 号广告位
    _bannerView = [[GDTMobBannerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height -
                                                                     GDTMOB_AD_SUGGEST_SIZE_320x50.height, self.view.frame.size.width, GDTMOB_AD_SUGGEST_SIZE_320x50.height) appkey:@"1105827469" placementId:@"6010714789904685"];
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
}
#pragma mark - Private Method

- (void)initDatas {
    appDelegate =  (AppDelegate *) [[UIApplication sharedApplication] delegate];
}

- (void)setupViews {
    _tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.backgroundColor = DMViewControllerBGColor;
        tableView.dataSource = self;
        tableView.delegate = self;
        
        [tableView registerClass:[DMTableHeaderView class] forHeaderFooterViewReuseIdentifier:kDMTableHeaderViewID];
        [tableView registerClass:[DMTableMonsterListCell class] forCellReuseIdentifier:kDMTableMonsterListCellID];
        
        tableView.rowHeight = [DMTableMonsterListCell cellHeight];
        
        
        [self.view addSubview:tableView];
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        
        tableView;
    });
}
#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //[(ParallaxHeaderView *)_tableView.tableHeaderView layoutHeaderViewForScrollViewOffset:scrollView.contentOffset];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return appDelegate.gMonsterCategroy.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *category = [appDelegate.gMonsterCategroy allKeys];
    NSArray *monstersName = [appDelegate.gMonsterCategroy objectForKey:category[section]];
    return monstersName.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DMTableMonsterListCell *cell = [tableView dequeueReusableCellWithIdentifier:kDMTableMonsterListCellID forIndexPath:indexPath];
    /*
    DSSkillDetailItem *model = [[DSSkillDetailItem alloc] init];
    model.skillName = appDelegate.gSkillInfo.skillName[indexPath.section][indexPath.row];
    model.skillPoint = appDelegate.gSkillInfo.skillPoint[indexPath.section][indexPath.row];
    model.skillDesc = appDelegate.gSkillInfo.skillDesc[indexPath.section][indexPath.row];
    [(DSTableDetailCell *)cell configureCellWithSearchItem:(DSSkillDetailItem *)model];
    */
    NSArray *category = [appDelegate.gMonsterCategroy allKeys];
    NSArray *monstersName = [appDelegate.gMonsterCategroy objectForKey:category[indexPath.section]];
    [cell setMonsterName:monstersName[indexPath.row] weakLevel:monstersName[indexPath.row]];
     return cell;
}


#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [DMTableHeaderView viewHeight];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    DMTableHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kDMTableHeaderViewID];
    NSArray *category = [appDelegate.gMonsterCategroy allKeys];
    view.titleLabel.text = category[section];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DMMonsterDetailViewController *viewController = [[DMMonsterDetailViewController alloc] init];
    NSArray *category = [appDelegate.gMonsterCategroy allKeys];
    NSArray *monstersName = [appDelegate.gMonsterCategroy objectForKey:category[indexPath.section]];
    [viewController setMonsterName:monstersName[indexPath.row]];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
