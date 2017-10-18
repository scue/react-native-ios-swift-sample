//
//  ReactEventManager.swift
//  LearnRN3
//
//  Created by scue on 2017/10/18.
//  Copyright © 2017年 XXX. All rights reserved.
//

import Foundation
class ReactEventManager {
  // 单例模式
  static let shared = ReactEventManager()
  private init() {}
  
  // 管理event
  var EVENTS: [String: ReactEventHandlerProtocol] = [:]
  
  // 注册event
  func addEventHandler(Action action: String, ReactEvent event: ReactEventHandlerProtocol) {
    EVENTS[action] = event
  }
  
  // 获得event
  func getEventHandler(Action action: String) -> ReactEventHandlerProtocol? {
    return EVENTS[action]
  }
}
