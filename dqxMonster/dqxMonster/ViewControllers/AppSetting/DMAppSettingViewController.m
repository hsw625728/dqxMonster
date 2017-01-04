//
//  DMSkillHistoryViewController.m
//  dqxMonster
//
//  Created by HANSHAOWEN on 16/12/7.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "View+MASAdditions.h"
#import "UIImage+Common.h"
#import "DMAppSettingViewController.h"
#import "DMTableAppSettingCell.h"
#import "DMTableHeaderView.h"
#import "AppHelpViewController.h"
//#import "GoogleMobileAds/GoogleMobileAds.h"
//Tencent
#import "GDTMobBannerView.h" //导入GDTMobBannerView.h头文件


@interface DMAppSettingViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) DMTableHeaderView *headerView;
//@property (strong, nonatomic) GADNativeExpressAdView  *expressView;
//Tencent
@property (strong, nonatomic) GDTMobBannerView *bannerView;//声明一个GDTMobBannerView的实例

@end

@implementation DMAppSettingViewController {
    NSArray *sectionTitles;
    NSArray *rowTitles;
    NSArray *rowImageNames;
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
    //self.hideNavigationBar = YES;
    //self.automaticallyAdjustsScrollViewInsets = NO;
    //self.edgesForExtendedLayout = UIRectEdgeAll;
    
    self.navigationItem.title = DMAppSetting;
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    [self initDatas];
    [self setupViews];
    
    //Tencent 6 号广告位
    _bannerView = [[GDTMobBannerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height -
                                                                     GDTMOB_AD_SUGGEST_SIZE_320x50.height, self.view.frame.size.width, GDTMOB_AD_SUGGEST_SIZE_320x50.height) appkey:@"1105924448" placementId:@"4060013801286099"];
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
    sectionTitles = @[@"软件相关", @"操作说明"];
    rowTitles = @[@[@"DQX相关工具", @"建议反馈邮箱：hsw625728@163.com"], @[@"条件筛选界面操作示例"]];
    rowImageNames = @[@[@"center_setting", @"tab_music_normal"], @[@"tab_movie_normal"]];
}

- (void)setupViews {
    //_headerView = [[DMTableHeaderView alloc] initWithUserType:MLBUserTypeMe];
    
    _tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.backgroundColor = DMViewControllerBGColor;
        tableView.dataSource = self;
        tableView.delegate = self;
        [tableView registerClass:[DMTableAppSettingCell class] forCellReuseIdentifier:kDMTableAppSettingCellID];
        [tableView registerClass:[DMTableHeaderView class] forHeaderFooterViewReuseIdentifier:kDMTableHeaderViewID];
        tableView.rowHeight = [DMTableAppSettingCell cellHeight];
        
        [self.view addSubview:tableView];
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        
        tableView;
    });
}

#pragma mark - Public Method



#pragma mark - Action



#pragma mark - Network Request



#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return sectionTitles.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *rows = rowTitles[section];
    return rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DMTableAppSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:kDMTableAppSettingCellID forIndexPath:indexPath];
    [cell configureCellWithTitle:rowTitles[indexPath.section][indexPath.row] imageName:rowImageNames[indexPath.section][indexPath.row] atIndexPath:indexPath];
    
    return cell;
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [DMTableHeaderView viewHeight];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    DMTableHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kDMTableHeaderViewID];
    view.titleLabel.text = sectionTitles[section];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 0)
    {
        switch (indexPath.row)
        {
            case 0:
                [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://itunes.apple.com/us/app/dqx-ji-neng-dian-fen-pei-mo/id1187694327?l=zh&ls=1&mt=8"]];
                break;
            default:
                break;
        }
    }
    else{
        DMAppHelpViewController *view = [[DMAppHelpViewController alloc] init];
        switch (indexPath.row) {
            case 0:
                [view setHelpImageName:@"help_main"];
                break;
            default:
                break;
        }
        [self.navigationController pushViewController:view animated:YES];
    }
    //
}

@end
