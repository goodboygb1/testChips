//
//  ViewController.swift
//  testChip
//
//  Created by PMJs on 22/10/2564 BE.
//

import UIKit
import MaterialComponents.MaterialChips
import MaterialComponents.MaterialTextFields
import MaterialComponents.MaterialContainerScheme


class ViewController: UIViewController, UITextFieldDelegate, MDCChipFieldDelegate {

    var containerScheming = MDCContainerScheme()
    var chipField: MDCChipField!
    var textField: MDCOutlinedTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupChipField()
        setupTextField()
    }
    

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        reArrangeView()
    }
    

    func chipFieldHeightDidChange(_ chipField: MDCChipField) {
        view.layoutIfNeeded()
    }

    func chipField(_ chipField: MDCChipField, didRemoveChip chip: MDCChipView) {
        view.layoutSubviews()
        reArrangeView()
    }

    func setupChipField() {
        chipField = MDCChipField()
        chipField.frame = .zero
        chipField.delegate = self
        chipField.textField.placeholderLabel.text = "This is a chip field."
        chipField.backgroundColor = containerScheming.colorScheme.surfaceColor
        chipField.showChipsDeleteButton = true
        self.view.addSubview(chipField)
    }

    func setupTextField() {
        textField = MDCOutlinedTextField(frame: .zero)
        textField.label.text = "Phone number"
        textField.placeholder = "555-555-5555"
        textField.sizeToFit()
        textField.delegate = self
        view.addSubview(textField)
    }

    func reArrangeView() {
        var frame = view.bounds
        frame = frame.inset(by: view.safeAreaInsets)
        frame.size = chipField.sizeThatFits(frame.size)
        chipField.frame = frame

        let frame2 = CGRect(x: frame.origin.x+20, y: frame.origin.y+frame.size.height+20, width: frame.width-20, height: frame.height)
        textField.frame = frame2
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let chipView = MDCChipView()
        chipView.titleLabel.text = "Tap me"
        chipView.setTitleColor(UIColor.red, for: .selected)
        chipView.sizeToFit()
        textField.addSubview(chipView)
        textField.endEditing(true)
        return true
    }
}
