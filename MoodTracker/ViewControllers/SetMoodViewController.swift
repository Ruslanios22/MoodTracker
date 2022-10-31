//
//  ViewController.swift
//  MoodTracker
//
//  Created by Roman Golubinko on 25.10.2022.
//

import UIKit

class SetMoodViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var daytimeImage: UIImageView!
    
    @IBOutlet var moodsProgressView: UIProgressView!
    
    @IBOutlet var daytimeLB: UILabel!
    @IBOutlet var dateLB: UILabel!
    @IBOutlet var moodImage: UILabel!
    @IBOutlet var moodLabel: UILabel!
    
    @IBOutlet var moodSaveButton: UIButton!
    @IBOutlet var moodSlider: UISlider! {
        didSet {
            let answerCount = Float(currentAnswers.count - 1)
            moodSlider.maximumValue = answerCount
            moodSlider.value = answerCount / 2
        }
    }
    
    // MARK: - Private Properties
    private var daysInfo: [DayInfo] = DayInfo.getDayInfo()
    private var moodsToPick = Mood.getMoods()
    private var timeOfDayIndex = 0
    private var answersChosen: [MoodType] = []
    private var currentAnswers: [MoodType] {
        moodsToPick[timeOfDayIndex].moods
    }
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        dateLB.text = setCurrentDate()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.timeOfDayIndex = 0
        updateUI()
        self.setMoodProgress()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let thoughtsNC = segue.destination as? UINavigationController else { return }
        guard let thoughtsVC = thoughtsNC.topViewController as? ThoughtsViewController else { return }
        thoughtsVC.daysInfo = daysInfo
    }
    
    // MARK: - IB Actions
    @IBAction func sliderValueChanged() {
        let index = lrintf(moodSlider.value)
        moodImage.text = currentAnswers[index].definition
        moodLabel.text = currentAnswers[index].rawValue
    }
    
    @IBAction func moodSaveButtonTapped() {
        let index = lrintf(moodSlider.value)
        answersChosen.append(currentAnswers[index])
        nextQuestion()
    }
    
    // MARK: - Private Methods
    private func setCurrentDate() -> String {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.YYYY"
        return formatter.string(from: currentDate)
    }
    
    private func updateUI() {
        let currentDayTime = moodsToPick[timeOfDayIndex]
        daytimeLB.text = currentDayTime.daytime.rawValue
        daytimeImage.image = UIImage(named: "\(currentDayTime.daytime)")
    }
    
    private func setMoodProgress() {
        let progress = Float(timeOfDayIndex) / Float(moodsToPick.count )
        moodsProgressView.setProgress(progress, animated: true)
    }
    
    private func getDayInfo() {
        daysInfo.append(
            DayInfo(date: setCurrentDate(), moods: answersChosen, thoughts: [])
        )
    }
    
    private func nextQuestion() {
        timeOfDayIndex += 1
        setMoodProgress()
        
        if timeOfDayIndex < moodsToPick.count {
            updateUI()
        } else {
            showMoodsEnteredAlert(title: "Спасибо!",message: "Данные сохранены")
            getDayInfo()
            print(daysInfo)
        }
    }
    
    // MARK: - Alert
    private func showMoodsEnteredAlert (title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "ОК", style: .default) { _ in
            self.performSegue(withIdentifier: "moodSaved", sender: self)
        })
        present(alert, animated: true)
    }
}

