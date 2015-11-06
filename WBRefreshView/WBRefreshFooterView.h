//
//  WBRefreshFooterView.h
//  上下拉刷新
//
//  Created by Double on 15/9/27.
//  Copyright (c) 2015年 wdabo. All rights reserved.
//

#import "WBRefreshBaseView.h"

@interface WBRefreshFooterView : WBRefreshBaseView

/**
 *  是否自动加载更多，默认上拉超过scrollView的内容高度时，直接加载更多
 */
@property (nonatomic, unsafe_unretained) BOOL autoLoadMore;



+ (instancetype)footerWithRefreshHandler:(WBRefreshedHandler)refreshHandler;

//显示没有更多数据
- (void)showNoMoreData;
//重置没有更多的数据（消除没有更多数据的状态）
- (void)resetNoMoreData;

@end
