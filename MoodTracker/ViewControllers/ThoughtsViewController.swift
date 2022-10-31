//
//  ThoughtsViewController.swift
//  MoodTracker
//
//  Created by Руслан Шигапов on 30.10.2022.
//

import UIKit


class ThoughtsViewController: UIViewController, UITextViewDelegate {
    
    // MARK: - IB Outlets
    @IBOutlet var reflectionTextViews: [UITextView]!
    
    @IBOutlet var moodSwitches: [UISwitch]!
    
    @IBOutlet var doneButton: UIBarButtonItem!
    @IBOutlet var saveButton: UIButton!
    
    // MARK: - Public Properties
    var daysInfo: [DayInfo]!
    
    // MARK: - Private Properties
    private var thoughts = Thought.getThoughts()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        reflectionTextViews.forEach { $0.delegate = self }
        reflectionTextViews.forEach { $0.layer.cornerRadius = 10 }
        saveButton.layer.cornerRadius = 10
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let resultNC = segue.destination as? UINavigationController else { return }
        guard let resultTBC = resultNC.topViewController as? ResultTabBarController else { return }
        resultTBC.daysInfo = daysInfo
    }
    
    // MARK: - IB Actions
    @IBAction func saveButtonPressed() {
        saveButton.setTitle("Сохранено", for: .normal)
        doneButton.tintColor = .tintColor
        
        for index in 0..<thoughts.count {
            //            thoughts[index].reflection = reflectionTextViews[index].text
            if reflectionTextViews[index].text != "Ваши размышления..." {
                thoughts[index].reflection = reflectionTextViews[index].text
            } else {
                thoughts[index].reflection = ""
            }
            thoughts[index].isNegative = moodSwitches[index].isOn
        }
        
        addDayThoughts(to: daysInfo)
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        reflectionTextViews.forEach { reflectionTextView in
            if reflectionTextView == textView {
                reflectionTextView.text = ""
            }
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        reflectionTextViews.forEach { reflectionTextView in
            if reflectionTextView == textView {
                if reflectionTextView.text.isEmpty {
                    reflectionTextView.text = "Ваши размышления..."
                }
            }
        }
    }
    // MARK: - Private Methods
    private func addDayThoughts(to daysInfo: [DayInfo]) {
        self.daysInfo = daysInfo.map { dayInfo in
            var dayInfo = dayInfo
            if dayInfo.date == setDateFormat() {
                dayInfo.thoughts = thoughts
            }
            return dayInfo
        }
    }
    
    private func setDateFormat() -> String {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.YYYY"
        return formatter.string(from: currentDate)
    }
}
