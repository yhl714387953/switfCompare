//
//  HLView.m
//  switfCompare
//
//  Created by yuhailong on 14-12-11.
//  Copyright (c) 2014年 polystor. All rights reserved.
//

#import "HLView.h"

@implementation HLView

-(void)layoutSubviews{
    [super layoutSubviews];
    self.backgroundColor = [UIColor orangeColor];
}

-(void)getRangeByName:(NSString*)name andCount:(NSInteger)count{
    NSLog(@"%@", [NSString stringWithFormat:@"%@=======%ld", name, count]);
   
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
