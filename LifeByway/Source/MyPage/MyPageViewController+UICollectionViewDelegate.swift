//
//  MyPageViewController+UICollectionViewDelegate.swift
//  LifeByway
//
//  Created by Minseob Yoon on 2018. 4. 9..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import JTAppleCalendar

extension MyPageViewController: JTAppleCalendarViewDelegate {
    
    func calendar(_ calendar: JTAppleCalendarView, willDisplay cell: JTAppleCell, forItemAt date: Date, cellState: CellState, indexPath: IndexPath) {
        
    }
    
    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "Cell", for: indexPath) as! CalendarCell
        cell.dateLabel.text = cellState.text
        if cellState.date.normalFormat == Date().normalFormat {
            cell.dateLabel.textColor = #colorLiteral(red: 1, green: 0.4103240967, blue: 0.4116775692, alpha: 1)
        } else {
            cell.dateLabel.textColor = (cellState.dateBelongsTo == .thisMonth) ? #colorLiteral(red: 0.1999762356, green: 0.200016588, blue: 0.1999709308, alpha: 1) : #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }
        return cell
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didScrollToDateSegmentWith visibleDates: DateSegmentInfo) {
        let visibleMonth = visibleDates.monthDates.first?.date.month
        moveTodayButton.isHidden = (visibleMonth == Date().month)
        if navigationItem.title != "My Page" {
            navigationItem.title = visibleMonth
        }
    }
    
    func calendar(_ calendar: JTAppleCalendarView, didSelectDate date: Date, cell: JTAppleCell?, cellState: CellState) {
        // TODO: - 날짜에 따른 글 서버 요청
        print(date.normalFormat)
    }
}

extension MyPageViewController: JTAppleCalendarViewDataSource {
    
    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        let startDate = DateFormatter().calendarFormatter.date(from: "2018-01-01") ?? Date()
        let endDate = DateFormatter().calendarFormatter.date(from: "2099-12-31") ?? Date()
        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        return parameters
    }
}
