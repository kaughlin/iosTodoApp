//
//  AddTodoViewController.swift
//  iosToDoapp
//
//  Created by Kaughlin Caver on 12/14/18.
//  Copyright © 2018 Kaughlin Caver. All rights reserved.
//

import UIKit

class AddTodoViewController: UIViewController {

    //MARK: Outlets

    @IBOutlet weak var inputTextview: UITextView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow(with:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
    }
    
    //MARK: Actions
    
    @objc func keyboardWillShow(with notification: Notification){
        
        let key = "UIKeyboardFrameEndUserInfoKey"
        
        guard let keyboardFrame = notification.userInfo?[key] as? NSValue else {return}
        
        let keyboardHeight = keyboardFrame.cgRectValue.height
        
        bottomConstraint.constant = keyboardHeight
        
        //animate it
        UIView.animate(withDuration: 0.3){
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func cancel(_ sender: UIButton) {
        //dismmiss view
        dismiss(animated: true)
    }
    @IBAction func done(_ sender: UIButton) {
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
