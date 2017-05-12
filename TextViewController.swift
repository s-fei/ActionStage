//
//  TextViewController.swift
//  ActionStage
//
//  Created by song on 2017/5/12.
//  Copyright © 2017年 song. All rights reserved.
//

import UIKit

class TextViewController: UIViewController,LHWWatcher {
    var actionHandler: LHWHandler?
    @IBAction func reloadBtn(_ sender: Any) {
        ActionStageInstance.requestActor(path: MGReloadPath, options: ["a":"1"], watcher: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        actionHandler = LHWHandler(delegate: self)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
