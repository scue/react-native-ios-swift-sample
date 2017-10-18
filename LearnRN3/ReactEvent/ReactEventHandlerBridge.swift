//
//  ReactEventHandlerBridge.swift
//  LearnRN3
//
//  Created by scue on 2017/10/17.
//  Copyright © 2017年 XXX. All rights reserved.
//

import Foundation

@objc(ReactEventHandlerBridge)
class ReactEventHandlerBridge: NSObject {
  
  func handle(Event event: String,Resolve resolve: RCTPromiseResolveBlock,Reject reject: RCTPromiseRejectBlock) {
    let eventData = event.data(using: String.Encoding.utf8)
    do {
      let jsonObj = try JSONSerialization.jsonObject(with: eventData!, options: [JSONSerialization.ReadingOptions.mutableLeaves])
      if let json = jsonObj as? NSDictionary {
        if let action = json["action"] as? String {
          // Handle your event
          let eventHandler = ReactEventManager.shared.getEventHandler(Action: action)
          eventHandler?.execute(JsonDict: json, Resolver: resolve, Rejecter: reject)
        } else {
          reject("action undefined", "Your action undefined! please check your event string: \(event).", nil)
        }
      } else {
        reject("json parse error", "Json convert to NSDictionary failed, please check your event string: \(event).", nil)
      }
    } catch {
      reject("event parse error", error.localizedDescription, nil)
    }
  }
}
