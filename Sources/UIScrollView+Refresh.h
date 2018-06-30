//
//  UIScrollView+Refresh.h
//  Refresh
//
//  Created by Jack on 2018/4/13.
//  Copyright © 2018 XWJACK. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VerticalRefreshHeaderView;
@class VerticalRefreshFooterView;

@class HorizontalRefreshHeaderView;
@class HorizontalRefreshFooterView;

@interface UIScrollView (Refresh)
@property(nonatomic) VerticalRefreshHeaderView *vertical_header;
@property(nonatomic) VerticalRefreshFooterView *vertical_footer;

@property(nonatomic) HorizontalRefreshHeaderView *horizontal_header;
@property(nonatomic) HorizontalRefreshFooterView *horizontal_footer;
@end
