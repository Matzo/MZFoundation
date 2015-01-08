//
//  MZTableViewSection.h
//  MZFoundation
//
//  Created by Keisuke Matsuo on 2015/01/08.
//  Copyright (c) 2015 Keisuke Matsuo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MZTableViewSection : NSObject
@property (nonatomic, strong, readonly) NSArray *rows;

- (void)bindItem:(id)item toCell:(Class)cellClass;
- (void)unbindItem:(id)item;
- (void)unbindItemAtIndex:(NSInteger)index;

@end
