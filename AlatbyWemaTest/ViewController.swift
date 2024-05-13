//
//  ViewController.swift
//  AlatbyWemaTest
//
//  Created by Computer on 5/9/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            // Perform the navigation to HomeViewController
            navigateToHomeViewController()
        }
        
        
        
        
        
        func navigateToHomeViewController() {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let homeViewController = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController {
                navigationController?.pushViewController(homeViewController, animated: true)
            }
        }
        
        
    }
    
}
