//
//  UIScrollView+WBRefresh.m
//  上下拉刷新
//
//  Created by Double on 15/9/27.
//  Copyright (c) 2015年 wdabo. All rights reserved.
//

#import "UIScrollView+WBRefresh.h"
#import "WBRefreshHeaderView.h"
#import "WBRefreshFooterView.h"

@implementation UIScrollView (WBRefresh)

- (WBRefreshHeaderView *)addHeaderWithRefreshHandler:(WBRefreshedHandler)refreshHandler {
    
    WBRefreshHeaderView *header = [WBRefreshHeaderView headerWithRefreshHandler:refreshHandler];
    header.scrollView = self;
    return header;
    
}

- (WBRefreshFooterView *)addFooterWithRefreshHandler:(WBRefreshedHandler)refreshHandler {
    
    WBRefreshFooterView *footer = [WBRefreshFooterView footerWithRefreshHandler:refreshHandler];
    footer.scrollView = self;
    return footer;
}

@end
