//
//  DMTableMonsterListCell.h
//  dqxMonster
//
//  Created by HANSHAOWEN on 16/12/28.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#ifndef DMTableMonsterListCell_h
#define DMTableMonsterListCell_h

#import "DMBaseCell.h"

FOUNDATION_EXPORT NSString *const kDMTableMonsterListCellID;


@interface DMTableMonsterListCell : DMBaseCell

+ (CGFloat)cellHeight;
-(void)setMonsterName:(NSString*)name;

@end

#endif /* DMTableMonsterListCell_h */
