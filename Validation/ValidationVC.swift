//
//  ViewController.swift
//  Validation
//
//  Created by Belal medhat on 8/18/20.
//  Copyright © 2020 Belal medhat. All rights reserved.
//

import UIKit

class ValidationVC: UIViewController {
    var validate:ValidateFunctions!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.validate = Validation()
        // Do any additional setup after loading the view.
        PasswordNote.alpha = 0
        UserNameNote.alpha = 0
        EmailNote.alpha = 0
        Email.addPadding(padding: .left(10))
        Password.addPadding(padding: .left(10))
        UserName.addPadding(padding: .left(10))
    }
    @IBAction func Name(_ sender: UITextField) { // Editing Changed IBOutlet
        UserNameNote.alpha = 0
        UserNameNote.text = ""

              do{
                  try validate.validateName(name: UserName.text ?? "")
                  Email.isUserInteractionEnabled = true
                  Password.isUserInteractionEnabled = true
              }catch{
                  UserNameNote.text = "\(error)"
                  Email.isUserInteractionEnabled = false
                  Password.isUserInteractionEnabled = false
                  UserNameNote.alpha = 1
              }
    }
    @IBAction func Email(_ sender: UITextField) { // Editing Changed IBOutlet
        EmailNote.alpha = 0
        EmailNote.text = ""
           do{
               try validate.validateEmail(email: Email.text ?? "")
               UserName.isUserInteractionEnabled = true
               Password.isUserInteractionEnabled = true

           }catch{
               EmailNote.text = "\(error)"
               UserName.isUserInteractionEnabled = false
               Password.isUserInteractionEnabled = false
               EmailNote.alpha = 1
           }

    }
    @IBAction func Password(_ sender: UITextField) { // Editing Changed IBOutlet
        PasswordNote.alpha = 0
        PasswordNote.text = ""

        do{
            try validate.validatePassword(password: Password.text ?? "")
            Email.isUserInteractionEnabled = true
            UserName.isUserInteractionEnabled = true

        }catch{
            PasswordNote.text = "\(error)"
            Email.isUserInteractionEnabled = false
            UserName.isUserInteractionEnabled = false
            PasswordNote.alpha = 1
        }
    }
    @IBOutlet weak var PasswordNote: UILabel!
    @IBOutlet weak var EmailNote: UILabel!
    @IBOutlet weak var UserNameNote: UILabel!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var UserName: UITextField!
 
    @IBAction func SignUp(_ sender: UIButton) {
        guard Password.text != "" && UserName.text != "" && Email.text != "" else {
            Message(Title: "Error", Msg: "EmptyFields")

            return }
        Message(Title: "", Msg: "Registered Successfully")
    }
    func Message(Title:String,Msg:String){
        let alert = UIAlertController(title: Title, message: Msg, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

