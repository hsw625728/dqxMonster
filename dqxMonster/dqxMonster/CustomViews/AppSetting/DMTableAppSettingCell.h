//
//  DMTableAppSettingCell.h
//  dqxMonster
//
//  Created by SHAOWENn HAN on 16/12/17.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#ifndef DMTableAppSettingCell_h
#define DMTableAppSettingCell_h

#import "DMBaseCell.h"

FOUNDATION_EXPORT NSString *const kDMTableAppSettingCellID;

@interface DMTableAppSettingCell : DMBaseCell

+ (CGFloat)cellHeight;

- (void)configureCellWithTitle:(NSString *)title imageName:(NSString *)imageName atIndexPath:(NSIndexPath *)indexPath;
@end

#endif /* DMTableAppSettingCell_h */
