//
//  ViewController.swift
//  SoftSquared_w05_SocialLogin
//
//  Created by miori Lee on 2020/08/20.
//  Copyright © 2020 miori. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import NaverThirdPartyLogin


class LoginViewController: UIViewController {
    
    let loginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    
    
    //화면 구성
    private let loginButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "naver_login") as UIImage?
        button.setBackgroundImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        //button.setTitle("로그인", for: .normal)
        button.addTarget(self, action: #selector(touchUpLoginButton(_:)), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let logoutButton: UIButton = {
        let button = UIButton(type: .system)
        let image = UIImage(named: "logout") as UIImage?
        button.setBackgroundImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        //button.setTitle("로그아웃", for: .normal)
        button.addTarget(self, action: #selector(touchUpLogoutButton(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "name : "
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.text = "email : "
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let nicknameLabel: UILabel = {
        let label = UILabel()
        label.text = "nickname : "
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        layout()
        
    }
    
    //로그인
    @objc private func touchUpLoginButton(_ sender: UIButton) {
        loginInstance?.delegate = self
        loginInstance?.requestThirdPartyLogin()
    }
    
    //로그아웃
    
    @objc private func touchUpLogoutButton(_ sender: UIButton) {
        loginInstance?.requestDeleteToken()
        let alert = UIAlertController(title: "LOGOUT", message: "로그아웃!!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        self.nameLabel.text = "네이버"
        self.emailLabel.text = "로그인을"
        self.nicknameLabel.text = "해주세요"
    }
    
    private func getNaverInfo() {
        guard let isValidAccessToken = loginInstance?.isValidAccessTokenExpireTimeNow() else { return }
        
        if !isValidAccessToken {
            return
        }
        
        guard let tokenType = loginInstance?.tokenType else { return }
        guard let accessToken = loginInstance?.accessToken else { return }
        let urlStr = "https://openapi.naver.com/v1/nid/me"
        let url = URL(string: urlStr)!
        
        let authorization = "\(tokenType) \(accessToken)"
        
        
        
        //        let req = Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": authorization])
        
        //alamofire 5 version으로 수정
        let req = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: ["Authorization": authorization])
        req.responseJSON { response in
            guard let result = response.value as? [String: Any] else { return }
            guard let object = result["response"] as? [String: Any] else { return }
            guard let name = object["name"] as? String else { return }
            guard let email = object["email"] as? String else { return }
            guard let nickname = object["nickname"] as? String else { return }
            
            self.nameLabel.text = "name : \(name)"
            self.emailLabel.text = "email : \(email)"
            self.nicknameLabel.text = "nickname : \(nickname)"
        }
    }
    
    private func layout() {
        let guide = view.safeAreaLayoutGuide
        
        view.addSubview(loginButton)
        view.addSubview(logoutButton)
        view.addSubview(nameLabel)
        view.addSubview(emailLabel)
        view.addSubview(nicknameLabel)
        
        loginButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor,constant: +70).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -100).isActive = true
        
        logoutButton.leadingAnchor.constraint(equalTo: guide.leadingAnchor,constant: +70).isActive = true
        logoutButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -20).isActive = true
        
        //        logoutButton.leadingAnchor.constraint(equalTo: loginButton.trailingAnchor).isActive = true
        //        logoutButton.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        //        logoutButton.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: -30).isActive = true
        //        logoutButton.widthAnchor.constraint(equalTo: loginButton.widthAnchor).isActive = true
        
        //loginButton.frame = CGRect(x: 89, y: 800, width: 236, height: 52)
        //loginButton.layer.borderWidth = 1
        //loginButton.layer.borderColor = UIColor.red.cgColor
        
        nameLabel.topAnchor.constraint(equalTo: guide.topAnchor, constant: 30).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        
        emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 30).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        emailLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
        
        nicknameLabel.topAnchor
            .constraint(equalTo: emailLabel.bottomAnchor, constant: 30).isActive = true
        nicknameLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        nicknameLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    }
    
    
}

extension LoginViewController: NaverThirdPartyLoginConnectionDelegate {
    // 로그인 버튼을 눌렀을 경우 열게 될 브라우저
    func oauth20ConnectionDidOpenInAppBrowser(forOAuth request: URLRequest!) {
        //     let naverSignInVC = NLoginThirdPartyOAuth20InAppBrowserViewController(request: request)!
        //     naverSignInVC.parentOrientation = UIInterfaceOrientation(rawValue: UIDevice.current.orientation.rawValue)!
        //     present(naverSignInVC, animated: false, completion: nil)
        
        // UPDATE: 2019. 10. 11 (금)
        // UIWebView가 제거되면서 NLoginThirdPartyOAuth20InAppBrowserViewController가 있는 헤더가 삭제되었습니다.
        // 해당 코드 없이도 로그인 화면이 잘 열리는 것을 확인했습니다.
    }
    
    // 로그인에 성공했을 경우 호출
    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
        print("[Success] : Success Naver Login")
        getNaverInfo()
        //loginButton.isHidden = true
    }
    
    // 접근 토큰 갱신
    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
        
    }
    
    // 로그아웃 할 경우 호출(토큰 삭제)
    func oauth20ConnectionDidFinishDeleteToken() {
        loginInstance?.requestDeleteToken()
    }
    
    // 모든 Error
    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
        print("[Error] :", error.localizedDescription)
    }
}






