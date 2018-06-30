//
//  RefreshFooterView.h
//  Refresh
//
//  Created by Jack on 2018/5/23.
//  Copyright © 2018 XWJACK. All rights reserved.
//

#import "RefreshView.h"

/// Abstract refresh header view.
@interface RefreshFooterView : RefreshView
+ (instancetype)refreshViewWithRefreshBlock:(RefreshBlock)block;

/// End refreshing with no more data.
- (void)endRefreshingWithNoMoreData;

/// Subclass can override it, given an offset to keep footer display out of tableView.
///
/// default is CGPointZero to keep footer below tableView contentOffset.
- (CGPoint)offsetRevise;
@end

@interface VerticalRefreshFooterView: RefreshFooterView
@end

@interface HorizontalRefreshFooterView: RefreshFooterView
@end
