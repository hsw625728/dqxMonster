//
//  DMTableMonsterListCell.m
//  dqxMonster
//
//  Created by HANSHAOWEN on 16/12/28.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DMTableMonsterListCell.h"
#import "View+MASAdditions.h"
#import "DMMonsterDetailInfo.h"

NSString *const kDMTableMonsterListCellID = @"kDMTableMonsterListCellID";

@interface DMTableMonsterListCell ()

@property (strong, nonatomic) UIImageView *leftImageView;
@property (strong, nonatomic) UILabel *labelName;
@property (strong, nonatomic) UILabel *labelCategroy;
@property (strong, nonatomic) UILabel *labelAtk;
@property (strong, nonatomic) UILabel *labelArm;
@property (strong, nonatomic) UILabel *labelExp;
@property (strong, nonatomic) UILabel *labelGold;
@property (strong, nonatomic) UILabel *labelWeakLevel;

@end

@implementation DMTableMonsterListCell

#pragma mark - Class Method

+ (CGFloat)cellHeight {
    return 40;
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
    
    CGFloat contentViewWidth = CGRectGetWidth([UIScreen mainScreen ].applicationFrame);
    //CGFloat lableX = ICON_WIDE + 8*2;
    const float WIDTH = contentViewWidth/16;
    _leftImageView = ({
        UIImageView *imageView = [UIImageView new];
        imageView.contentMode = UIViewContentModeCenter;
        [self.contentView addSubview:imageView];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.sizeOffset(CGSizeMake(ICON_WIDE, ICON_HEIGH));
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(8);
        }];
        
        imageView;
    });
    
    _labelName = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(13);
        label.textColor = DMLightBlackTextColor;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(1);
            make.left.equalTo(self.contentView).offset(ICON_WIDE + 16);
        }];
        
        label;
    });
    
    
    _labelCategroy = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(9);
        label.textColor = DMLightBlackTextColor;
        label.numberOfLines = 2;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_centerY).offset(2);
            make.left.equalTo(self.contentView).offset(ICON_WIDE + 22);
        }];
        
        label;
    });
    
    _labelWeakLevel = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(9);
        label.textColor = DMLightBlackTextColor;
        label.numberOfLines = 2;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(3);
            make.left.equalTo(_labelName.mas_left).offset(4*WIDTH);
        }];
        
        label;
    });
    
    _labelExp = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(9);
        label.textColor = DMLightBlackTextColor;
        label.numberOfLines = 2;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_centerY).offset(2);
            make.left.equalTo(_labelName.mas_left).offset(3*WIDTH);
        }];
        
        label;
    });
    
    _labelGold = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(9);
        label.textColor = DMLightBlackTextColor;
        label.numberOfLines = 2;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(3);
            make.left.equalTo(_labelName.mas_left).offset(8*WIDTH);
        }];
        
        label;
    });
    
    _labelAtk = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(9);
        label.textColor = DMLightBlackTextColor;
        label.numberOfLines = 2;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_centerY).offset(2);
            make.left.equalTo(_labelName.mas_left).offset(6*WIDTH);
        }];
        
        label;
    });
    
    _labelArm = ({
        UILabel *label = [UILabel new];
        label.backgroundColor = [UIColor whiteColor];
        label.font = FontWithSize(9);
        label.textColor = DMLightBlackTextColor;
        label.numberOfLines = 2;
        [self.contentView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_centerY).offset(2);
            make.left.equalTo(_labelName.mas_left).offset(9*WIDTH);
        }];
        
        label;
    });
    
    UIImageView *forwardView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"forward_info"]];
    [self.contentView addSubview:forwardView];
    [forwardView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.sizeOffset(CGSizeMake(6, 10));
        make.centerY.equalTo(self.contentView);
        //make.left.greaterThanOrEqualTo(_titleLabel.mas_right).offset(8);
        make.right.equalTo(self.contentView).offset(-8);
    }];
}

-(void)setMonsterName:(NSString*)name
{
    _labelName.text = name;
    AppDelegate *delegate = (AppDelegate *) [[UIApplication sharedApplication] delegate];
    DMMonsterDetailInfo *info = [delegate.gMonsterInfo objectForKey:name];
    
    
    _labelCategroy.text = info.category;
    _labelAtk.text = [NSString stringWithFormat:@"攻击力(%i)", (int)info.atk];
    _labelArm.text = [NSString stringWithFormat:@"防御力(%i)", (int)info.arm ];
    _labelExp.text = [NSString stringWithFormat:@"经验值(%i)", (int)info.expJap];
    _labelGold.text = [NSString stringWithFormat:@"金币(%i)", (int)info.gold];
    _labelWeakLevel.text = [NSString stringWithFormat:@"汗泪等级(%i)", (int)info.weakLevel];
    _leftImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@_small", name]];
}

@end
