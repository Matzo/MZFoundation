//
//  MZTableViewRow.h
//  MZFoundation
//
//  Created by Keisuke Matsuo on 2015/01/08.
//  Copyright (c) 2015 Keisuke Matsuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MZTableViewRow : NSObject
@property (nonatomic, strong) id item;
@property (nonatomic, assign) BOOL isFirstDisplay;
@property (nonatomic, strong) Class cellClass;
@end
