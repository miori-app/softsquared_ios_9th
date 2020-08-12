//
//  OrangeViewController.swift
//  SoftSquared_w03_wantedTable
//
//  Created by miori Lee on 2020/08/07.
//  Copyright © 2020 miori. All rights reserved.
//

import UIKit

//delegate protocol
protocol PickChangedDelegate {
    func showFollowing()
}

class FollowingCompanyVC: UIViewController, AddFollowing {
    
    func sendAddFollowing() {
        print(mycNames)
    }
    
//    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
//          self.tableView.reloadData()
//          refreshControl.endRefreshing()
//      }
//
//      lazy var refreshControl: UIRefreshControl = {
//          let refreshControl = UIRefreshControl()
//          refreshControl.addTarget(self, action:
//              #selector(handleRefresh(_:)),
//                                   for: UIControl.Event.valueChanged)
//          refreshControl.tintColor = UIColor.red
//
//          return refreshControl
//      }()
    
    
    var pickView : PickViewController?
    
    var tapCName : String?
    
    
    //delgate 선언
    var delegate : PickChangedDelegate?
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // 해당 cell의 indexPath.row에 맞는 action sheet 생성
    @objc func didTap(_ sender: UIButton){
        
        // sender의 tag는 인덱스로 생각해도 될듯
        let idx = sender.tag
        
        //삭제될 회사이름
        tapCName = mycNames[idx]
        print(tapCName!)
        
        
        // ActionSheet 띄우기
        //첫번쨰 :  문구
        let optionMenu = UIAlertController(title: nil, message: "기업 '\(tapCName!)' 팔로우 취소하시겠어요?", preferredStyle: .actionSheet)
        //두번째 : 액션 선택지
        let deleteAction = UIAlertAction(title: "팔로우 취소", style: .destructive, handler: { (alert: UIAlertAction!) -> Void in
            print("Yes")
            self.mycNames.remove(at: idx)
            self.cLocs.remove(at: idx)
            self.mycLogos.remove(at: idx)
            print(self.mycNames)
            print("ok")
            
        })
        //let deleteAction = UIAlertAction(title: "팔로우 취소", style: .destructive, handler: )
        //세번째 : 밑에 취소 버튼
        let cancelAction = UIAlertAction(title: "취소", style: .cancel)
        
        //네번째 : 이제 연결
        optionMenu.addAction(deleteAction)
        optionMenu.addAction(cancelAction)
        
        //마지막 : 보여줘!!
        self.present(optionMenu, animated: true, completion: nil)
        
        // 인기회사 뷰에 반영
        /*
         이때 navi랑 tab을 다 embed in 해놓아서 uinavigationcontroller도 써줘야함
         */
        if let vc1 = (self.tabBarController?.viewControllers![0] as? UINavigationController)?.viewControllers[0] as? PickViewController {
           //access your VC here
            vc1.followings.remove(at: idx)
        }
        //let vc1 = (self.tabBarController?.viewControllers?[0])! as! PickViewController
    }
    //
    //    @objc func dataDelete(_ sender: UIButton){
    //        let idx = sender.tag
    //        cNames.remove(at: idx)
    //        cLocs.remove(at: idx)
    //        cLogos.remove(at: idx)
    //        print(cNames)
    //    }
    
    var mycNames = ["화해(버드뷰)","원티드랩","왓챠"]
    var mycLogos = ["birdview","wanted","watcha"]
    var cLocs = ["서울특별시 마포구 와우산로 121","서울 송파구","서울 강남구"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "내 정보"
        
        tableView.dataSource = self
        tableView.delegate = self
        initRefresh()

        
        
        //        let myCustomCell = UINib(nibName: "CustomUITalbeViewCell", bundle: nil)
        //        self.tableView.register(myCustomCell, forCellReuseIdentifier: "CustomCell")
        
        // Do any additional setup after loading the view.
    }
    
    
//    /*
//     데이터 보내기 함수.
//     */
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let popularVC = segue.destination as? PickViewController else {
//            return
//        }
//        print("cNames : \(self.cNames)")
//        popularVC.followings = self.cNames
//    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(false)
        print("my infor view will appear")
        tableView.reloadData()

        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(false)
        let pickCompanyVC = self.storyboard?.instantiateViewController(withIdentifier: "PickViewController") as! PickViewController
        //print("followings : \(followingVC.cNames)")
        pickCompanyVC.followings = mycNames
        print("my info view will disappear : \(pickCompanyVC.followings)")
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    /*
     아래로 스크롤 했을 때 새로고침하기
     */
    func initRefresh() {
        let refresh = UIRefreshControl()
        refresh.addTarget(self, action: #selector(updateUI(refresh:)), for: .valueChanged)
        //띄어주는 문구
        refresh.attributedTitle = NSAttributedString(string: "잠시만여!!")
        
        if  #available(iOS 10.0, *) {
            tableView.refreshControl = refresh
        } else {
            tableView.addSubview(refresh)
        }
    }

    
    @objc func updateUI(refresh: UIRefreshControl) {
        refresh.endRefreshing() // refresh 종료
        tableView.reloadData() // tableview 로드
    }
    
}


extension FollowingCompanyVC : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mycNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomUITalbeViewCell", for: indexPath) as! CustomUITalbeViewCell
        
        cell.companyLogo.image = UIImage(named: mycLogos[indexPath.row])
        //print("ok")
        cell.companyName.text = mycNames[indexPath.row]
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
