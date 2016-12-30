//
//  DMTableMonsterDetailCell.m
//  dqxMonster
//
//  Created by HANSHAOWEN on 16/12/29.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DMTableMonsterDetailCell.h"
#import "View+MASAdditions.h"
#import "DMMonsterDetailInfo.h"

NSString *const kDMTableMonsterDetailCellID = @"kDMTableMonsterDetailCellID";

@interface DMTableMonsterDetailCell ()
//本页显示到怪物名
@property (strong, nonatomic) NSString* name;

//左上角 图标和名字
@property (strong, nonatomic) UILabel *labelName;
@property (strong, nonatomic) UILabel *labelCategroy;
@property (strong, nonatomic) UIImageView *monsterImage;

//右上角 基础信息
@property (strong, nonatomic) UILabel *labelInfoTitle;
@property (strong, nonatomic) UILabel *labelHp;
@property (strong, nonatomic) UILabel *labelAtk;
@property (strong, nonatomic) UILabel *labelArm;
@property (strong, nonatomic) UILabel *labelExp;
@property (strong, nonatomic) UILabel *labelGold;
@property (strong, nonatomic) UILabel *labelWeaklevel;
@property (strong, nonatomic) UILabel *labelWeight;

//中间 获得道具
@property (strong, nonatomic) UIImageView *itemImage;
@property (strong, nonatomic) UIImageView *rareItemImage;
@property (strong, nonatomic) UILabel *labelDropTitle;
@property (strong, nonatomic) UILabel *labelDropItem;
@property (strong, nonatomic) UILabel *labelDropItemName;
@property (strong, nonatomic) UILabel *labelDropRareItem;
@property (strong, nonatomic) UILabel *labelDropRareItemName;

//下方 耐性
@property (strong, nonatomic) UILabel *labelResTitle;
@property (strong, nonatomic) UILabel *labelFire;
@property (strong, nonatomic) UILabel *labelIce;
@property (strong, nonatomic) UILabel *labelThunder;
@property (strong, nonatomic) UILabel *labelEarth;
@property (strong, nonatomic) UILabel *labelWind;
@property (strong, nonatomic) UILabel *labelDark;
@property (strong, nonatomic) UILabel *labelLight;
@property (strong, nonatomic) UILabel *labelShui;
@property (strong, nonatomic) UILabel *labelHun;
@property (strong, nonatomic) UILabel *labelMei;
@property (strong, nonatomic) UILabel *labelMa;
@property (strong, nonatomic) UILabel *labelZhong;
@property (strong, nonatomic) UILabel *labelHuan;
@property (strong, nonatomic) UILabel *labelFeng;
@property (strong, nonatomic) UILabel *labelDa;
@property (strong, nonatomic) UILabel *labelShuai;
@property (strong, nonatomic) UILabel *labelShu;
@property (strong, nonatomic) UILabel *labelKong;
@property (strong, nonatomic) UILabel *labelJi;
@property (strong, nonatomic) UILabel *labelJifei;
@property (strong, nonatomic) UILabel *labelDaduan;
@property (strong, nonatomic) UILabel *labelNeng;
@property (strong, nonatomic) UILabel *labelNai;
@property (strong, nonatomic) UILabel *labelGong;
@property (strong, nonatomic) UILabel *labelFang;
@property (strong, nonatomic) UILabel *labelXing;
@property (strong, nonatomic) UILabel *labelZhongliang;

@end

@implementation DMTableMonsterDetailCell

#pragma mark - Class Method

+ (CGFloat)cellHeight {
    return CGRectGetWidth([UIScreen mainScreen ].applicationFrame)*1.8;
}

#pragma mark - View Lifecycle

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        [self setupViews];
    }
    
    return self;
}

- (void)prepareForReuse {
    [super prepareForReuse];
}

#pragma mark - Private Method

