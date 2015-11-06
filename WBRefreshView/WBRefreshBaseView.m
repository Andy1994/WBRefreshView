//
//  WBRefreshBaseView.m
//  上下拉刷新
//
//  Created by Double on 15/9/27.
//  Copyright (c) 2015年 wdabo. All rights reserved.
//

#import "WBRefreshBaseView.h"

@implementation WBRefreshBaseView

- (void)removeFromSuperview
{
    [self.superview removeObserver:self forKeyPath:@"contentOffset" context:nil];
    [self.superview removeObserver:self forKeyPath:@"contentSize" context:nil];
    
    [super removeFromSuperview];
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    [super willMoveToSuperview:newSuperview];
}

- (instancetype)init {
    
    if (self = [super init]) {
        [self setStateText];
        [self addRefreshContentView];
        self.refreshState = WBRefreshStateNormal;
    }
    return self;
}

- (void)addRefreshContentView {
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    self.frame = CGRectMake(0, -WBLoadingOffsetHeight, screenWidth, WBLoadingOffsetHeight);
    self.backgroundColor = [UIColor clearColor];
    //self.scrollView为空，在这里添加没用
    //[self.scrollView addSubview:self];
}

- (void)setStateText {}

- (void)setScrollView:(UIScrollView *)scrollView {
    
    if (_scrollView != scrollView) {
        _originalEdgeInset = scrollView.contentInset;
        [_scrollView removeObserver:self forKeyPath:@"contentOffset" context:nil];
        [_scrollView removeObserver:self forKeyPath:@"contentSize" context:nil];
        
        _scrollView = scrollView;
        [_scrollView addSubview:self];
        
        [_scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
        [_scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    //正在刷新
    if (self.refreshState == WBRefreshStateLoading) {
        return;
    }
    
    if ([keyPath isEqualToString:@"contentOffset"]) {
        [self scrollViewContentOffsetDidChange];
    } else if ([keyPath isEqualToString:@"contentSize"]) {
        [self scrollViewContentSizeDidChange];
    }
}

- (void)scrollViewContentOffsetDidChange {}
- (void)scrollViewContentSizeDidChange {}

- (void)startRefresh {}

- (void)endRefresh {
    
    self.refreshState = WBRefreshStateNormal;
}


@end
