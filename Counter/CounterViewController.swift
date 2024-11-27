//
//  ViewController.swift
//  Counter
//
//  Created by Andrew Leonov on 27.11.2024.
//

import UIKit

final class CounterViewController: UIViewController {
    
    // MARK: - IB Outlets
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var historyTextView: UITextView!
    
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    
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
    
    @IBAction func plusButtonPressed() {
        counterValue += 1
        counterLabel.text = "Значение счётчика: \(counterValue)"
        historyTextView.text += "\n\(getDate()): значение изменено на +1"
    }
    
    @IBAction func minusButtonPressed() {
        if counterValue != 0 {
            counterValue -= 1
            counterLabel.text = "Значение счётчика: \(counterValue)"
            historyTextView.text += "\n\(getDate()): значение изменено на -1"
        } else {
            historyTextView.text += "\n\(getDate()): попытка уменьшить значение счётчика ниже 0"
        }
    }
    
    @IBAction func resetButtonPressed() {
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
