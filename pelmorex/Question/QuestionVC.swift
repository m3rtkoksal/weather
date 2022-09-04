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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        // Do any additional setup after loading the view.
    }
    
    func setup() {
        errorLabel.isHidden = true
        nameLabel.label(textStr: "Name",
                        textColor: UIColor.black,
                        textFont: UIFont.systemFont(ofSize: 12), lineSpacing: -0.12, paragraphStyle: NSMutableParagraphStyle())
        
        emailLabel.label(textStr: "Email",
                         textColor: UIColor.black,
                         textFont: UIFont.systemFont(ofSize: 12), lineSpacing: -0.12, paragraphStyle: NSMutableParagraphStyle())
        
        phoneLabel.label(textStr: "Phone number",
                          textColor: UIColor.black,
                          textFont: UIFont.systemFont(ofSize: 12), lineSpacing: -0.12, paragraphStyle: NSMutableParagraphStyle())
    }
    
    @IBAction func checkError(_ sender: UIButton) {
        self.checkEmail()
        self.checkName()
        self.checkPhone()
    }
    private func checkEmail() {
        if !emailTF.text!.isValidEmail() {
            mailErrorLabel.isHidden = false
            mailErrorLabel.label(textStr: "email is not correct",
                             textColor: UIColor.red,
                             textFont: UIFont.systemFont(ofSize: 12),
                             lineSpacing: -0.12,
                             paragraphStyle: NSMutableParagraphStyle())
            sendButton.backgroundColor = UIColor.red
        } else {
            mailErrorLabel.isHidden = true
            sendButton.backgroundColor = UIColor.blue
        }
    }
    
    private func checkName() {
        if !(nameTF.text?.isValidName ?? false) {
            errorLabel.isHidden = false
            errorLabel.label(textStr: "name is not correct",
                            textColor: UIColor.red,
                            textFont: UIFont.systemFont(ofSize: 12),
                            lineSpacing: -0.12,
                            paragraphStyle: NSMutableParagraphStyle())
            sendButton.backgroundColor = UIColor.red
        } else {
            errorLabel.isHidden = true
            sendButton.backgroundColor = UIColor.blue
        }
    }
    
    private func checkPhone() {
        if !phoneTF.text!.isPhone(){
            phoneErrorLabel.isHidden = false
            phoneErrorLabel.label(textStr: "phone is not correct",
                            textColor: UIColor.red,
                            textFont: UIFont.systemFont(ofSize: 12),
                            lineSpacing: -0.12,
                            paragraphStyle: NSMutableParagraphStyle())
            sendButton.backgroundColor = UIColor.red
        } else {
            phoneErrorLabel.isHidden = true
            sendButton.backgroundColor = UIColor.blue
        }
    }

}
