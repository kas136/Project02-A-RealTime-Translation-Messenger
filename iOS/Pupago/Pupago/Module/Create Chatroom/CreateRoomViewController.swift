//
//  CreateRoomViewController.swift
//  Pupago
//
//  Created by 김근수 on 2020/11/25.
//

import UIKit
import RxSwift
import RxCocoa

final class CreateRoomViewController: ViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var roomTextField: ValidatingTextField!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var createButton: Button!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func bindViewModel() {
        super.bindViewModel()
        
        guard let viewModel = viewModel as? CreateRoomViewModel else { return }
        let roomName = roomTextField.rx.text.asObservable()
        let createTrigger = createButton.rx.tap.map { _ in }
        let cancelTrigger = closeButton.rx.tap.map { _ in }
        
        let input = CreateRoomViewModel.Input(roomName: roomName,
                                              createTrigger: createTrigger,
                                              cancelTrigger: cancelTrigger)
        let output = viewModel.transform(input)
        
        output.viewTexts
            .drive(onNext: { [unowned self] texts in
                self.titleLabel.text = texts.title
                self.descriptionLabel.text = texts.description
                self.createButton.setTitle(texts.createButton, for: .normal)
            })
            .disposed(by: rx.disposeBag)
        
        output.hasValidRoomName
            .drive(onNext: { [unowned self] isValid in
                self.roomTextField.isValid = isValid
                self.descriptionLabel.textColor = isValid ? .darkGray : .red
            })
            .disposed(by: rx.disposeBag)
        
        output.activate
            .drive(onNext: { [unowned self] activate in
                self.createButton.isUserInteractionEnabled = activate
                self.createButton.backgroundColor = activate ? UIColor(named: "ButtonColor") : .systemGray6
            })
            .disposed(by: rx.disposeBag)
        
        output.created
            .drive(onNext: { [unowned self] viewModel in
                self.navigator.dismiss(sender: self)
            })
            .disposed(by: rx.disposeBag)
        
        output.dismiss
            .drive(onNext: { [unowned self] () in
                self.navigator.dismiss(sender: self)
            })
            .disposed(by: rx.disposeBag)
    }
    
}