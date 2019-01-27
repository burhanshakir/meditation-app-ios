//
//  Date.swift
//  Meditation App
//
//  Created by Burhanuddin Shakir on 27/01/19.
//  Copyright © 2019 meditation-app. All rights reserved.
//

import Foundation

extension Date
{
    func interval(ofComponent comp: Calendar.Component, fromDate date: Date) -> Int
    {
        
        let currentCalendar = Calendar.current
        
        guard let start = currentCalendar.ordinality(of: comp, in: .era, for: date) else { return 0 }
        guard let end = currentCalendar.ordinality(of: comp, in: .era, for: self) else { return 0 }
        
        return end - start
    }
}
