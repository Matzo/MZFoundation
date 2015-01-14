//
//  MZMiniFloatingViewController.m
//  MZFoundation
//
//  Created by Matsuo Keisuke on 1/12/15.
//  Copyright (c) 2015 Keisuke Matsuo. All rights reserved.
//

#import "MZMiniFloatingViewController.h"

@interface MZMiniFloatingViewController ()

@end

@implementation MZMiniFloatingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)setState:(kMZMiniFloatingState)state {
    if (_state != state) {
        _state = state;
        
        switch (state) {
            case kMZMiniFloatingStateFloating:
                [self startFloating];
                break;
            case kMZMiniFloatingStateNormal:
                [self stopFloating];
                break;
        }
    }
}

- (void)startFloating {
    [UIView animateWithDuration:0.3 delay:0.0 usingSpringWithDamping:0.3 initialSpringVelocity:0.3 options:0 animations:^{
        CGRect frame = CGRectMake(100, self.view.frame.size.height - 200, 150, 150);
        self.view.frame = frame;
    } completion:^(BOOL finished) {
    }];
}
- (void)stopFloating {
    [UIView animateWithDuration:0.3 delay:0.0 usingSpringWithDamping:0.3 initialSpringVelocity:0.3 options:0 animations:^{
        CGRect frame = CGRectMake(0, 0, self.view.superview.frame.size.width, self.view.superview.frame.size.height);
        self.view.frame = frame;
    } completion:^(BOOL finished) {
    }];
}

@end
