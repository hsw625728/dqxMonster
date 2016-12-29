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
    return 500;
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
    _monsterImage = ({
        UIImageView *imageView = [UIImageView new];
        imageView.contentMode = UIViewContentModeCenter;
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.sizeOffset(CGSizeMake(WIDTH/2, WIDTH/2));
            make.top.equalTo(self.contentView).offset(WIDTH/4);
            make.left.equalTo(self.contentView).offset(8);
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
            make.centerX.equalTo(self.contentView).offset(WIDTH/4);
            make.top.equalTo(self.contentView).offset(WIDTH/8);
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
            make.centerX.equalTo(self.contentView).offset(WIDTH/4);
            make.top.equalTo(self.contentView).offset(WIDTH/6);
        }];
        
        label;
    });
    //----名字和图标设置结束------
    
    //右上角 基础信息
    _labelInfoTitle = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(12);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView).offset(3*WIDTH/4);
            make.top.equalTo(self.contentView).offset(WIDTH/32);
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
            make.centerX.equalTo(self.contentView).offset(3*WIDTH/4);
            make.top.equalTo(self.contentView).offset(3*1*WIDTH/32);
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
            make.centerX.equalTo(self.contentView).offset(3*WIDTH/4);
            make.top.equalTo(self.contentView).offset(3*2*WIDTH/32);
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
            make.centerX.equalTo(self.contentView).offset(3*WIDTH/4);
            make.top.equalTo(self.contentView).offset(3*3*WIDTH/32);
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
            make.centerX.equalTo(self.contentView).offset(3*WIDTH/4);
            make.top.equalTo(self.contentView).offset(3*4*WIDTH/32);
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
            make.centerX.equalTo(self.contentView).offset(3*WIDTH/4);
            make.top.equalTo(self.contentView).offset(3*5*WIDTH/32);
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
            make.centerX.equalTo(self.contentView).offset(3*WIDTH/4);
            make.top.equalTo(self.contentView).offset(3*6*WIDTH/32);
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
            make.centerX.equalTo(self.contentView).offset(3*WIDTH/4);
            make.top.equalTo(self.contentView).offset(3*7*WIDTH/32);
        }];
        
        label;
    });
    //----基础信息设置结束------
    
    
    

}

-(void)setMonsterName:(NSString*)name
{
    _name = name;
    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    DMMonsterDetailInfo *info = [delegate.gMonsterInfo objectForKey:_name];
    _labelName.text = info.name;
    _labelCategroy.text = info.category;
    _monsterImage;
    
    //右上角 基础信息
    _labelInfoTitle.text = @"基础信息";
    _labelHp.text = [NSString stringWithFormat:@"%i", (int)info.hp];
    _labelAtk.text = [NSString stringWithFormat:@"%i", (int)info.atk];
    _labelArm.text = [NSString stringWithFormat:@"%i", (int)info.arm];
    _labelExp.text = [NSString stringWithFormat:@"%i", (int)info.expJap];
    _labelGold.text = [NSString stringWithFormat:@"%i", (int)info.gold];
    _labelWeaklevel.text = [NSString stringWithFormat:@"%i", (int)info.weakLevel];
    _labelWeight.text = [NSString stringWithFormat:@"%i", (int)info.weight];
}

@end
