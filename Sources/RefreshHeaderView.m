//
//  RefreshHeaderView.m
//  Refresh
//
//  Created by Jack on 2018/5/23.
//  Copyright © 2018 XWJACK. All rights reserved.
//

#import "RefreshHeaderView.h"

@implementation RefreshHeaderView

+ (instancetype)refreshViewWithRefreshBlock:(RefreshBlock)block {
    NSAssert(NO, @"Sub class must override this to give custom instanse");
    return nil;
}

@end

#pragma mark - VerticalRefreshHeaderView

static CGFloat const VerticalHeaderHeight = 54;

@implementation VerticalRefreshHeaderView
+ (instancetype)refreshViewWithRefreshBlock:(RefreshBlock)block {
    return [self new];
}
- (CGRect)defaultFrame {
    return CGRectMake(0, -VerticalHeaderHeight, self.scrollView.bounds.size.width, VerticalHeaderHeight);
}
- (UIEdgeInsets)refreshingInset {
    UIEdgeInsets inset = self.scrollView.contentInset;
    inset.top = VerticalHeaderHeight;
    return inset;
}
- (BOOL)isCanRefresh {
    return self.scrollView.contentOffset.y <= -VerticalHeaderHeight;
}
@end

#pragma mark - HorizontalRefreshHeaderView

static CGFloat const HorizontalHeaderWidth = 54;

@implementation HorizontalRefreshHeaderView
+ (instancetype)refreshViewWithRefreshBlock:(RefreshBlock)block {
    return [self new];
}
- (CGRect)defaultFrame {
    return CGRectMake(-HorizontalHeaderWidth, 0, HorizontalHeaderWidth, self.scrollView.bounds.size.height);
}
- (UIEdgeInsets)refreshingInset {
    UIEdgeInsets inset = self.scrollView.contentInset;
    inset.left = HorizontalHeaderWidth;
    return inset;
}
- (BOOL)isCanRefresh {
    return self.scrollView.contentOffset.x <= -HorizontalHeaderWidth;
}
@end
