//
//  LoginViewController.swift
//  HarriTask
//
//  Created by hadeel on 1/17/19.
//  Copyright © 2019 Hadeel. All rights reserved.
//

import UIKit

var keyboardHeight: CGFloat?

var keyboardAnimationDuration: TimeInterval = 0.2

class LoginViewController: UIViewController {
   
    // MARK: parameters
    // Stored parameters
    var presenter: LoginPresenter?
    var image: UIImage?
    var bluerImage: UIImage?
    
    // IBOutlet parameters
    @IBOutlet weak var containerBottomConstaraint: NSLayoutConstraint!
    @IBOutlet weak var LoginButton: UIButton!
    @IBOutlet weak var userEmail: TextField!
    @IBOutlet weak var userPassword: TextField!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var forgetPasswordButton: UIButton!
    @IBOutlet weak var BluerView: UIVisualEffectView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set defaults values
        presenter = LoginPresenter(view: self)
        
        // add observers
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // add gesture to background image to hide keyboard
        self.BluerView.addGestureRecognizer(UITapGestureRecognizer.init(target: self, action: #selector(hideKeyboard)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.setAppearanceForUIElements()
    }
    
    // MARK: Keyboard observer function
    @objc fileprivate func keyboardWillShow(_ notification: Notification) {
        
        self.hideButtons(false)

        if let info = notification.userInfo, let keyboardFrame: NSValue = (info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue), let animationDurationValue: NSNumber = info[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber {
            
            keyboardAnimationDuration = TimeInterval(animationDurationValue.floatValue)
            
            keyboardHeight = keyboardFrame.cgRectValue.height
        }
        
        self.containerBottomConstaraint.constant = keyboardHeight ?? 300
        
        BluerView.isHidden = false
        
        UIView.animate(withDuration: keyboardAnimationDuration, animations: { [weak self] in
        
            self?.view.layoutIfNeeded()
        })
    }
    
    @objc fileprivate func keyboardWillHide(_ notification: Notification) {
        
        self.hideButtons(true)
        
        self.containerBottomConstaraint.constant = 0

        BluerView.isHidden = true

        UIView.animate(withDuration: keyboardAnimationDuration, animations: { [weak self] in
            
            
            self?.view.layoutIfNeeded()
        })
    }
    
    // set style
    func setAppearanceForUIElements(){
      
        userEmail.layer.borderWidth = 1
        userEmail.layer.borderColor = UIColor.white.cgColor
        userPassword.layer.borderColor = UIColor.white.cgColor
        userPassword.layer.borderWidth = 1

        userEmail.roundCorners([.topRight, .topLeft], radius: 10.0)
        userPassword.roundCorners([.bottomLeft, .bottomRight], radius: 10.0)
    }
    
    func hideButtons(_ hide: Bool) {
        
        self.LoginButton.isHidden = hide
        self.forgetPasswordButton.isHidden = hide
    }
    
    @objc func hideKeyboard() {
        
        self.view.endEditing(true)
    }
    
    // MARK: Button Actions
    @IBAction func loginButtonClicked(_ sender: Any) {
        
        presenter?.fetchUserData(email: self.userEmail.text, password: self.userPassword.text)
    }
}


extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField.returnKeyType == .next {
            
            self.userPassword.becomeFirstResponder()
       
        } else {
          
            self.hideKeyboard()

        }

        return true
    }

    // MARK: TextField events
    @IBAction func textFieldDidChange(_ sender: Any) {
        
        guard let email = self.userEmail.text, let password = self.userPassword.text else {return}
        
        let isValid = presenter?.isValid(email, password) ?? false
        
        self.LoginButton.isEnabled = isValid
        
        self.LoginButton.titleLabel?.textColor = isValid ? .white : .gray
    }
}

extension LoginViewController: LoginViewDelegate {
    
    func loginAction() {
    
        SceneRouter.presentHomeScreenViewController()
    }
    
    func errorMessage() {
        
        let alertController = UIAlertController(title: "Some Error",
                                                message: "Pleas confirm?",
                                                preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        
        self.present(alertController, animated: true, completion: nil)
        
    }
}
