//
//  UIViewController+CCBackBarButtonItem.m
//  CCFrameworks
//
//  Created by Kid Young on 11/21/13.
//  Copyright (c) 2013 Yang XiHong. All rights reserved.
//

#import "UIViewController+CCBackBarButtonItem.h"
#import "UIImage+CCCategory.h"

@implementation UIViewController (CCBackBarButtonItem)

- (void)customizeBackBarButtonItem {
#warning may be another better way
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] init];
    barButtonItem.title = @" ";
//    /*
    if (UIDevice.currentDevice.systemVersion.floatValue >= 7.0) {
        [self.navigationController.navigationBar setBackIndicatorImage:[UIImage imageFromUIColor:[UIColor clearColor]]];
        [self.navigationController.navigationBar setBackIndicatorTransitionMaskImage:[UIImage imageFromUIColor:[UIColor clearColor]]];
        [barButtonItem setBackButtonBackgroundImage:[[UIImage imageNamed:@"backUnselected.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 50, 0, 10)] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [barButtonItem setBackButtonBackgroundImage:[[UIImage imageNamed:@"backSelected.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 50, 0, 10)] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    } else {
        [barButtonItem setBackButtonBackgroundImage:[[UIImage imageNamed:@"backUnselected.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        [barButtonItem setBackButtonBackgroundImage:[[UIImage imageNamed:@"backSelected.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    }
//     */
    self.navigationItem.backBarButtonItem = barButtonItem;
}

@end
