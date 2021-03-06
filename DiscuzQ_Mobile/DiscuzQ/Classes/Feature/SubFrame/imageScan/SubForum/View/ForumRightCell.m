//
//  ForumRightCell.m
//  DiscuzQ
//
//  Created by piter on 2018/1/30.
//  Copyright © 2018年 WebersonGao. All rights reserved.
//

#import "ForumRightCell.h"
#import "ForumNodeModel.h"
#import "DZBaseForumModel.h"
#import "NSString+MoreMethod.h"
#import "DZCollectButton.h"

@interface ForumRightCell()

@property (nonatomic, strong) UILabel *numLab;
@property (nonatomic, strong) UILabel *titleLab;
@property (nonatomic, strong) UILabel *postsLab;
@property (nonatomic, strong) UIImageView *iconV;
@property (nonatomic, strong) DZBaseForumModel *info;
@property (nonatomic, strong) DZCollectButton *collectionBtn;

@end

@implementation ForumRightCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self p_setupRightCellView];
    }
    return self;
}

- (void)p_setupRightCellView {
    self.separatorInset = UIEdgeInsetsMake(0, 63, 0, 0);
    self.contentView.backgroundColor = [UIColor whiteColor];
    
    self.iconV = [[UIImageView alloc] init];
    [self.contentView addSubview:self.iconV];
    
    self.titleLab = [[UILabel alloc] init];
    self.titleLab.font = [UIFont systemFontOfSize:16.5];
    self.titleLab.textColor = K_Color_MainTitle;
    [self.contentView addSubview:self.titleLab];
    
    self.numLab = [[UILabel alloc] init];
    self.numLab.font = KFont(11);
    self.numLab.textColor = K_Color_Message;
    [self.contentView addSubview:self.numLab];
    
    self.postsLab = [[UILabel alloc] init];
    self.postsLab.font = KFont(11);
    self.postsLab.textColor = K_Color_Message;
    [self.contentView addSubview:self.postsLab];
    
    //收藏按钮
    self.collectionBtn = [DZCollectButton buttonWithType:UIButtonTypeCustom];
    self.collectionBtn.titleLabel.font = KFont(12);
    self.collectionBtn.layer.borderWidth = 0.6;
    self.collectionBtn.cs_acceptEventInterval = 1;
    self.collectionBtn.hidden = YES;
    
    self.collectionBtn.lighted = YES;
    
    [self.contentView addSubview:self.collectionBtn];
    
    [self.iconV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(@10);
        make.bottom.equalTo(@-10);
        make.width.equalTo(self.iconV.mas_height);
    }];
    
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconV.mas_right).offset(10);
        make.top.equalTo(self.iconV).offset(-1);
        make.right.equalTo(self).offset(-10);
        make.height.equalTo(self.iconV).multipliedBy(0.6);
    }];
    
    self.numLab.preferredMaxLayoutWidth = 80;
    [self.numLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab);
        make.top.equalTo(self.titleLab.mas_bottom).offset(2);
        //        make.width.equalTo(@80);
        make.bottom.equalTo(self.iconV.mas_bottom);
    }];
    
    self.postsLab.preferredMaxLayoutWidth = 80;
    [self.postsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.numLab.mas_right).offset(15);
        make.top.height.equalTo(self.numLab);
    }];
    
    [self.collectionBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(self).offset(-15);
        make.top.equalTo(self.iconV);
        make.width.equalTo(@45);
        make.height.equalTo(@22);
    }];
    
    [self layoutIfNeeded];
    
    [self.collectionBtn addTarget:self action:@selector(collectionAction:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)collectionAction:(DZCollectButton *)sender {
    
    if (self.collectionBlock) {
        self.collectionBlock(sender,self.info);
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.iconV.layer.masksToBounds = YES;
    self.iconV.layer.cornerRadius = 5;
    self.collectionBtn.layer.masksToBounds = YES;
    self.collectionBtn.layer.cornerRadius = 4;
}

/**
 * 设置数据
 */
- (void)updateRightCellInfo:(DZBaseForumModel *)infoModel {
    if ([DataCheck isValidString:infoModel.name]) {
        self.titleLab.text = infoModel.name;
    } else {
        if ([DataCheck isValidString:infoModel.todayposts] && [infoModel.todayposts integerValue] > 0) {
            NSString *todayposts = [NSString stringWithFormat:@"(%@)",infoModel.todayposts];
            NSString *forumName = [NSString stringWithFormat:@"%@%@",infoModel.name,todayposts];
            NSMutableAttributedString *att = [[NSMutableAttributedString alloc] initWithString:forumName];
            NSRange todayRange = {infoModel.name.length,todayposts.length};
            [att addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:todayRange];
            [att addAttribute:NSFontAttributeName value:KFont(12) range:todayRange];
            self.titleLab.attributedText = att;
        } else {
            self.titleLab.text = infoModel.name;
        }
    }
    
    _info = infoModel;
    
    if ([DataCheck isValidString:infoModel.threads]) {
        self.numLab.text = [NSString stringWithFormat:@"主题:%@",infoModel.threads];
    } else {
        self.numLab.text = @"主题:-";
    }
    if ([DataCheck isValidString:infoModel.posts]) {
        self.postsLab.text = [NSString stringWithFormat:@"帖数:%@",infoModel.posts];
    } else {
        self.postsLab.text = @"帖数:-";
    }
    
    [self.iconV sd_setImageWithURL:[NSURL URLWithString:infoModel.icon] placeholderImage:[UIImage imageNamed:@"forumCommon"] options:SDWebImageLowPriority | SDWebImageRetryFailed];
    
    
    if ([DataCheck isValidString:infoModel.favorited]) {
        if ([infoModel.favorited isEqualToString:@"1"]) {
            self.collectionBtn.lighted = NO;
        } else {
            self.collectionBtn.lighted = YES;
        }
    }
    
}

@end
