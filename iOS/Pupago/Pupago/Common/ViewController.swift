//
//  ViewController.swift
//  Pupago
//
//  Created by 김근수 on 2020/11/23.
//

import UIKit

class ViewController: UIViewController, Navigatable {
    
    var viewModel: ViewModel?
    var navigator: Navigator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindViewModel()
    }
    
    func bindViewModel() {}
    
}
