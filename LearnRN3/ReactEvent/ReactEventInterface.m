//
//  ReactEventInterface.m
//  LearnRN3
//
//  Created by scue on 2017/10/17.
//  Copyright © 2017年 XXX. All rights reserved.
//

#import "ReactEventInterface.h"

// Swift混编：<Project>-swift.h
#import "LearnRN3-swift.h"

@implementation ReactEventInterface

RCT_EXPORT_MODULE();

// 对应JS调用：NativeModules.ReactEventInterface.sendEvent(event: String).then().catch()
RCT_EXPORT_METHOD(sendEvent:(NSString *)event resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject){
  @autoreleasepool {
    [[ReactEventHandlerBridge new] handleWithEvent:event Resolve:resolve Reject:reject];
  }
}
@end
