//
//  MZTableView.m
//  MZFoundation
//
//  Created by Keisuke Matsuo on 2015/01/08.
//  Copyright (c) 2015 Keisuke Matsuo. All rights reserved.
//

#import "MZTableView.h"
#import "MZTableViewSection.h"
#import "MZTableViewRow.h"

@interface MZTableView() <
    UITableViewDataSource,
    UITableViewDelegate
>

@property (nonatomic, strong) NSMutableArray *editableSections;
    
@end

@implementation MZTableView

- (id)init {
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (void)awakeFromNib {
    [self initialize];
}

- (void)initialize {
    self.delegate = self;
    self.dataSource = self;
    self.editableSections = [NSMutableArray array];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (NSArray*)sections {
    return [NSArray arrayWithArray:self.editableSections];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.editableSections count];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    MZTableViewSection *tableSection = [self.editableSections objectAtIndex:section];
    return [tableSection.rows count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MZTableViewSection *section = [self.editableSections objectAtIndex:indexPath.section];
    MZTableViewRow *row = [section.rows objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass(row.cellClass)];

    if ([cell respondsToSelector:@selector(setItem:withTableView:indexPath:)]) {
        id mz_cell = (id<MZTableViewCellProtocol>)cell;
        [mz_cell setItem:row.item withTableView:self indexPath:indexPath];
    }
    
    if (row.isFirstDisplay) {
        row.isFirstDisplay = NO;
        if ([cell respondsToSelector:@selector(displayForTheFirstTimeWithTableView:indexPath:)]) {
            id mz_cell = (id<MZTableViewCellProtocol>)cell;
            [mz_cell displayForTheFirstTimeWithTableView:self indexPath:indexPath];
        }
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    MZTableViewSection *section = [self.editableSections objectAtIndex:indexPath.section];
    MZTableViewRow *row = [section.rows objectAtIndex:indexPath.row];
    if ([(Class)row.cellClass respondsToSelector:@selector(estimatedHeightForItem:withTableView:indexPath:)]) {
        Class<MZTableViewCellProtocol> mz_class = row.cellClass;
        return [mz_class estimatedHeightForItem:row.item withTableView:self indexPath:indexPath];
    }
    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    MZTableViewSection *section = [self.editableSections objectAtIndex:indexPath.section];
    MZTableViewRow *row = [section.rows objectAtIndex:indexPath.row];
    if ([(Class)row.cellClass respondsToSelector:@selector(heightForItem:withTableView:indexPath:)]) {
        Class<MZTableViewCellProtocol> mz_class = row.cellClass;
        return [mz_class heightForItem:row.item withTableView:self indexPath:indexPath];
    }
    return UITableViewAutomaticDimension;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([self.mz_delegate respondsToSelector:@selector(tableView:didSelectItemAtIndexPath:)]) {
        [self.mz_delegate tableView:self didSelectItemAtIndexPath:indexPath];
    }
}

#pragma mark - Public Methods
- (id)itemAtIndexPath:(NSIndexPath*)indexPath {
    MZTableViewSection *section = [self.editableSections objectAtIndex:indexPath.section];
    MZTableViewRow *row = [section.rows objectAtIndex:indexPath.row];
    return row.item;
}

- (void)bindItem:(id)item toCell:(Class)cellClass {
    if (0 < self.editableSections.count) {
        MZTableViewSection *lastSection = self.editableSections.lastObject;
        [lastSection bindItem:item toCell:cellClass];
    } else {
        MZTableViewSection *newSection = [[MZTableViewSection alloc] init];
        [self.editableSections addObject:newSection];
        [newSection bindItem:item toCell:cellClass];
    }

    NSString *nibPath = [[NSBundle mainBundle] pathForResource:NSStringFromClass(cellClass) ofType:@"nib"];
    if (nibPath) {
        UINib *nib = [UINib nibWithNibName:NSStringFromClass(cellClass) bundle:nil];
        [self registerNib:nib forCellReuseIdentifier:NSStringFromClass(cellClass)];
    }
}

- (void)unbindItem:(id)item {
    MZTableViewSection *lastSection = self.editableSections.lastObject;
    [lastSection unbindItem:item];
}

- (void)unbindItemAtIndexPath:(NSIndexPath*)indexPath {
    MZTableViewSection *section = [self.editableSections objectAtIndex:indexPath.section];
    [section unbindItemAtIndex:indexPath.row];
}

@end
