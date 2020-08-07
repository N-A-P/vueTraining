//
//  LoginViewController.swift
//  Day5
//
//  Created by TuanDA on 8/6/20.
//  Copyright © 2020 TuanDA. All rights reserved.
//

import UIKit
import Alamofire



class LoginViewController: UIViewController {

    @IBOutlet weak var lblxinchao: UILabel!
    @IBOutlet weak var lblchaomung: UILabel!
    @IBOutlet weak var tendangnhap: UITextField!
    @IBOutlet weak var matkhau: UITextField!
    @IBOutlet weak var forgotpass: UILabel!
    @IBOutlet weak var singin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.singin.addTarget(self, action: #selector(actionLogin), for: .touchUpInside)

    }
    
    @objc func actionLogin() -> Void {
          // check empty
          let username: String = self.tendangnhap.text!
          let password: String = self.matkhau.text!
      
          if username == "" {
              self.showAlert(title: "Thông báo", message: "Không được để tên đăng nhập rỗng")
          }
          else if password == "" {
              self.showAlert(title: "Thong bao", message: "Không được để mật khẩu rỗng")
          }
          else {
              print("Thực hiện đăng nhập")
          }
    }
  func showAlert(title: String, message: String) -> Void {
        //
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Đồng ý", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
   
    func login(username: String, password: String) -> Void {
        let url = "https://api.quanlyluutru.com/checkLoginUserAPI"
        let param = ["user": username, "pass": password]
        
        AF.request(url, method: .post, parameters: param).responseJSON { (response) in
            switch response.result {
                
            case .success(_):
                print("Success = \(response)")
                
                break
            case .failure(_):
                print("Error failure")
                break
                
            }
        }
    }


}
