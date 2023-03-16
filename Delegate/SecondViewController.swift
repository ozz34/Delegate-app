//
//  SecondViewController.swift
//  Delegate
//
//  Created by brubru on 24.08.2022.
//

import UIKit

final class SecondViewController: UIViewController {
    // MARK: - Properties
    @IBOutlet var textField: UITextField!
    @IBOutlet var smileLabel: UILabel!
    
    var delegate: SecondViewControllerDelegate!
    var textLabel: String!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        smileLabel.text = textLabel
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        textField.endEditing(true)
    }

    @IBAction func goBackButtonPressed() {
        delegate.getLabel(for: textField.text ?? "")
        dismiss(animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension SecondViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        smileLabel.text = text
    }
}
