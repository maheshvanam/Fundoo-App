//
//  EditNoteViewController+Reminder.swift
//  FundooApp
//
//  Created by admin on 24/06/20.
//  Copyright © 2020 admin. All rights reserved.
//

import UIKit

extension EditNoteViewController {
    
    @IBAction func didReminderTapped(_ sender: Any) {
        self.requestAuthorization()
        let board = UIStoryboard(name: Constants.REMINDER_STORYBOARD, bundle: nil)
        guard let destinationVC =
            board.instantiateViewController(withIdentifier: addReminderViewControllerId) as? AddReminderViewController  else {
                return
        }
        if note.reminder.count != 0 {
            destinationVC.hideButton = false
        }
        destinationVC.addReminderDelegate = self
        self.navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    func requestAuthorization(){
        let notificationCenter = UNUserNotificationCenter.current()
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        notificationCenter.requestAuthorization(options: options) {
            (didAllow, error) in
            if !didAllow {
                self.present(Helper.alert(title: "Authorization Failed",message: "Request Authorization Failed !"), animated: true, completion: nil)
            }
        }
    }
    
    func scheduleReminder(targetDate: Date){
        let content = UNMutableNotificationContent()
        content.title = note.title
        content.sound = .default
        content.body  = note.description
        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year,.month,.day,.hour,.minute,.second], from: targetDate), repeats: false)
        let request = UNNotificationRequest(identifier: "\(note.id)", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
}

extension EditNoteViewController: AddReminderDelegate {
    func addReminder(date: Date) {
        self.reminderDate = date
        note.reminder.append(date.toString())
        self.scheduleReminder(targetDate: reminderDate)
        self.editNotePresenter.addReminder(note:note)
    }
    
    func removeReminder() {
        self.reminderDate = nil
        self.editNotePresenter.deleteReminder(note:note)
    }
}
