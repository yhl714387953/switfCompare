//
//  HLView.h
//  switfCompare
//
//  Created by yuhailong on 14-12-11.
//  Copyright (c) 2014年 polystor. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HLView;
@protocol HLViewDelegate <NSObject>

@optional
-(void)hlViewClicked:(HLView*)view;

@end

@interface HLView : UIView

@property(nonatomic, weak)id<HLViewDelegate> delegate;

-(void)getRangeByName:(NSString*)name andCount:(NSInteger)count;

@end
