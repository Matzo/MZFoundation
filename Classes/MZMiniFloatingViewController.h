//
//  MZMiniFloatingViewController.h
//  MZFoundation
//
//  Created by Matsuo Keisuke on 1/12/15.
//  Copyright (c) 2015 Keisuke Matsuo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, kMZMiniFloatingState) {
    kMZMiniFloatingStateNormal,
    kMZMiniFloatingStateFloating
};

@interface MZMiniFloatingViewController : UIViewController
@property (nonatomic, assign) kMZMiniFloatingState state;
@end
