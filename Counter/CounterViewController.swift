//
//  ViewController.swift
//  Counter
//
//  Created by Andrew Leonov on 27.11.2024.
//

import UIKit

final class CounterViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var historyTextView: UITextView!
    
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    
    // MARK: - Private Properties
    
    private var counterValue = 0
    
    // MARK: - Life Cycles Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        plusButton.layer.cornerRadius = 10
        minusButton.layer.cornerRadius = 10
        resetButton.layer.cornerRadius = 10
    }
    
    // MARK: - IB Actions
    
    @IBAction private func plusButtonPressed() {
        counterValue += 1
        counterLabel.text = "Значение счётчика: \(counterValue)"
        historyTextView.text += "\n\(getDate()): значение изменено на +1"
    }
    
    @IBAction private func minusButtonPressed() {
        if counterValue != 0 {
            counterValue -= 1
            counterLabel.text = "Значение счётчика: \(counterValue)"
            historyTextView.text += "\n\(getDate()): значение изменено на -1"
        } else {
            historyTextView.text += "\n\(getDate()): попытка уменьшить значение счётчика ниже 0"
        }
    }
    
    @IBAction private func resetButtonPressed() {
        counterValue = 0
        counterLabel.text = "Значение счётчика: \(counterValue)"
        historyTextView.text += "\n\(getDate()): значение сброшено"
    }
    
    // MARK: - Private Methods
    
    private func getDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "ru_RU")
        return dateFormatter.string(from: Date())
    }
}
