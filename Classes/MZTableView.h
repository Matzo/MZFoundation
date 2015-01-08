//
//  MZTableView.h
//  MZFoundation
//
//  Created by Keisuke Matsuo on 2015/01/08.
//  Copyright (c) 2015 Keisuke Matsuo. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MZTableView;

@protocol MZTableViewDelegate <NSObject>
- (void)tableView:(MZTableView*)tableView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;
@end

// Implement this protocol in your cell class that can be bound to MZTableView
@protocol MZTableViewCellProtocol <NSObject>
@optional
- (void)setItem:(id)item withTableView:(MZTableView*)tableView indexPath:(NSIndexPath*)indexPath;
- (void)displayForTheFirstTimeWithTableView:(MZTableView*)tableView indexPath:(NSIndexPath*)indexPath;
+ (CGFloat)estimatedHeightForItem:(id)item withTableView:(MZTableView*)tableView indexPath:(NSIndexPath*)indexPath;
+ (CGFloat)heightForItem:(id)item withTableView:(MZTableView*)tableView indexPath:(NSIndexPath*)indexPath;
@end


@interface MZTableView : UITableView
@property (nonatomic, strong, readonly) NSArray *sections;
@property (nonatomic, assign) id<MZTableViewDelegate> mz_delegate;

- (id)itemAtIndexPath:(NSIndexPath*)indexPath;
- (void)bindItem:(id)item toCell:(Class)cellClass;
- (void)unbindItem:(id)item;
- (void)unbindItemAtIndexPath:(NSIndexPath*)indexPath;

@end

