//
//  RefreshFooterView.m
//  Refresh
//
//  Created by Jack on 2018/5/23.
//  Copyright © 2018 XWJACK. All rights reserved.
//

#import "RefreshFooterView.h"

@implementation RefreshFooterView

+ (instancetype)refreshViewWithRefreshBlock:(RefreshBlock)block {
    NSAssert(NO, @"Sub class must override this to give custom instanse");
    return nil;
}

- (void)endRefreshing {
    [super endRefreshing];
    /// Keep footer endRefresh when from no more data to normal status.
    self.state = RefreshStateNormal;
}
- (void)endRefreshingWithNoMoreData {
    [self endRefreshing];
    self.state = RefreshStateNoMoreData;
}
- (CGPoint)offsetRevise {
    return CGPointZero;
}
- (BOOL)isCanRefresh {
    return self.state != RefreshStateNoMoreData;
}
@end

#pragma mark - VerticalRefreshFooterView

static CGFloat const VerticalFooterHeight = 54;

@implementation VerticalRefreshFooterView
+ (instancetype)refreshViewWithRefreshBlock:(RefreshBlock)block {
    return [self new];
}
- (CGRect)defaultFrame {
    return CGRectMake(0, -VerticalFooterHeight, self.scrollView.bounds.size.width, VerticalFooterHeight);
}
- (UIEdgeInsets)refreshingInset {
    UIEdgeInsets inset = self.scrollView.contentInset;
    
    if (self.scrollView.contentSize.height <= self.scrollView.bounds.size.height) {
        inset.top = -VerticalFooterHeight;
    } else {
        inset.bottom = VerticalFooterHeight;
    }
    return inset;
}
- (BOOL)isCanRefresh {
    return [super isCanRefresh] ? self.scrollView.contentOffset.y <= -VerticalFooterHeight : NO;
}
- (CGPoint)offsetRevise {
    return CGPointMake(0, MAX(self.scrollView.contentSize.height, self.scrollView.bounds.size.height));
}
@end

#pragma mark - HorizontalRefreshFooterView

static CGFloat const HorizontalFooterWidth = 44;

@implementation HorizontalRefreshFooterView
+ (instancetype)refreshViewWithRefreshBlock:(RefreshBlock)block {
    return [self new];
}
- (CGRect)defaultFrame {
    return CGRectMake(-HorizontalFooterWidth, 0, HorizontalFooterWidth, self.scrollView.bounds.size.height);
}
- (UIEdgeInsets)refreshingInset {
    UIEdgeInsets inset = self.scrollView.contentInset;
    
    if (self.scrollView.contentSize.width <= self.scrollView.bounds.size.width) {
        inset.left = -HorizontalFooterWidth;
    } else {
        inset.right = HorizontalFooterWidth;
    }
    return inset;
}
- (BOOL)isCanRefresh {
    return [super isCanRefresh] ? self.scrollView.contentOffset.x + self.scrollView.bounds.size.width - self.offsetRevise.x >= HorizontalFooterWidth : NO;
}
- (CGPoint)offsetRevise {
    return CGPointMake(MAX(self.scrollView.contentSize.width, self.scrollView.bounds.size.width), 0);
}
@end
