//
//  UIViewController+DebugDealloc.m
//  CinCer
//
//  Created by Kid Young on 8/30/18.
//  Copyright © 2018 Yang XiHong. All rights reserved.
//

#import "UIViewController+DebugDealloc.h"
#import <NSObject+CCCategory.h>

@implementation UIViewController (DebugDealloc)

#ifdef DEBUG
/*
+ (void)load
{
    [super load];
    [self swizzleInstanceMethod:NSSelectorFromString(@"dealloc") withInstanceMethod:@selector(debugDealloc) error:nil];
}
 */
#endif

- (void)debugDealloc
{
    NSLog(@"%@ %@", NSStringFromClass(self.class), NSStringFromSelector(_cmd));
}

@end
