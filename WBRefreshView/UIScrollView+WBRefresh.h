//
//  UIScrollView+WBRefresh.h
//  上下拉刷新
//
//  Created by Double on 15/9/27.
//  Copyright (c) 2015年 wdabo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBRefreshBaseView.h"

@class WBRefreshHeaderView;
@class WBRefreshFooterView;

@interface UIScrollView (WBRefresh)

- (WBRefreshHeaderView *)addHeaderWithRefreshHandler:(WBRefreshedHandler)refreshHandler;
- (WBRefreshFooterView *)addFooterWithRefreshHandler:(WBRefreshedHandler)refreshHandler;

@end
