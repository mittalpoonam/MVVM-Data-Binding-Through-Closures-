//
//  ViewController.swift
//  mvvm
//
//  Created by poonam mittal on 23/02/23.
//

import UIKit

// UIKit should not be there in ViewModel -> View model ki class me UIKit Nahi hona chahiye
    // ViewModel never knows about view or what view does?
// How communication will occur with view ? -> communication ko bolte hai MVVM Binding/ data binding
// 1.Protocol-delegate
// 2. Closures
// 3, Property Observer(BOX) -> didSet, willSet
// 4. FRP(Functional reactive programming) - RX, Combine

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}

