//
//  MZTableViewSection.m
//  MZFoundation
//
//  Created by Keisuke Matsuo on 2015/01/08.
//  Copyright (c) 2015 Keisuke Matsuo. All rights reserved.
//

#import "MZTableViewSection.h"
#import "MZTableViewRow.h"
#import "NSObject+MZFoundation.h"

@interface MZTableViewSection ()
@property (nonatomic, strong) NSMutableArray *editableRows;
@end

@implementation MZTableViewSection

- (id)init {
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}
- (void)initialize {
    self.editableRows = [NSMutableArray array];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

#pragma mark - Public Methods
- (NSArray*)rows {
    return [NSArray arrayWithArray:self.editableRows];
}

- (void)bindItem:(id)item toCell:(Class)cellClass {
    [self bindItem:item toIdentifier:[cellClass mz_className]];
}

- (void)bindItem:(id)item toIdentifier:(NSString*)identifier {
    MZTableViewRow *row = [[MZTableViewRow alloc] init];
    row.item = item;
    row.identifier = identifier;
    
    [self.editableRows addObject:row];
}

- (void)unbindItem:(id)item {
    for (MZTableViewRow *row in self.rows) {
        if (row.item == item) {
            [self.editableRows removeObject:row];
        }
    }
}

- (void)unbindItemAtIndex:(NSInteger)index {
    [self.editableRows removeObjectAtIndex:index];
}

@end
