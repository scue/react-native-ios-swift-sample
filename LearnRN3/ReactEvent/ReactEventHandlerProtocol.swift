//
//  ReactEventHandlerProtocol.swift
//  LearnRN3
//
//  Created by scue on 2017/10/18.
//  Copyright © 2017年 XXX. All rights reserved.
//

import Foundation

protocol ReactEventHandlerProtocol {
  func execute(JsonDict json: NSDictionary, Resolver resovler: RCTPromiseResolveBlock, Rejecter rejecter: RCTPromiseRejectBlock);
}
