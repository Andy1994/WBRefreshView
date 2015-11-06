### WBRefreshView

### Demo

		#import "FCXRefreshFooterView.h"
		#import "FCXRefreshHeaderView.h"
		#import "UIScrollView+FCXRefresh.h"

		UITableView *mTableView
		FCXRefreshHeaderView *headerView
		FCXRefreshFooterView *footerView;
		- (void)addRefreshView {
		    
		    __weak __typeof(self)weakSelf = self;
		    
		    //下拉刷新
		    headerView = [mTableView addHeaderWithRefreshHandler:^(FCXRefreshBaseView *refreshView) {
		        [weakSelf refreshAction];
		    }];
		    
		    //上拉加载更多
		    footerView = [mTableView addFooterWithRefreshHandler:^(FCXRefreshBaseView *refreshView) {
		        [weakSelf loadMoreAction];
		    }];
		    
		    //自动刷新
		    footerView.autoLoadMore = self.autoLoadMore;
		}
		- (void)refreshAction {
		    __weak UITableView *weakTableView = mTableView;
		    __weak FCXRefreshHeaderView *weakHeaderView = headerView;
		    
		    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		        rows = 12;
		        [weakTableView reloadData];
		        [weakHeaderView endRefresh];
		    });
		}
		- (void)loadMoreAction {
		    __weak UITableView *weakTableView = mTableView;
		    __weak FCXRefreshFooterView *weakFooterView = footerView;
		    
		    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		        rows += 12;
		        [weakTableView reloadData];
		        [weakFooterView endRefresh];
		    });
		}