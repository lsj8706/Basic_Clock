//
//  AlarmModel.swift
//  Basic_Clock
//
//  Created by sejin on 2022/07/03.
//

import Foundation

class AlarmModel {
    var time: Date
    var repeatDay: [String]
    var sound: String = ""
    var isRepeatAlarm: Bool
    
    init(time: Date, repeatDay: [String], sound: String, isRepeatAlarm: Bool) {
        self.time = time
        self.repeatDay = repeatDay
        self.sound = sound
        self.isRepeatAlarm = isRepeatAlarm
    }
}
