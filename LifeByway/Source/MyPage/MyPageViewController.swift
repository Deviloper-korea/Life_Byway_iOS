//
//  MyPageViewController.swift
//  LifeByway
//
//  Created by yunyoung on 2018. 3. 27..
//  Copyright © 2018년 Deviloper. All rights reserved.
//

import UIKit
import JTAppleCalendar

class MyPageViewController: BaseViewController {
    
    @IBOutlet weak var calendarView: JTAppleCalendarView!
    @IBOutlet weak var moveTodayButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarView.calendarDelegate = self
        calendarView.calendarDataSource = self
        
        moveToday()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        convertNavigationTitle()
    }
    
    func convertNavigationTitle() {
        title = "My Page"
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            self?.navigationItem.title = Date().month
        }
    }
    
    func moveToday() {
        calendarView.scrollToDate(Date(), animateScroll: false)
    }
}

// @IBAction
extension MyPageViewController {
    
    @IBAction func moveTodayButtonTapped(sender: UIButton) {
        moveToday()
    }
}
