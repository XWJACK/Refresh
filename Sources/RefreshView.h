//
//  RefreshView.h
//  Refresh
//
//  Created by Jack on 2018/4/13.
//  Copyright © 2018 XWJACK. All rights reserved.
//

#import <UIKit/UIKit.h>

/// Base view for refresh
@interface RefreshView : UIView
#pragma property
@property(nonatomic, weak) UIScrollView *scrollView;
/// Is refreshing.
@property(nonatomic, readonly) BOOL isRefreshing;
/// Origin scrollview inset(using when refresh completed).
@property(nonatomic) UIEdgeInsets originInsets;
/// Refresh block.
@property(nonatomic, strong) RefreshBlock refreshBlock;
/// Refresh state.
@property(nonatomic) RefreshState state;
#pragma Subclass custom
/// Custom scrollview refreshing inset.
@property(nonatomic, readonly) UIEdgeInsets refreshingInset;
/// Custom is can refresh.
@property(nonatomic, readonly) BOOL isCanRefresh;
/// Custom default frame for refresh view.
@property(nonatomic, readonly) CGRect defaultFrame;

- (void)beginRefreshing;
- (void)endRefreshing;
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change;
- (void)scrollViewContentSizeDidChange:(NSDictionary *)chang;
@end
