//
//  TealViewController.swift
//  SoftSquared_w03_wantedTable
//
//  Created by miori Lee on 2020/08/07.
//  Copyright © 2020 miori. All rights reserved.
//

import UIKit

protocol AddFollowing {
    func sendAddFollowing()
}

class PickViewController: UIViewController, PickChangedDelegate{

    func showFollowing() {

    }
    
    
    var followingTV : FollowingCompanyVC?

    

    @IBOutlet weak var tableView: UITableView!
    
    // 해당 cell의 버튼 변경
    // 그리고 팔로우 버튼 클릭시 팔로잉한 회사 배열에 추가
    @objc func didTap(_ sender: UIButton){
        BtnStyle(your_btn: sender)
        followings.append(cNames[sender.tag])
        print("add : \(followings)")
    }
    
    var cNames = ["카카오(KAKAO)","왓챠","쿠팡","NAVER Corp(네이버)","우아한형제들(배달의민족)","엔에이치엔(NHN)","딜리버리히어로 코리아 (Delivery Hero Korea)","원티드랩","화해(버드뷰)"]
    var cLogos = ["kakao","watcha","coupang","naver","woowahan","nhn","deliveryhero","wanted","birdview"]
    var cKinds = ["IT, 컨텐츠","IT, 컨텐츠","IT, 컨텐츠","IT, 컨텐츠","IT, 컨텐츠","IT, 컨텐츠","IT, 컨텐츠","IT, 컨텐츠","IT, 컨텐츠"]

    
    //팔로잉 기업 배열
    var followings = Array<String>()
    
    //delegate
    var delegate : AddFollowing?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("viewdidload")
        
        //네비게이션 제목
        navigationItem.title = "인기 회사"
        
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        followingTV?.delegate = self
        

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        tableView.reloadData()
    
        
//        let followingVC = self.tabBarController?.viewControllers[0]
        
        
        //선택된 값들 받아오기 (실패)
        let followingVC = self.storyboard?.instantiateViewController(withIdentifier: "FollowingCompanyVC") as! FollowingCompanyVC
        //print("followings : \(followingVC.cNames)")
        followingVC.tableView?.reloadData()
        followings = followingVC.cNames
        print("viewillAppear : \(followings)")
        showFollowing()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
        print("viewWillDisappear")
    }
    
    
    
    
    // Do any additional setup after loading the view.
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
}

// 팔로잉 버튼 함수
func BtnStyle(your_btn : UIButton) {
    your_btn.setTitle("팔로잉", for: .normal)
    your_btn.backgroundColor = UIColor.white
    your_btn.setTitleColor(UIColor.black, for: .normal)
    your_btn.layer.borderColor = UIColor.black.cgColor
    your_btn.layer.borderWidth = 1.0
}




extension PickViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CompanyTableViewCell", for: indexPath) as! CompanyTableViewCell
        
        cell.cFollow.layer.cornerRadius = 5
        
        cell.cLogoImg.image = UIImage(named: cLogos[indexPath.row])
        cell.cName.text = cNames[indexPath.row]
        cell.cKind.text = cKinds[indexPath.row]
        
        
        
        //버튼 태그에 인덱스를 부여
        /*
         왜? -> 팔로잉 버튼 클릭시 액션시트 올릴때 각 기업의 인덱스가 필요하기 때문에
         */
        cell.cFollow.tag = indexPath.row
        
        //didTap 함수 호출
        cell.cFollow.addTarget(self, action: #selector(didTap(_:)), for: .touchUpInside)
        
        
        //이미 팔로우 하고 있는 회사면, 버튼 바꿔줘.
        for a in followings{
            if cNames.contains(a as! String), let idx = cNames.firstIndex(of: a as! String) {
                //print("idx= \(idx)")
                if indexPath.row == idx {
                    BtnStyle(your_btn: cell.cFollow)
                }
            }
        }
        
        return cell
    }
    
    
}

extension PickViewController : UITableViewDelegate {
    
}
