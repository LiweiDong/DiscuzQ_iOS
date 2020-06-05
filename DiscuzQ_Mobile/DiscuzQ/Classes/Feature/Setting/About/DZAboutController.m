//
//  DZAboutController.m
//  DiscuzQ
//
//  Created by WebersonGao on 16/12/5.
//  Copyright © 2016年 WebersonGao. All rights reserved.
//

#import "DZAboutController.h"
#import "DZAboutView.h"

@interface DZAboutController ()

@property (nonatomic, strong) DZAboutView *aboutView;

@end

@implementation DZAboutController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"关于";
    self.aboutView = [[DZAboutView alloc] initWithFrame:KView_OutNavi_Bounds];
    [self.view addSubview:self.aboutView];
}

@end