- (void)setupViews {
    const int ICON_WIDE = 38;
    const int ICON_HEIGH = 38;
    
    self.backgroundColor = [UIColor whiteColor];
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    const CGFloat WIDTH = CGRectGetWidth([UIScreen mainScreen ].applicationFrame);
    //CGFloat lableX = ICON_WIDE + 8*2;
    
    //左上角 名字和图标
    const float leftTopOffset = -WIDTH/5;
    _monsterImage = ({
        UIImageView *imageView = [UIImageView new];
        imageView.contentMode = UIViewContentModeCenter;
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.sizeOffset(CGSizeMake(WIDTH/2, WIDTH/2));
            make.top.equalTo(self.contentView).offset(WIDTH/7);
            make.centerX.equalTo(self.contentView).offset(leftTopOffset);
        }];
        
        imageView;
    });
    
    _labelName = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(20);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(leftTopOffset);
            make.top.equalTo(self.contentView).offset(WIDTH/16);
        }];
        
        label;
    });
    
    _labelCategroy = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(9);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(leftTopOffset);
            make.top.equalTo(self.contentView).offset(WIDTH/7.4);
        }];
        
        label;
    });
    //----名字和图标设置结束------
    
    //右上角 基础信息
    const float offsetRightTop = 2*WIDTH/32;
    const float rightTopOffset = WIDTH/8;
    _labelInfoTitle = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(20);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(WIDTH/4);
            make.top.equalTo(self.contentView).offset(WIDTH/16);
        }];
        
        label;
    });
    _labelHp = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(WIDTH/4);
            make.top.equalTo(self.contentView).offset(offsetRightTop+rightTopOffset);
        }];
        
        label;
    });
    _labelAtk = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(WIDTH/4);
            make.top.equalTo(self.contentView).offset(2*offsetRightTop+rightTopOffset);
        }];
        
        label;
    });
    _labelArm = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(WIDTH/4);
            make.top.equalTo(self.contentView).offset(3*offsetRightTop+rightTopOffset);
        }];
        
        label;
    });
    _labelExp = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(WIDTH/4);
            make.top.equalTo(self.contentView).offset(4*offsetRightTop+rightTopOffset);
        }];
        
        label;
    });
    _labelGold = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(WIDTH/4);
            make.top.equalTo(self.contentView).offset(5*offsetRightTop+rightTopOffset);
        }];
        
        label;
    });
    _labelWeaklevel = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(WIDTH/4);
            make.top.equalTo(self.contentView).offset(6*offsetRightTop+rightTopOffset);
        }];
        
        label;
    });
    _labelWeight = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(WIDTH/4);
            make.top.equalTo(self.contentView).offset(7*offsetRightTop+rightTopOffset);
        }];
        
        label;
    });
    //----基础信息设置结束------
    
    //中间 获得道具
    _labelDropTitle = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(20);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(_monsterImage.mas_bottom).offset(8);
        }];
        
        label;
    });
    _itemImage = ({
        UIImageView *imageView = [UIImageView new];
        imageView.contentMode = UIViewContentModeCenter;
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.sizeOffset(CGSizeMake(ICON_WIDE, ICON_HEIGH));
            make.top.equalTo(_labelDropTitle.mas_bottom).offset(WIDTH/32);
            make.left.equalTo(self.contentView).offset(WIDTH/8);
        }];
        
        imageView;
    });
    _rareItemImage = ({
        UIImageView *imageView = [UIImageView new];
        imageView.contentMode = UIViewContentModeCenter;
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.sizeOffset(CGSizeMake(ICON_WIDE, ICON_HEIGH));
            make.top.equalTo(_labelDropTitle.mas_bottom).offset(WIDTH/32);
            make.left.equalTo(self.contentView).offset(5*WIDTH/8);
        }];
        
        imageView;
    });
    _labelDropItem = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(-7*WIDTH/16);
            make.centerY.equalTo(_rareItemImage).offset(1);
        }];
        
        label;
    });
    _labelDropItemName = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(-2*WIDTH/16);
            make.centerY.equalTo(_rareItemImage).offset(1);
        }];
        
        label;
    });
    _labelDropRareItem = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(WIDTH/16);
            make.centerY.equalTo(_rareItemImage).offset(1);
        }];
        
        label;
    });
    _labelDropRareItemName = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(6*WIDTH/16);
            make.centerY.equalTo(_rareItemImage).offset(1);
        }];
        
        label;
    });
    //--------中间道具设置结束------------
    
    //下方 耐性
    _labelResTitle = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(20);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(_rareItemImage.mas_bottom).offset(8);
        }];
        
        label;
    });
    //第一列
    const float offsetFirst = -WIDTH/3;
    const float offsetSecond = WIDTH/3;
    const float offsetTop = 2*WIDTH/32;
    const float titleOffset = WIDTH/16;
    _labelFire = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(offsetFirst);
            make.top.equalTo(_labelResTitle.mas_bottom).offset(offsetTop*0+titleOffset);
        }];
        
        label;
    });
    _labelIce = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(offsetFirst);
            make.top.equalTo(_labelResTitle.mas_bottom).offset(offsetTop*1+titleOffset);
        }];
        
        label;
    });
    _labelThunder = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(offsetFirst);
            make.top.equalTo(_labelResTitle.mas_bottom).offset(offsetTop*2+titleOffset);
        }];
        
        label;
    });
    _labelEarth = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(offsetFirst);
            make.top.equalTo(_labelResTitle.mas_bottom).offset(offsetTop*3+titleOffset);
        }];
        
        label;
    });
    _labelWind = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(offsetFirst);
            make.top.equalTo(_labelResTitle.mas_bottom).offset(offsetTop*4+titleOffset);
        }];
        
        label;
    });
    _labelDark = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(offsetFirst);
            make.top.equalTo(_labelResTitle.mas_bottom).offset(offsetTop*5+titleOffset);
        }];
        
        label;
    });
    _labelLight = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(offsetFirst);
            make.top.equalTo(_labelResTitle.mas_bottom).offset(offsetTop*6+titleOffset);
        }];
        
        label;
    });
    _labelShui = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(offsetFirst);
            make.top.equalTo(_labelResTitle.mas_bottom).offset(offsetTop*7+titleOffset);
        }];
        
        label;
    });
    _labelHun = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(offsetFirst);
            make.top.equalTo(_labelResTitle.mas_bottom).offset(offsetTop*8+titleOffset);
        }];
        
        label;
    });
    //第二列
    _labelMei = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(_labelResTitle.mas_bottom).offset(offsetTop*0+titleOffset);
        }];
        
        label;
    });
    _labelMa = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(_labelResTitle.mas_bottom).offset(offsetTop*1+titleOffset);
        }];
        
        label;
    });
    _labelZhong = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(_labelResTitle.mas_bottom).offset(offsetTop*2+titleOffset);
        }];
        
        label;
    });
    _labelHuan = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(_labelResTitle.mas_bottom).offset(offsetTop*3+titleOffset);
        }];
        
        label;
    });
    _labelFeng = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(_labelResTitle.mas_bottom).offset(offsetTop*4+titleOffset);
        }];
        
        label;
    });
    _labelDa = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(_labelResTitle.mas_bottom).offset(offsetTop*5+titleOffset);
        }];
        
        label;
    });
    _labelShuai = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(_labelResTitle.mas_bottom).offset(offsetTop*6+titleOffset);
        }];
        
        label;
    });
    _labelShu = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(_labelResTitle.mas_bottom).offset(offsetTop*7+titleOffset);
        }];
        
        label;
    });
    _labelKong = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(_labelResTitle.mas_bottom).offset(offsetTop*8+titleOffset);
        }];
        
        label;
    });
    //第三列
    _labelJi = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(offsetSecond);
            make.top.equalTo(_labelResTitle.mas_bottom).offset(offsetTop*0+titleOffset);
        }];
        
        label;
    });
    _labelNeng = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(offsetSecond);
            make.top.equalTo(_labelResTitle.mas_bottom).offset(offsetTop*1+titleOffset);
        }];
        
        label;
    });
    _labelNai = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(offsetSecond);
            make.top.equalTo(_labelResTitle.mas_bottom).offset(offsetTop*2+titleOffset);
        }];
        
        label;
    });
    _labelGong = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(offsetSecond);
            make.top.equalTo(_labelResTitle.mas_bottom).offset(offsetTop*3+titleOffset);
        }];
        
        label;
    });
    _labelFang = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(offsetSecond);
            make.top.equalTo(_labelResTitle.mas_bottom).offset(offsetTop*4+titleOffset);
        }];
        
        label;
    });
    _labelXing = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(offsetSecond);
            make.top.equalTo(_labelResTitle.mas_bottom).offset(offsetTop*5+titleOffset);
        }];
        
        label;
    });
    _labelZhongliang = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(offsetSecond);
            make.top.equalTo(_labelResTitle.mas_bottom).offset(offsetTop*6+titleOffset);
        }];
        
        label;
    });
    _labelJifei= ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(offsetSecond);
            make.top.equalTo(_labelResTitle.mas_bottom).offset(offsetTop*7+titleOffset);
        }];
        
        label;
    });
    _labelDaduan = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(offsetSecond);
            make.top.equalTo(_labelResTitle.mas_bottom).offset(offsetTop*8+titleOffset);
        }];
        
        label;
    });
}

