//
//  DZTermsLabel.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/3/8.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "DZTermsLabel.h"
#import "QCheckBox.h"

@interface DZTermsLabel()<QCheckBoxDelegate>

@end

@implementation DZTermsLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configTermsLabel];
    }
    return self;
}

- (void)configTermsLabel {
    QCheckBox *checkBox= [[QCheckBox alloc] initWithDelegate:self];;
    checkBox.frame = CGRectMake(0, 0, 80, 40);
    [checkBox setTitle:@"我同意:" forState:UIControlStateNormal];
    checkBox.titleLabel.font = [UIFont systemFontOfSize:15.0];
    [checkBox setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [checkBox setTitleColor:KBlack_Color forState:UIControlStateNormal];
    [checkBox setImage:[UIImage imageNamed:@"dz_icon_check"] forState:UIControlStateNormal];
    [checkBox setImage:[UIImage imageNamed:@"check_select"] forState:UIControlStateSelected];
    [checkBox setChecked:YES];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.frame = CGRectMake(CGRectGetMaxX(checkBox.frame), 0, 80, 40);
    btn.titleLabel.font = [UIFont systemFontOfSize:15.0];
    btn.titleLabel.textAlignment = NSTextAlignmentLeft;
    [btn setTitle:checkTwoStr(DZ_APP_Name, @"服务条款") forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(readTerms) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:checkBox];
    [self addSubview:btn];
}

- (void)readTerms {
    if (self.readTermBlock) {
        self.readTermBlock();
    }
}

- (void)didSelectedCheckBox:(QCheckBox *)checkbox checked:(BOOL)checked {
    self.isAgree = checked;
}

@end
