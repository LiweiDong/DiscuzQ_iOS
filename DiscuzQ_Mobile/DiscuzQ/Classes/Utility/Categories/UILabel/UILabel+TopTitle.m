//
//  UILabel+TopTitle.m
//  DiscuzQ
//
//  Created by WebersonGao on 2019/12/23.
//  Copyright © 2019 WebersonGao. All rights reserved.
//

#import "UILabel+TopTitle.h"

@implementation UILabel (TopTitle)

- (void)setText:(NSString *)text andImageName:(NSString *)imageName andSize:(CGSize)size andPosition:(AttchPosition)position {
    
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    attch.image = [UIImage imageNamed:imageName];
//    attch.bounds = CGRectMake(0, -2, 34, 17);
    attch.bounds = CGRectMake(0, -2, size.width, size.height);
    [self P_SetText:text andAttch:attch andSize:size andPosition:position];
    
}

- (void)setText:(NSString *)text andImage:(UIImage *)image andSize:(CGSize)size andPosition:(AttchPosition)position {
    
    NSTextAttachment *attch = [[NSTextAttachment alloc] init];
    attch.image = image;
    //    attch.bounds = CGRectMake(0, -2, 34, 17);
    attch.bounds = CGRectMake(0, -2, size.width, size.height);
    [self P_SetText:text andAttch:attch andSize:size andPosition:position];
}

- (void)P_SetText:(NSString *)text andAttch:(NSTextAttachment *)attch andSize:(CGSize)size andPosition:(AttchPosition)position {
    NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];
    NSMutableAttributedString *attri;
    if (position == P_before) {
        attri =  [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@" %@",text]];
        [attri insertAttributedString:string atIndex:0];
        
    } else if (position == P_after) {
        attri =  [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ ",text]];
        [attri insertAttributedString:string atIndex:attri.length];
        
    }
    
    self.attributedText = attri;
}

@end
