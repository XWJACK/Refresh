//
//  RefreshView.m
//  Refresh
//
//  Created by Jack on 2018/4/13.
//  Copyright © 2018 XWJACK. All rights reserved.
//

#import "RefreshView.h"

static NSString *const RefreshKeyPathContentOffset = @"contentOffset";
//static NSString *const RefreshKeyPathContentInset = @"contentInset";
static NSString *const RefreshKeyPathContentSize = @"contentSize";

@implementation RefreshView
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.state = RefreshStateNormal;
        self.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (void)willMoveToSuperview:(UIView *)newSuperview {
    [super willMoveToSuperview:newSuperview];
    
    self.originInsets = self.scrollView.contentInset;
    /// Init size
    self.frame = self.defaultFrame;
    
    [self removeObservers];
    [self addObservers];
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    if (!self.userInteractionEnabled) return;
    
    
    if ([keyPath isEqualToString:RefreshKeyPathContentSize]) {
        [self scrollViewContentSizeDidChange:change];
    }
    
    
    if (self.hidden) return;
    if (!self.isRefreshing && [keyPath isEqualToString:RefreshKeyPathContentOffset]) {
        [self scrollViewContentOffsetDidChange:change];
    }
}

#pragma mark Subclass Override

- (UIEdgeInsets)refreshingInset {
    return UIEdgeInsetsZero;
}
- (BOOL)isCanRefresh {
    return NO;
}

#pragma mark Methods

- (void)addObservers {
    NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
    [self.scrollView addObserver:self forKeyPath:RefreshKeyPathContentOffset options:options context:nil];
    [self.scrollView addObserver:self forKeyPath:RefreshKeyPathContentSize options:options context:nil];
}
- (void)removeObservers {
    [self.superview removeObserver:self forKeyPath:RefreshKeyPathContentOffset];
    [self.superview removeObserver:self forKeyPath:RefreshKeyPathContentSize];
}
- (BOOL)isRefreshing {
    return self.state == RefreshStateRefreshing;
}
- (void)beginRefreshing {
    if (self.isRefreshing)
        return;
    
    self.state = RefreshStateRefreshing;
    __weak typeof(self) wself = self;
    [UIView animateWithDuration:0.5 animations:^{
        wself.scrollView.contentInset = wself.refreshingInset;
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            if (wself.refreshBlock)
                wself.refreshBlock();
        });
    }];
}
- (void)endRefreshing {
    if (!self.isRefreshing)
        return;
    
    self.state = RefreshStateNormal;
    __weak typeof(self) wself = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [UIView animateWithDuration:0.4 animations:^{
            wself.scrollView.contentInset = wself.originInsets;
        }];
    });
    
}
- (void)scrollViewContentOffsetDidChange:(NSDictionary *)change {
    if (self.state == RefreshStateRefreshing) {
        self.scrollView.contentInset = self.refreshingInset;
        return;
    }
    
    if (self.scrollView.isDragging) {
        self.state = self.isCanRefresh ? RefreshStateWillRefresh : RefreshStateNormal;
    } else if (self.state == RefreshStateWillRefresh) {
        [self beginRefreshing];
    }
}
- (void)scrollViewContentSizeDidChange:(NSDictionary *)change {}
@end
