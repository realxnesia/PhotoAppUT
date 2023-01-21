//
//  SignupViewController.swift
//  PhotoAppUT
//
//  Created by DHIKA ADITYA ARE on 22/11/22.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    
    var signupPresenter: SignupPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
//        if signupPresenter == nil {
//            let signUpModelValidator = SignupFormModelValidator()
//            let webservice = SignupWebService(urlString: SignupConstants.urlSignup)
//            signupPresenter = SignupPresenter(formModelValidator: signUpModelValidator as! SignupModelValidatorProtocol,
//                            webservice: webservice,
//                            delegate: self)
//        }
    }

    @IBAction func signupButtonTapped(_ sender: Any) {
        //TODO: Harus ada actionnya, supaya kita testcasenya tidak error
        let data = SignupFormModel(firstName: "Dhika",
                                   lastName: "Aditya",
                                   email: "Dhika@gmail.com",
                                   password: "1234566",
                                   repeatPassword: "1234566")
        
        signupPresenter?.processUserSignup(with: data)
    }
}

extension SignupViewController: SignupViewDelegateProtocol {
    func successfullSignup() {

    }
    
    func errorHandler(error: SignupErrors) {
        
    }

}
