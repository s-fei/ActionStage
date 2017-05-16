//
//  TextViewController.swift
//  ActionStage
//
//  Created by song on 2017/5/12.
//  Copyright © 2017年 song. All rights reserved.
//

import UIKit

class TextViewController: UIViewController {
    @IBAction func reloadBtn(_ sender: Any) {
        ActionStageInstance.requestActor(path: MGReloadPagePath, options: ["a":"1"], watcher: self)
//        ActionStageInstance.requestActor(path: MGReloadPagePath, options: ["a":"2"], watcher: self)
//        ActionStageInstance.dispatchMessageToWatchers(path: MGReloadPagePath, messageType: "你傻啊", message: ["bill":"abc"])
//        ActionStageInstance.dispatchMessageToWatchers(path: MGReloadPagePath)
//        ActionStageInstance.dispatchResource(path: MGReloadPagePath)
    }

    deinit {
        actionHandler?.reset()
        ActionStageInstance.removeWatcher(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ActionStageInstance.watchForPath(MGReloadPagePath, watcher: self)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension TextViewController:LHWWatcher{
    func actionStageResourceDispatched(path: String, resource: Any?, arguments: Any?){
        print("TextViewController path:\(path)  arguments:\(arguments ?? "")")
    }
    
    func actorCompleted(status: LHWActionStageStatus, path: String, result: Any?) {
        print("TextViewController我完成啦")
    }
    
    func actorMessageReceived(path: String, messageType: String?, message: Any?) {
        if path == MGReloadPagePath {
            print("TextViewController 这是哪里来的")
            LHWDispatchOnMainThread {
                
            }
        }
    }
}
