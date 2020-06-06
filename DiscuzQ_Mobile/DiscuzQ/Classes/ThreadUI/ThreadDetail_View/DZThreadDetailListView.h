//
//  DZThreadDetailListView.h
//  DiscuzQ
//
//  Created by WebersonGao on 2020/5/20.
//  Copyright © 2020 WebersonGao. All rights reserved.
//

#import "DZBaseTableView.h"

@interface DZThreadDetailListView : DZBaseTableView

-(void)updateThreadHeadDetail:(DZQDataThread *)dataModel;

-(void)updateThreadPostDetail:(NSArray<DZQDataPost *> *)dataPostList;



@end


