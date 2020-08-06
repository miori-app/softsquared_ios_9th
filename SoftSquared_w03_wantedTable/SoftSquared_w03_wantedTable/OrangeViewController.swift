//
//  OrangeViewController.swift
//  SoftSquared_w03_wantedTable
//
//  Created by miori Lee on 2020/08/07.
//  Copyright © 2020 miori. All rights reserved.
//

import UIKit

class OrangeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let cNames = ["화해(버드뷰)","원티드랩","왓챠"]
    let cLogos = ["birdview","wanted","watcha"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "내 정보"
        
        tableView.dataSource = self
        tableView.delegate = self
        
//        let myCustomCell = UINib(nibName: "CustomUITalbeViewCell", bundle: nil)
//        self.tableView.register(myCustomCell, forCellReuseIdentifier: "CustomCell")

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension OrangeViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomUITalbeViewCell", for: indexPath) as! CustomUITalbeViewCell
        
        cell.companyLogo.image = UIImage(named: cLogos[indexPath.row])
        print("ok")
        cell.companyName.text = cNames[indexPath.row]
        
        return cell
    }
    
    
}

extension OrangeViewController : UITableViewDelegate {
    
}
