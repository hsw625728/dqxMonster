//
//  DMMonsterOptViewController.m
//  dqxMonster
//
//  Created by HANSHAOWEN on 16/12/28.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMMonsterOptViewController.h"
#import "View+MASAdditions.h"
#import "UIImage+Common.h"
#import "DMMonsterDetailInfo.h"
#import "DMTableMonsterListCell.h"
#import "DMTableHeaderView.h"
//Tencent
#import "GDTMobBannerView.h" //导入GDTMobBannerView.h头文件

@interface DMMonsterOptViewController() <UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIPickerView *pickerView;
//Tencent
@property (strong, nonatomic) GDTMobBannerView *bannerView;//声明一个GDTMobBannerView的实例

@end

@implementation DMMonsterOptViewController{
    AppDelegate *appDelegate;
    NSArray *selectType;
    NSArray *resType;
    NSArray *resValue;
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
    
    self.navigationItem.title = DMMonsterOpt;
    
    [self setupViews];
    
    //设置导航栏
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    
    [self initDatas];
    [self setupViews];
    
    //特技列表详情页最下方常驻的Google广告
    /*
     NSMutableArray *history;
     NSString *docPath =  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
     NSString *path = [docPath stringByAppendingPathComponent:@"RecipeHistory"];
     
     history = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
     if (ISNULL(history))
     history = [[NSMutableArray alloc] init];
     
     _bannerView = [[GADBannerView alloc] initWithFrame:CGRectMake(0.0,
     self.view.frame.size.height -
     GAD_SIZE_320x50.height,
     self.view.frame.size.width,
     GAD_SIZE_320x50.height)];
     NSLog(@"Google Mobile Ads SDK version: %@", [GADRequest sdkVersion]);
     //4号横幅广告位
     self.bannerView.adUnitID = @"ca-app-pub-9308902363520222/3901466590";
     //Google AdMob提供的测试广告ID
     //self.bannerView.adUnitID = @"ca-app-pub-3940256099942544/2934735716";
     self.bannerView.rootViewController = self;
     GADRequest *request = [GADRequest request];
     //request.testDevices = @[ @"66fc40441247f9df253bbcaa32f528bb" ];
     [self.bannerView loadRequest:request];
     
     [self.view addSubview:_bannerView];
     [_bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
     make.width.equalTo(@(self.view.frame.size.width));
     make.height.equalTo(@50);
     make.bottom.left.equalTo(self.view);
     }];
     */
    //Tencent 4 号广告位
    /*
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
     */
}
#pragma mark - Private Method

- (void)initDatas {
    appDelegate =  (AppDelegate *) [[UIApplication sharedApplication] delegate];
    selectType = MONSTER_SELECT_TYPE;
    resType = RES_TYPE;
    resValue = RES_VALUE;
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
        [tableView setHidden:YES];
        tableView;
    });
    
    _pickerView = ({
        UIPickerView *pickview = [[UIPickerView alloc] initWithFrame:self.view.bounds];
        pickview.dataSource = self;
        pickview.delegate = self;
        [self.view addSubview:pickview];
        [pickview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(self.view.frame.size.width));
            make.height.equalTo(@200);
            make.bottom.left.equalTo(self.view);
            //make.edges.equalTo(self.view);
        }];

        pickview;
    }
    );
    [self.pickerView reloadAllComponents];
}
#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //[(ParallaxHeaderView *)_tableView.tableHeaderView layoutHeaderViewForScrollViewOffset:scrollView.contentOffset];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
    //return appDelegate.gSkillInfo.typeName.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //NSArray *rows = appDelegate.gSkillInfo.skillName[section];
    //return rows.count;
    return selectType.count;
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
    [cell setMonsterName:selectType[indexPath.row] weakLevel:selectType[indexPath.row]];
    return cell;
}


#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [DMTableHeaderView viewHeight];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    DMTableHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kDMTableHeaderViewID];
    //view.titleLabel.text = appDelegate.gSkillInfo.typeName[section];
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UIPickerViewDataSource
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if (component == 0){
        return 27;
    }
    else{
        return 7;
    }
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 20;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    if (component == 0){
        return 80;
    }
    else{
        return 80;
    }
}

#pragma mark - UIPickerViewDataDelegate
/*
-(UIView*)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    if (!view){
        view = [[UIPickerView alloc] init];
    }
    if (component == 0){
        UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 20)];
        //text.textAlignment = NSTextAlignmentCenter;
        text.text = resType[row];
        [view addSubview:text];
    }
    else{
        UILabel *text = [[UILabel alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2, 0, 80, 20)];
        //text.textAlignment = NSTextAlignmentCenter;
        text.text = resValue[row];
        [view addSubview:text];
    }
    return view;
}
*/
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (component == 0){
        return resType[row];
    }
    else{
        return resValue[row];
    }
}
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0) {
        [pickerView selectedRowInComponent:0];
        
        /**
         *  选中第0列时需要刷新第1列和第二列的数据
         */
        //NSDictionary *provinceDict = [self.provinceArray objectAtIndex:row];
        //self.cityArray = provinceDict[@"l"];
        [pickerView reloadComponent:1];
        
        
    } else if (component == 1) {
        [pickerView selectedRowInComponent:1];
        
        /**
         *  选中第一列时需要刷新第二列的数据信息
         */
        
    }
}
@end
