//
//  UICountdownLabel.m
//  SpeakerLivAiA
//
//  Created by Kid Young on 12/11/17.
//  Copyright © 2017 Yang XiHong. All rights reserved.
//

#import "UICountdownLabel.h"

@interface UICountdownLabel ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation UICountdownLabel

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {

    }
    return self;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateCountdownValue) userInfo:nil repeats:YES];
}

- (void)removeFromSuperview
{
    [super removeFromSuperview];
    [self.timer invalidate];
}

- (void)dealloc
{

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)updateCountdownValue
{
    NSInteger nextValue = self.text.integerValue - 1;
    self.text = [NSString stringWithFormat:@"%d", nextValue];
    if (nextValue == 0) {
        [self removeFromSuperview];
    }
}

@end
