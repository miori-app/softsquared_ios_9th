//
//  MySkillVC.swift
//  SoftSquared_w03_wantedTable
//
//  Created by miori Lee on 2020/08/10.
//  Copyright © 2020 miori. All rights reserved.
//

import UIKit

protocol AddSkill {
    func AddMySkill()
}

class MySkillVC : UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var delegate : AddSkill?
    
    @IBAction func didAdd(_ sender: Any) {
        let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "MySkillAddVC") as! MySkillAddVC
        //나를 넘김 (2. self정의로 이한몸 다바쳐서 간닷)
        secondViewController.prevViewController = self
        //이 한몸 다바쳐서 간거..
        self.present(secondViewController, animated: true, completion: nil)
    }
    
    // table view 에서 사용할 데이터 정의
    var myLang: [String] = ["python", "c", "swift", "java"]
    var myInterested: [String] = ["iOS", "Data Analysis", "Data visulaization"]
    
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
        tableView.reloadData()
        print("reload : \(myLang)")
        self.view.addSubview(self.tableView)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        print(myInterested)
        print("myskillvc appear")
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
    
    //swipe 삭제
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == .delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            if indexPath.section == 0 {
                myLang.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            } else {
                myInterested.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            
            //myInterested.remove(at: indexPath.row)
            
        }
    }
    
    
}
