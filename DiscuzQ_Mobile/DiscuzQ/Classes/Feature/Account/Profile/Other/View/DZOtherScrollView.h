//
//  DZOtherScrollView.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/26.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DZOtherScrollView : UIScrollView


-(void)updateUserHeader:(DZQBaseUser *)userModel;

- (instancetype)initWithFrame:(CGRect)frame userId:(NSString *)userId;




@end

