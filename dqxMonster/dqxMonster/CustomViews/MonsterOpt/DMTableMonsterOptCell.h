//
//  DMTableMonsterOptCell.h
//  dqxMonster
//
//  Created by SHAOWENn HAN on 17/1/2.
//  Copyright © 2017年 HANSHAOWEN. All rights reserved.
//

#ifndef DMTableMonsterOptCell_h
#define DMTableMonsterOptCell_h

#import "DMBaseCell.h"

FOUNDATION_EXPORT NSString *const kDMTableMonsterOptCellID;


@interface DMTableMonsterOptCell : DMBaseCell

+ (CGFloat)cellHeight;
-(void)setSelectType:(NSString*)name minValue:(NSString*)min maxValue:(NSString*)max;

@end

#endif /* DMTableMonsterOptCell_h */
