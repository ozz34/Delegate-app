//
//  ViewController.swift
//  Delegate
//
//  Created by brubru on 24.08.2022.
//

import UIKit

// MARK: - SecondViewControllerDelegate
protocol SecondViewControllerDelegate {
    func getLabel(for text: String)
}

final class FirstViewController: UIViewController {
    @IBOutlet var smileLabel: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondVC = segue.destination as? SecondViewController else { return }
        secondVC.delegate = self
        secondVC.textLabel = smileLabel.text
    }
}

// MARK: - SecondViewControllerDelegate
extension FirstViewController: SecondViewControllerDelegate {
    func getLabel(for text: String) {
        smileLabel.text = text
    }
}
