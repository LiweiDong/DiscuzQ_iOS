//
//  CollectionForumCell.m
//  DiscuzQ
//
//  Created by WebersonGao on 17/1/22.
//  Copyright © 2017年 WebersonGao. All rights reserved.
//

#import "CollectionForumCell.h"

@implementation CollectionForumCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self commitInit];
    }
    return self;
}

- (void)commitInit {
    self.iconV = [[UIImageView alloc] init];
    self.iconV.image = [UIImage imageNamed:@"discuz_cor_logo"];
    [self.contentView addSubview:self.iconV];
    
    self.textLab = [[UILabel alloc] init];
    self.textLab.font = KFont(17);
    self.textLab.textColor = K_Color_MainTitle;
    [self.contentView addSubview:self.textLab];
    
    self.cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.cancelBtn.cs_acceptEventInterval = 1;
    [self.cancelBtn setImage:[UIImage imageNamed:@"bar_xings"] forState:UIControlStateNormal];
    [self.contentView addSubview:self.cancelBtn];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    self.iconV.frame = CGRectMake(15, 10, 40, 40);
    self.iconV.layer.masksToBounds = YES;
    self.iconV.layer.cornerRadius = 6;
    self.textLab.frame = CGRectMake(CGRectGetMaxX(self.iconV.frame) + 10, CGRectGetMinY(self.iconV.frame), 150, CGRectGetHeight(self.iconV.frame));
    self.cancelBtn.frame = CGRectMake(KScreenWidth - 25 - 15, 17, 25, 25);
}

@end
