### WBRefreshView

### Demo

		#import "WBRefreshFooterView.h"
		#import "WBRefreshHeaderView.h"
		#import "UIScrollView+WBRefresh.h"

		UITableView *mTableView
		WBRefreshHeaderView *headerView
		WBRefreshFooterView *footerView;
		- (void)addRefreshView {
		    
		    __weak __typeof(self)weakSelf = self;
		    
		    //下拉刷新
		    headerView = [mTableView addHeaderWithRefreshHandler:^(WBRefreshBaseView *refreshView) {
		        [weakSelf refreshAction];
		    }];
		    
		    //上拉加载更多
		    footerView = [mTableView addFooterWithRefreshHandler:^(WBRefreshBaseView *refreshView) {
		        [weakSelf loadMoreAction];
		    }];
		    
		    //自动刷新
		    footerView.autoLoadMore = YES;
		}
		- (void)refreshAction {
		    __weak UITableView *weakTableView = mTableView;
		    __weak WBRefreshHeaderView *weakHeaderView = headerView;
		    
		    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		        rows = 12;
		        [weakTableView reloadData];
		        [weakHeaderView endRefresh];
		    });
		}
		- (void)loadMoreAction {
		    __weak UITableView *weakTableView = mTableView;
		    __weak WBRefreshFooterView *weakFooterView = footerView;
		    
		    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		        rows += 12;
		        [weakTableView reloadData];
		        [weakFooterView endRefresh];
		    });
		}