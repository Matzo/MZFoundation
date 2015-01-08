//
//  MZTableViewRow.m
//  MZFoundation
//
//  Created by Keisuke Matsuo on 2015/01/08.
//  Copyright (c) 2015 Keisuke Matsuo. All rights reserved.
//

#import "MZTableViewRow.h"

@implementation MZTableViewRow

- (id)init {
    self = [super self];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    self.isFirstDisplay = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
