//
//  QuestionVC.swift
//  pelmorex
//
//  Created by Mert Köksal on 4.09.2022.
//

import UIKit

class QuestionVC: UIViewController {
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var mailErrorLabel: UILabel!
    @IBOutlet weak var phoneErrorLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    var isCorrect: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        // Do any additional setup after loading the view.
    }
    
    func setup() {
        errorLabel.isHidden = true
        nameLabel.label(textStr: "Name",
                        textColor: UIColor.darkGray,
                        textFont: UIFont.systemFont(ofSize: 20, weight: .semibold),
                        lineSpacing: -0.25, paragraphStyle: NSMutableParagraphStyle())
        
        emailLabel.label(textStr: "Email",
                         textColor: UIColor.darkGray,
                         textFont: UIFont.systemFont(ofSize: 20, weight: .semibold),
                         lineSpacing: -0.25, paragraphStyle: NSMutableParagraphStyle())
        
        phoneLabel.label(textStr: "Phone number",
                         textColor: UIColor.darkGray,
                         textFont: UIFont.systemFont(ofSize: 20, weight: .semibold),
                         lineSpacing: -0.25, paragraphStyle: NSMutableParagraphStyle())
    }
    
    @IBAction func checkError(_ sender: UIButton) {
        self.checkEmail()
        self.checkName()
        self.checkPhone()
        if isCorrect {
            sendButton.backgroundColor = UIColor.blue
            showAlert()
        }
    }
    private func checkEmail() {
        if !emailTF.text!.isValidEmail() {
            mailErrorLabel.isHidden = false
            isCorrect = false
            mailErrorLabel.label(textStr: "email is not correct",
                             textColor: UIColor.red,
                             textFont: UIFont.systemFont(ofSize: 12),
                             lineSpacing: -0.12,
                             paragraphStyle: NSMutableParagraphStyle())
            sendButton.backgroundColor = UIColor.red
        } else {
            mailErrorLabel.isHidden = true
            isCorrect = true
        }
    }
    
    private func checkName() {
        if !(nameTF.text?.isValidName ?? false) {
            errorLabel.isHidden = false
            isCorrect = false
            errorLabel.label(textStr: "name is not correct",
                            textColor: UIColor.red,
                            textFont: UIFont.systemFont(ofSize: 12),
                            lineSpacing: -0.12,
                            paragraphStyle: NSMutableParagraphStyle())
            sendButton.backgroundColor = UIColor.red
        } else {
            errorLabel.isHidden = true
            isCorrect = true
        }
    }
    
    private func checkPhone() {
        if !phoneTF.text!.isPhone(){
            phoneErrorLabel.isHidden = false
            isCorrect = false
            phoneErrorLabel.label(textStr: "phone is not correct",
                            textColor: UIColor.red,
                            textFont: UIFont.systemFont(ofSize: 12),
                            lineSpacing: -0.12,
                            paragraphStyle: NSMutableParagraphStyle())
            sendButton.backgroundColor = UIColor.red
        } else {
            phoneErrorLabel.isHidden = true
            isCorrect = true
        }
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Success", message: "Your question is sent.", preferredStyle: UIAlertController.Style.alert)

              // add an action (button)
              alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))

              // show the alert
              self.present(alert, animated: true, completion: nil)
    }

}
