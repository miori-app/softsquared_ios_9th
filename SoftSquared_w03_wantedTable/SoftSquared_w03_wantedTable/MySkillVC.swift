//
//  MySkillVC.swift
//  SoftSquared_w03_wantedTable
//
//  Created by miori Lee on 2020/08/10.
//  Copyright © 2020 miori. All rights reserved.
//

import UIKit

class MySkillVC : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // table view 에서 사용할 데이터 정의
    private var myLang: [String] = ["python", "c", "swift", "java"]
    private var myInterested: [String] = ["iOS", "Data Analysis", "Data visulaization"]
    
    // section 정의
    private let sections: [String] = ["language", "interested in"]
    
    lazy var tableView: UITableView = {
        // Get the height of the Status Bar.
        let barHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
        // Get the height and width of the View.
        let displayWidth: CGFloat = self.view.frame.width
        let displayHeight: CGFloat = self.view.frame.height
        let tableView: UITableView = UITableView(frame: CGRect(x: 0, y: barHeight, width: displayWidth, height: displayHeight - barHeight))
        // Register the Cell name.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "sectionTableViewCell")
        // Set the DataSource.
        tableView.dataSource = self
        // Set Delegate.
        tableView.delegate = self
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Add UITableView on view
        self.view.addSubview(self.tableView)
        
    }
    
    // section수 return 함수
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    // section제목 return
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    // Called when Cell is selected.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            print("Value: \(myLang[indexPath.row])")
        } else if indexPath.section == 1 {
            print("Value: \(myInterested[indexPath.row])")
        } else {
            return
        }
        
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return myLang.count
        } else if section == 1 {
            return myInterested.count }
        else {
            return 0 }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectionTableViewCell", for: indexPath)
        if indexPath.section == 0 {
            cell.textLabel?.text = "\(myLang[indexPath.row])"
            
        } else if indexPath.section == 1 {
            cell.textLabel?.text = "\(myInterested[indexPath.row])"
        } else {
            return UITableViewCell()
        }
        return cell
        
    }
    
    
}
