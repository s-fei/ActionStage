//
//  ViewController.swift
//  ActionStage
//
//  Created by song on 2017/5/12.
//  Copyright © 2017年 song. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var actionHandler: LHWHandler?
    @IBAction func enterBtn(_ sender: Any) {
        let text = TextViewController(nibName: "TextViewController", bundle: nil)
        self.present(text, animated: true, completion: nil)
    }
    
    deinit {
        actionHandler?.reset()
        ActionStageInstance.removeWatcher(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        actionHandler = LHWHandler(delegate: self)
        ActionStageInstance.watchForPath(MGReloadPagePath, watcher: self)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController:LHWWatcher{
    func actionStageResourceDispatched(path: String, resource: Any?, arguments: Any?){
        print("ViewController path:\(path)  arguments:\(arguments ?? "")")
    }
    
    func actorCompleted(status: LHWActionStageStatus, path: String, result: Any?) {
        print("我完成啦")
    }
    
    func actorMessageReceived(path: String, messageType: String?, message: Any?) {
        if path == MGReloadPagePath {
            print("这是哪里来的")
            LHWDispatchOnMainThread {
                
            }
        }
    }
}

