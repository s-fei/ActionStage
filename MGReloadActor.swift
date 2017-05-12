//
//  MGReloadActor.swift
//  ActionStage
//
//  Created by song on 2017/5/12.
//  Copyright © 2017年 song. All rights reserved.
//

import UIKit

let MGReloadPath = "/mg/newcell/@"

class MGReloadActor: LHWActor {
    override class func genericPath() -> String? {
        return MGReloadPath
    }
    
    override func execute(options: [String: Any]?) {
        ActionStageInstance.dispatchResource(path: path, resource: nil, arguments: options)
        ActionStageInstance.actionCompleted(self.path)
    }
    
    deinit {
        Logger.debug("\(self) dealloced")
    }
    override func watcherJoined(watcherHandler: LHWHandler, options: [String : Any]?, waitingInActorQueue: Bool) {
         ActionStageInstance.dispatchResource(path: path, resource: nil, arguments: options)
    }
}
