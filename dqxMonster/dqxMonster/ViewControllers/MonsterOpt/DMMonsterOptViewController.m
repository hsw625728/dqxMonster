//
//  DMMonsterOptViewController.m
//  dqxMonster
//
//  Created by HANSHAOWEN on 16/12/28.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMMonsterOptViewController.h"
#import "DMMonsterOptListViewController.h"
#import "View+MASAdditions.h"
#import "UIImage+Common.h"
#import "DMMonsterDetailInfo.h"
#import "DMTableMonsterOptCell.h"
#import "DMTableHeaderView.h"
//Tencent
#import "GDTMobBannerView.h" //导入GDTMobBannerView.h头文件

@interface DMMonsterOptViewController() <UITableViewDataSource, UITableViewDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIPickerView *pickerView;
@property (strong, nonatomic) UIButton *btnSelectDone;
@property (strong, nonatomic) UIButton *btnSearch;
//Tencent
@property (strong, nonatomic) GDTMobBannerView *bannerView;//声明一个GDTMobBannerView的实例

@end

@implementation DMMonsterOptViewController{
    AppDelegate *appDelegate;
    NSInteger selectSetType;
    NSMutableArray *selectType;
    NSMutableArray *selectMin;
    NSMutableArray *selectMax;
    NSArray *resType;
    NSArray *resValue;
    NSArray *expType;
    NSArray *expValue;
    NSArray *goldType;
    NSArray *goldValue;
    NSArray *weakType;
    NSArray *weakValue;
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
    
    //Tencent 4 号广告位
    _bannerView = [[GDTMobBannerView alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height -
                                                                     GDTMOB_AD_SUGGEST_SIZE_320x50.height, self.view.frame.size.width, GDTMOB_AD_SUGGEST_SIZE_320x50.height) appkey:@"1105924448" placementId:@"8090212861980077"];
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
    selectSetType = 0;
    selectType = [[NSMutableArray alloc] initWithArray:MONSTER_SELECT_TYPE];
    selectMin = [[NSMutableArray alloc] initWithArray:MONSTER_SELECT_TYPE_MIN];
    selectMax = [[NSMutableArray alloc] initWithArray:MONSTER_SELECT_TYPE_MAX];
    resType = RES_TYPE;
    resValue = SELECT_VALUE_NIL;
    expType = EXP_TYPE;
    expValue = SELECT_VALUE_NIL;
    goldType = GOLD_TYPE;
    goldValue = SELECT_VALUE_NIL;
    weakType = WEAK_TYPE;
    weakValue = SELECT_VALUE_NIL;
}

- (void)setupViews {
    _tableView = ({
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        tableView.backgroundColor = DMViewControllerBGColor;
        tableView.dataSource = self;
        tableView.delegate = self;
        
        [tableView registerClass:[DMTableHeaderView class] forHeaderFooterViewReuseIdentifier:kDMTableHeaderViewID];
        [tableView registerClass:[DMTableMonsterOptCell class] forCellReuseIdentifier:kDMTableMonsterOptCellID];
        
        tableView.rowHeight = [DMTableMonsterOptCell cellHeight];
        
        
        [self.view addSubview:tableView];
        [tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.view);
        }];
        //[tableView setHidden:YES];
        tableView;
    });
    
    _pickerView = ({
        UIPickerView *pickview = [[UIPickerView alloc] initWithFrame:self.view.bounds];
        pickview.dataSource = self;
        pickview.delegate = self;
        pickview.backgroundColor = DMLightGrayTextColor;
        [pickview setHidden:YES];
        [self.view addSubview:pickview];
        [pickview mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.equalTo(@(self.view.frame.size.width));
            make.height.equalTo(@260);
            make.top.equalTo(self.view).offset(24);
            make.left.equalTo(self.view);
        }];

        pickview;
    });
    
    _btnSelectDone = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn setTitle:@"完成" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnDone) forControlEvents:UIControlEventTouchUpInside];
        [btn setHidden:YES];
        [self.view addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(_pickerView.mas_right);
            make.top.equalTo(_pickerView.mas_top);
            //make.bottom.left.equalTo(self.view);
        }];
        btn;
    });
    
    _btnSearch = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        [btn setTitle:@"开始筛选" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnSearch) forControlEvents:UIControlEventTouchUpInside];
        [btn setHidden:NO];
        [self.view addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.view.mas_centerX);
            make.bottom.equalTo(self.view).offset(-50);
            //make.bottom.left.equalTo(self.view);
        }];
        btn;
    });
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
    DMTableMonsterOptCell *cell = [tableView dequeueReusableCellWithIdentifier:kDMTableMonsterOptCellID forIndexPath:indexPath];
    
    [cell setSelectType:selectType[indexPath.row] minValue:selectMin[indexPath.row] maxValue:selectMax[indexPath.row
                                                                                                       ]];
    return cell;
}