-(void)setMonsterName:(NSString*)name
{
    _name = name;
    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    DMMonsterDetailInfo *info = [delegate.gMonsterInfo objectForKey:_name];
    
    //左上角 名字图标
    _labelName.text = info.name;
    _labelCategroy.text = info.category;
    _monsterImage.image = [UIImage imageNamed:_name];
    
    //右上角 基础信息
    _labelInfoTitle.text = @"基础信息";
    _labelHp.text = [NSString stringWithFormat:@"  体    力  %i", (int)info.hp];
    _labelAtk.text = [NSString stringWithFormat:@"攻 击 力%i", (int)info.atk];
    _labelArm.text = [NSString stringWithFormat:@"防 御 力%i", (int)info.arm];
    _labelExp.text = [NSString stringWithFormat:@"  经    验  %i", (int)info.expJap];
    _labelGold.text = [NSString stringWithFormat:@"  金    币  %i", (int)info.gold];
    _labelWeaklevel.text = [NSString stringWithFormat:@"汗泪等级%i", (int)info.weakLevel];
    _labelWeight.text = [NSString stringWithFormat:@"  重    量  %i", (int)info.weight];
    
    //中间 获得道具
    _itemImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"Icon-%@", info.dropItem]];
    _rareItemImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"Icon-%@", info.dropItemRare]];
    _labelDropTitle.text = @"获得道具";
    _labelDropItem.text = @"普通";
    _labelDropItemName.text = info.dropItem;
    _labelDropRareItem.text = @"稀有";
    _labelDropRareItemName.text = info.dropItemRare;

    //下方 耐性
    _labelResTitle.text = @"耐性";
    _labelFire.text = [NSString stringWithFormat:@"   火   ：%@（%i）", [self resStr:info.fireRes], (int)info.fireRes];
    _labelIce.text = [NSString stringWithFormat:@"   冰   ：%@（%i）", [self resStr:info.iceRes], (int)info.iceRes];
    _labelThunder.text = [NSString stringWithFormat:@"   雷   ：%@（%i）", [self resStr:info.thunderRes], (int)info.thunderRes];
    _labelEarth.text = [NSString stringWithFormat:@"   土   ：%@（%i）", [self resStr:info.earthRes], (int)info.earthRes];
    _labelWind.text = [NSString stringWithFormat:@"   风   ：%@（%i）", [self resStr:info.windRes], (int)info.windRes];
    _labelDark.text = [NSString stringWithFormat:@"   暗   ：%@（%i）", [self resStr:info.darkRes], (int)info.darkRes];
    _labelLight.text = [NSString stringWithFormat:@"   光   ：%@（%i）", [self resStr:info.lightRes], (int)info.lightRes];
    _labelShui.text = [NSString stringWithFormat:@"  睡眠  ：%@（%i）", [self resStr:info.shuaiRes], (int)info.shuiRes];
    _labelHun.text = [NSString stringWithFormat:@"  混乱  ：%@（%i）", [self resStr:info.hunRes], (int)info.hunRes];
    _labelMei.text = [NSString stringWithFormat:@"  魅惑  ：%@（%i）", [self resStr:info.meiRes], (int)info.meiRes];
    _labelMa.text = [NSString stringWithFormat:@"  麻痹  ：%@（%i）", [self resStr:info.maRes], (int)info.maRes];
    _labelZhong.text = [NSString stringWithFormat:@"  中毒  ：%@（%i）", [self resStr:info.zhongRes], (int)info.zhongRes];
    _labelHuan.text = [NSString stringWithFormat:@"  幻觉  ：%@（%i）", [self resStr:info.huanRes], (int)info.huanRes];
    _labelFeng.text = [NSString stringWithFormat:@"  封印  ：%@（%i）", [self resStr:info.fengRes], (int)info.fengRes];
    _labelDa.text = [NSString stringWithFormat:@"  大笑  ：%@（%i）", [self resStr:info.daRes], (int)info.daRes];
    _labelShuai.text = [NSString stringWithFormat:@"  摔倒  ：%@（%i）", [self resStr:info.shuaiRes], (int)info.shuaiRes];
    _labelShu.text = [NSString stringWithFormat:@"  束缚  ：%@（%i）", [self resStr:info.shuRes], (int)info.shuRes];
    _labelKong.text = [NSString stringWithFormat:@"  恐惧  ：%@（%i）", [self resStr:info.kongRes], (int)info.kongRes];
    _labelJi.text = [NSString stringWithFormat:@"  即死  ：%@（%i）", [self resStr:info.jiRes], (int)info.jiRes];
    _labelJifei.text = [NSString stringWithFormat:@"  击飞  ：%@（%i）", [self resStr:info.jifeiRes], (int)info.jifeiRes];
    _labelDaduan.text = [NSString stringWithFormat:@"  打断  ：%@（%i）", [self resStr:info.daduanRes], (int)info.daduanRes];
    _labelNeng.text = [NSString stringWithFormat:@"能量吸收：%@（%i）", [self resStr:info.nengRes], (int)info.nengRes];
    _labelNai.text = [NSString stringWithFormat:@"耐性降低：%@（%i）", [self resStr:info.naiRes], (int)info.naiRes];
    _labelGong.text = [NSString stringWithFormat:@"攻击降低：%@（%i）", [self resStr:info.gongRes], (int)info.gongRes];
    _labelFang.text = [NSString stringWithFormat:@"防御降低：%@（%i）", [self resStr:info.fangRes], (int)info.fangRes];
    _labelXing.text = [NSString stringWithFormat:@"行动延长：%@（%i）", [self resStr:info.xingRes], (int)info.xingRes];
    _labelZhongliang.text = [NSString stringWithFormat:@"重量减少：%@（%i）", [self resStr:info.zhongliangRes], (int)info.zhongliangRes];
}

-(NSString*)resStr:(NSInteger)i
{
    switch(i)
    {
        case 1:
            return @"免疫";
        case 2:
            return @"免疫";
        case 3:
            return @"抵抗";
        case 4:
            return @"普通";
        case 5:
            return @"易中";
        case 6:
            return @"有效";
        case 7:
            return @"极效";
        default:
            return @"";
    }
    return @"";
}

@end
