//
//  DWDFPSLabel.m
//  DWDStastistics
//
//  Created by dianwoda on 16/11/4.
//  Copyright © 2016年 dianwoda. All rights reserved.
//

#import "DWDFPSLabel.h"
#import "DWDWeakProxy.h"

static DWDFPSLabel *FPSLabel = nil;
@interface DWDFPSLabel ()
@property (nonatomic, strong)  CADisplayLink *link;
@property (nonatomic, assign)  NSUInteger count;
@property (nonatomic, assign)  NSTimeInterval lastTime;

@end

@implementation DWDFPSLabel

+ (instancetype)sharedInstance
{
    @synchronized(self){
        if (nil == FPSLabel){
            
            FPSLabel = [[DWDFPSLabel alloc] init];
            [[[UIApplication sharedApplication] keyWindow] addSubview:FPSLabel];
            FPSLabel.link = [CADisplayLink displayLinkWithTarget:[DWDWeakProxy proxyWithTarget:FPSLabel] selector:@selector(tick:)];
            [FPSLabel.link addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
        }
    }
    return FPSLabel;
}

- (void)dealloc {
    [_link invalidate];
}

- (void)tick:(CADisplayLink *)link {
    if (_lastTime == 0) {
        _lastTime = link.timestamp;
        return;
    }
    _count++;

    NSTimeInterval delta = link.timestamp - _lastTime;
    if (delta < 1) return;
    _lastTime = link.timestamp;
    float fps = _count / delta;
    _count = 0;

    NSString *text = [NSString stringWithFormat:@"%d FPS",(int)round(fps)];
    NSLog(@"================%@==============",text);


}


@end
