//
//  DMTableMonsterDetailCell.h
//  dqxMonster
//
//  Created by HANSHAOWEN on 16/12/29.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#ifndef DMTableMonsterDetailCell_h
#define DMTableMonsterDetailCell_h

#import "DMBaseCell.h"

FOUNDATION_EXPORT NSString *const kDMTableMonsterDetailCellID;


@interface DMTableMonsterDetailCell : DMBaseCell

+ (CGFloat)cellHeight;
-(void)setMonsterName:(NSString*)name;

@end

#endif /* DMTableMonsterDetailCell_h */
