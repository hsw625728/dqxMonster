//
//  DMTableDetailCell.h
//  dqxMonster
//
//  Created by HANSHAOWEN on 16/12/7.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#ifndef DMTableDetailCell_h
#define DMTableDetailCell_h
#import "DMBaseCell.h"

FOUNDATION_EXPORT NSString *const kDMTableDetailCellID;

@class DMMonsterDetailItem;

@interface DMTableDetailCell : DMBaseCell

+ (CGFloat)cellHeight;

- (void)configureCellWithSearchItem:(DMMonsterDetailItem *)item;


@end

#endif /* DMTableDetailCell_h */
