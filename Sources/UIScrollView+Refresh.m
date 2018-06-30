//
//  UIScrollView+Refresh.m
//  Refresh
//
//  Created by Jack on 2018/4/13.
//  Copyright © 2018 XWJACK. All rights reserved.
//

#import "UIScrollView+Refresh.h"
#import "RefreshHeaderView.h"
#import "RefreshFooterView.h"

static CGFloat const HorizontalHeaderTag = 1024;
static CGFloat const HorizontalFooterTag = 2048;

static CGFloat const VerticalHeaderTag = 3092;
static CGFloat const VerticalFooterTag = 4116;

@implementation UIScrollView (Refresh)

- (HorizontalRefreshHeaderView *)horizontal_header {
    return [self viewWithTag:HorizontalHeaderTag];
}
- (void)setHorizontal_header:(HorizontalRefreshHeaderView *)horizontal_header {
    if (horizontal_header != self.horizontal_header) {
        [self.horizontal_header removeFromSuperview];
        
        horizontal_header.scrollView = self;
        horizontal_header.tag = HorizontalHeaderTag;
        [self insertSubview:horizontal_header atIndex:0];
    }
}
- (HorizontalRefreshFooterView *)horizontal_footer {
    return [self viewWithTag:HorizontalFooterTag];
}
- (void)setHorizontal_footer:(HorizontalRefreshFooterView *)horizontal_footer {
    if (horizontal_footer != self.horizontal_footer) {
        [self.horizontal_footer removeFromSuperview];
        
        horizontal_footer.scrollView = self;
        horizontal_footer.tag = HorizontalFooterTag;
        [self insertSubview:horizontal_footer atIndex:0];
    }
}

- (VerticalRefreshHeaderView *)vertical_header {
    return [self viewWithTag:VerticalHeaderTag];
}
- (void)setVertical_header:(VerticalRefreshHeaderView *)vertical_header {
    if (vertical_header != self.vertical_header) {
        [self.vertical_header removeFromSuperview];
        
        vertical_header.scrollView = self;
        vertical_header.tag = VerticalHeaderTag;
        [self insertSubview:vertical_header atIndex:0];
    }
}
- (VerticalRefreshFooterView *)vertical_footer {
    return [self viewWithTag:VerticalFooterTag];
}
- (void)setVertical_footer:(VerticalRefreshFooterView *)vertical_footer {
    if (vertical_footer != self.vertical_footer) {
        [self.vertical_footer removeFromSuperview];
        
        vertical_footer.scrollView = self;
        vertical_footer.tag = VerticalFooterTag;
        [self insertSubview:vertical_footer atIndex:0];
    }
}
@end
