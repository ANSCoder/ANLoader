//
//  ViewController.swift
//  ANLoader
//
//  Created by anscoder on 08/17/2017.
//  Copyright (c) 2017 anscoder. All rights reserved.
//

import UIKit
import ANLoader

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ANLoader.showLoading("Loading", disableUI: true)
        Timer.scheduledTimer(timeInterval: 5.0,
                             target: self,
                             selector: #selector(hideLoader),
                             userInfo: nil,
                             repeats: false)
    }

    @objc func hideLoader(){
         ANLoader.hide()
    }
    
    //MARK: - Action Show Loading
    @IBAction func actionShowLoader(_ sender: Any) {
        ANLoader.showLoading("Loading", disableUI: false)
        
        //With Default Text
        //ANLoader.showLoading()
    }
    
    //MARK: - Action Hide Loading
    @IBAction func actionHideLoader(_ sender: Any) {
        ANLoader.hide()
    }
    
}

