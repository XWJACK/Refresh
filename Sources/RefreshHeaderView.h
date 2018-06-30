//
//  RefreshHeaderView.h
//  Refresh
//
//  Created by Jack on 2018/5/23.
//  Copyright © 2018 XWJACK. All rights reserved.
//

#import "RefreshView.h"

/// Abstract refresh header view.
@interface RefreshHeaderView : RefreshView
+ (instancetype)refreshViewWithRefreshBlock:(RefreshBlock)block;
@end

@interface HorizontalRefreshHeaderView: RefreshHeaderView
@end

@interface VerticalRefreshHeaderView: RefreshHeaderView
@end
