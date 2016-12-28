//
//  DMTableHeaderView.h
//  dqxMonster
//
//  Created by HANSHAOWEN on 16/12/7.
//  Copyright © 2016年 HANSHAOWEN. All rights reserved.
//

#ifndef DMTableHeaderView_h
#define DMTableHeaderView_h

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT NSString *const kDMTableHeaderViewID;

@interface DMTableHeaderView : UITableViewHeaderFooterView

+ (CGFloat)viewHeight;

@property (strong, nonatomic) UILabel *titleLabel;

@end

#endif /* DMTableHeaderView_h */
