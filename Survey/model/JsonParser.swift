//
//  JsonParser.swift
//  Survey
//
//  Created by Qinjia Huang on 12/8/17.
//  Copyright © 2017 Qinjia Huang. All rights reserved.
//

import UIKit
import SwiftyJSON
class JsonParser : NSObject {
    static let sample : JSON = ["rtid":65,
                         "pings":["2017-12-07 10:20:00","2017-12-07 11:15:00","2017-12-07 12:11:00","2017-12-07 13:14:00","2017-12-07 14:33:00","2017-12-07 15:56:00","2017-12-07 16:31:00","2017-12-08 08:43:00","2017-12-08 09:23:00"],
                         "reminder":120,
                         "windowopen":560,
                         "website":"https://uas.usc.edu/survey/uas/ema/daily.ema.php"]
    static var reminder = 0
    static var windowopen = 0
    
    static func updateSetting(json : JSON, settings : Settings)  {
        
    }
    static func updateSettingSample()  {
        var setting = Settings()
//        print(sample["rtid"])
        
        setting.updateAndSave(rtid: String(describing: sample["rtid"]), beginTime: Date(), endTime: Calendar.current.date(byAdding: .day, value: 7, to: Date())!, setAtTime: Date(), surs: Settings.buildSurveyFromJSON(json: sample))
        
        if let reminder = sample["reminder"].int {
            // Do something you want
            Constants.TIME_TO_REMINDER = reminder / 60
        }
        if let windowopen = sample["windowopen"].int {
            // Do something you want
            Constants.TIME_TO_TAKE_SURVEY = windowopen / 60
        }
        if let website = sample["website"].string {
            // Do something you want
            Constants.baseURL = website
        }
        print("is constants changed ?", Constants.TIME_TO_TAKE_SURVEY, " ", Constants.TIME_TO_REMINDER)
        print("here is the setting from local json", setting.toString())
    }
}
