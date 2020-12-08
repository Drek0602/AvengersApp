//
//  ViewController.swift
//  AvengersApp
//
//  Created by Tim Acosta on 2/12/20.
//

import UIKit

class SplashViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet var activityIndicator: UIActivityIndicatorView?
    
    
    //MARK:- States
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator?.startAnimating()
        
        navigateHome()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
        
    }
    
    //MARK:-Private functions
    
    private func navigateHome(){
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) { [weak self] in
            
            let storyboardAvengersHome = UIStoryboard(name: "AvengersHome", bundle: nil)
            
            if let destination = storyboardAvengersHome.instantiateInitialViewController(){
                self?.navigationController?.setViewControllers([destination], animated: true)
            }
            
            
        }
    }


}

