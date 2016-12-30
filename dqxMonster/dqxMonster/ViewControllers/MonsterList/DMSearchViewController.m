//
//  DMSearchViewController.m
//  dqxMonster
//
//  Created by HANSHAOWEN on 16/12/30.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMSearchViewController.h"
#import "DMTableMonsterListCell.h"
#import "View+MASAdditions.h"
#import "DMMonsterDetailViewController.h"
#import "DMMonsterDetailInfo.h"

@interface DMSearchViewController () <UISearchBarDelegate, UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) UISearchBar *searchBar;
@property (strong, nonatomic) UIImageView *hintView;
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) UIActivityIndicatorView *activityIndicatorView;

@end

@implementation DMSearchViewController{
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
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [_searchBar becomeFirstResponder];
}

#pragma mark - Private Method

- (void)initDatas {
    dataSource = [NSMutableArray arrayWithCapacity:4];
}

- (void)setupViews {
    //self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(searching)];
    
    _searchBar = [[UISearchBar alloc] init];
    _searchBar.placeholder = @"输入关键字(例如：史莱姆)";
    _searchBar.tintColor = DMLightGrayTextColor;
    _searchBar.returnKeyType = UIReturnKeySearch;
    _searchBar.searchBarStyle = UISearchBarStyleMinimal;
    _searchBar.delegate = self;
    self.navigationItem.titleView = _searchBar;
    
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
    _tableView.hidden = YES;
    
    _hintView = ({
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search_all"]];
        imageView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.sizeOffset(CGSizeMake(165, 110));
            make.top.equalTo(self.view).offset(114);
            make.centerX.equalTo(self.view);
        }];
        
        imageView;
    });
    
    _activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    _activityIndicatorView.hidesWhenStopped = YES;
    [self.view addSubview:_activityIndicatorView];
    [_activityIndicatorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
}

#pragma mark - Public Method



#pragma mark - Action

- (void)cancel {
    [_searchBar resignFirstResponder];
    [self dismissViewControllerAnimated:YES completion:NULL];
}

#pragma mark - Network Request

- (void)searching {
    [_activityIndicatorView startAnimating];
    [dataSource removeAllObjects];
    AppDelegate *delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];

    NSArray *keys = [delegate.gMonsterInfo allKeys];
    for (NSString *key in keys)
    {
        DMMonsterDetailInfo *info = [delegate.gMonsterInfo objectForKey:key];
        if ([info.name containsString:_searchBar.text])
        {
            [dataSource addObject:key];
        }
    }
    
    //_segmentedControl.hidden = NO;
    _tableView.hidden = NO;
    _hintView.hidden = YES;
    
    [_tableView reloadData];
    [_activityIndicatorView stopAnimating];
    
}


#pragma mark - UISearchBarDelegate

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [_searchBar resignFirstResponder];
    [self searching];
}

#pragma mark - DZNEmptyDataSetSource

- (UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    return [UIImage imageNamed:@"search_null_image"];
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
    [(DMTableMonsterListCell *)cell setMonsterName:dataSource[indexPath.row] weakLevel:@"点击查看怪物详细信息"];
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

@end
