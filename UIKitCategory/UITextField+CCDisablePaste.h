//
//  UITextField+CCDisablePaste.h
//  CCFrameworks
//
//  Created by Kid Young on 11/7/13.
//  Copyright (c) 2013 Yang XiHong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (CCDisablePaste)

- (BOOL)canPerformAction:(SEL)action withSender:(id)sender;

@end
