//
//  DZQEmojiModel.m
//  DiscuzQ
//
//  Created by WebersonGao on 2020/7/21.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZQEmojiModel.h"

@implementation DZQEmojiModel


@end

@implementation DZQDataEmoji

+ (NSDictionary *)modelCustomPropertyMapper {
    return @{@"type_id":@"id"};
}

+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{@"attributes" : [DZQCateModel class]};
}

@end
