//
//  ViewController.swift
//  tutorial1_Hu_Calvin
//
//  Created by Calvin Hu on 9/16/20.
//  Copyright © 2020 Calvin Hu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("viewDidLoad()")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear()")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("viewDidAppear()")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("viewWillDisappear()")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("viewDidDisappear()")
    }
    
    /*
     order:
     viewDidLoad() set-up stuff that only needs to be set once, like the tictactoe buttons and labels
     viewWillAppear() tasks that need to be done everytime the view is called, like set a fetch information from a database
     viewDidAppear() can start animations, a timer, play music, request data from a server
     viewWillDisappear() can stop a timer, stop a video, stop a sound, stop ongoing processes.
     viewDidDisappear() stop network activities. If this was a texting app, stop listening for new messages. For google maps, stop tracking location
     */
}

