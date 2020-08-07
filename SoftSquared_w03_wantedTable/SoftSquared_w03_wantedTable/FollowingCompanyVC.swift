//
//  OrangeViewController.swift
//  SoftSquared_w03_wantedTable
//
//  Created by miori Lee on 2020/08/07.
//  Copyright © 2020 miori. All rights reserved.
//

import UIKit

class FollowingCompanyVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // 해당 cell의 indexPath.row에 맞는 action sheet 생성
    @objc func didTap(_ sender: UIButton){
        
        // sender의 tag는 인덱스로 생각해도 될듯
        let idx = sender.tag
        
        let tapCName = cNames[idx]
        
        
        // ActionSheet 띄우기
        //첫번쨰 :  문구
        let optionMenu = UIAlertController(title: nil, message: "기업 '\(tapCName)' 팔로우 취소하시겠어요?", preferredStyle: .actionSheet)
        //두번째 : 액션 선택지
        let deleteAction = UIAlertAction(title: "팔로우 취소", style: .destructive, handler: { (alert: UIAlertAction!) -> Void in
            print("Yes")
//            self.cNames.remove(at: idx)
//            self.cLocs.remove(at: idx)
//            self.cLogos.remove(at: idx)
//            print(self.cNames)
//            print("ok")
        })
        //let deleteAction = UIAlertAction(title: "팔로우 취소", style: .destructive, handler: )
        //세번째 : 밑에 취소 버튼
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        //네번째 : 이제 연결
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(cancelAction)
        
        //마지막 : 보여줘!!
        self.present(optionMenu, animated: true, completion: nil)
        
        
        
        
    }
    //
    //    @objc func dataDelete(_ sender: UIButton){
    //        let idx = sender.tag
    //        cNames.remove(at: idx)
    //        cLocs.remove(at: idx)
    //        cLogos.remove(at: idx)
    //        print(cNames)
    //    }
    
    var cNames = ["화해(버드뷰)","원티드랩","왓챠"]
    var cLogos = ["birdview","wanted","watcha"]
    var cLocs = ["서울특별시 마포구 와우산로 121","서울 송파구","서울 강남구"]
    
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


extension FollowingCompanyVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomUITalbeViewCell", for: indexPath) as! CustomUITalbeViewCell
        
        cell.companyLogo.image = UIImage(named: cLogos[indexPath.row])
        //print("ok")
        cell.companyName.text = cNames[indexPath.row]
        cell.companyLoc.text = cLocs[indexPath.row]
        
        //버튼 태그에 인덱스를 부여
        /*
         왜? -> 팔로잉 버튼 클릭시 액션시트 올릴때 각 기업의 인덱스가 필요하기 때문에
         */
        cell.followingBtn.tag = indexPath.row
        
        //didTap 함수 호출
        cell.followingBtn.addTarget(self, action: #selector(didTap(_:)), for: .touchUpInside)
        
        
        return cell
    }
    
    
    
    
}

extension FollowingCompanyVC : UITableViewDelegate {
    
}