#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return [DMTableHeaderView viewHeight];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    DMTableHeaderView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:kDMTableHeaderViewID];
    view.titleLabel.text = @"设置筛选条件";
    
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    selectSetType = indexPath.row;
    switch(selectSetType)
    {
        case 0:
        case 1:
        case 2:
        case 3:
        case 4:
        case 5:
            [_pickerView setHidden:NO];
            [_btnSelectDone setHidden:NO];
            [_btnSearch setHidden:YES];
            break;
        default:
            break;
    }
    
    [_pickerView selectRow:0 inComponent:0 animated:NO];
    resValue = SELECT_VALUE_NIL;
    expValue = SELECT_VALUE_NIL;
    goldValue = SELECT_VALUE_NIL;
    weakValue = SELECT_VALUE_NIL;
    //[_pickerView selectRow:0 inComponent:1 animated:NO];
    [_pickerView reloadAllComponents];
}

#pragma mark - UIPickerViewDataSource
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    switch(selectSetType)
    {
        case 0:
            return (component == 0 ? expType.count : expValue.count);
            break;
        case 1:
            return (component == 0 ? goldType.count : goldValue.count);
            break;
        case 2:
            return (component == 0 ? weakType.count : weakValue.count);
            break;
        case 3:
        case 4:
        case 5:
            return (component == 0 ? resType.count : resValue.count);
            break;
        default:
            return 0;
            break;
    }
}

-(CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 20;
}

-(CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    if (component == 0){
        return 200;
    }
    else{
        return 200;
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
    switch(selectSetType)
    {
        case 0:
            return (component == 0 ? expType[row] : expValue[row]);
            break;
        case 1:
            return (component == 0 ? goldType[row] : goldValue[row]);
            break;
        case 2:
            return (component == 0 ? weakType[row] : weakValue[row]);
            break;
        case 3:
        case 4:
        case 5:
            if (component == 0){
                return resType[row];
            }
            else{
                return resValue[row];
            }
            break;
        default:
            break;
    }
    return @"";
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if (component == 0 && row == 0){
        expValue = SELECT_VALUE_NIL;
        goldValue = SELECT_VALUE_NIL;
        weakValue = SELECT_VALUE_NIL;
        resValue = SELECT_VALUE_NIL;
        [pickerView reloadComponent:1];
    }
    else if(component == 0 && row != 0){
        switch(selectSetType)
        {
            case 0:
                expValue = EXP_VALUE;
                break;
            case 1:
                goldValue = GOLD_VALUE;
                break;
            case 2:
                weakValue = WEAK_VALUE;
                break;
            case 3:
            case 4:
            case 5:
                resValue = RES_VALUE;
                break;
            default:
                break;
        }
        [pickerView reloadComponent:1];
    }
}
-(void)btnDone{
    switch(selectSetType)
    {
        case 0:
            selectMin[selectSetType] = expType[[_pickerView selectedRowInComponent:0]];
            selectMax[selectSetType] = expValue[[_pickerView selectedRowInComponent:1]];
            break;
        case 1:
            selectMin[selectSetType] = goldType[[_pickerView selectedRowInComponent:0]];
            selectMax[selectSetType] = goldValue[[_pickerView selectedRowInComponent:1]];
            break;
        case 2:
            selectMin[selectSetType] = weakType[[_pickerView selectedRowInComponent:0]];
            selectMax[selectSetType] = weakValue[[_pickerView selectedRowInComponent:1]];
            break;
        case 3:
        case 4:
        case 5:
            selectMin[selectSetType] = resType[[_pickerView selectedRowInComponent:0]];
            selectMax[selectSetType] = resValue[[_pickerView selectedRowInComponent:1]];
            break;
        default:
            break;
    }

    [_tableView reloadData];
    
    [_pickerView setHidden:YES];
    [_btnSelectDone setHidden:YES];
    [_btnSearch setHidden:NO];
}

-(void)btnSearch{
    DMMonsterOptListViewController *viewController = [[DMMonsterOptListViewController alloc] init];
    [viewController setSelectValue:selectMin[0] expMax:selectMax[0] goldMin:selectMin[1] goldMax:selectMax[1] weakMin:selectMin[2] weakMax:selectMax[2] resType1:selectMin[3] resValue1:selectMax[3] resType2:selectMin[4] resValue2:selectMax[4] resType3:selectMin[5] resValue3:selectMax[5]];
    [self.navigationController pushViewController:viewController animated:YES];
}
@end
