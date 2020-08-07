//
//  TealViewController.swift
//  SoftSquared_w03_wantedTable
//
//  Created by miori Lee on 2020/08/07.
//  Copyright © 2020 miori. All rights reserved.
//

import UIKit

class PickViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var cNames = ["카카오(KAKAO)","왓챠","쿠팡","NAVER Corp(네이버)","우아한형제들(배달의민족)","엔에이치엔(NHN)","딜리버리히어로 코리아 (Delivery Hero Korea)","원티드랩","화해(버드뷰)"]
    var cLogos = ["kakao","watcha","coupang","naver","woowahan","nhn","deliveryhero","wanted","birdview"]
    var cKinds = ["IT, 컨텐츠","IT, 컨텐츠","IT, 컨텐츠","IT, 컨텐츠","IT, 컨텐츠","IT, 컨텐츠","IT, 컨텐츠","IT, 컨텐츠","IT, 컨텐츠"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "인기 회사"
         
        tableView.dataSource = self
        tableView.delegate = self
        

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

extension PickViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyTableViewCell", for: indexPath) as! CompanyTableViewCell
        
        cell.cLogoImg.image = UIImage(named: cLogos[indexPath.row])
        cell.cName.text = cNames[indexPath.row]
        cell.cKind.text = cKinds[indexPath.row]
        
        return cell
     }
    
    
}

extension PickViewController : UITableViewDelegate {
    
}
