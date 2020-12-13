//
//  ViewController.swift
//  AvengersApp
//
//  Created by Tim Acosta on 2/12/20.
//

import UIKit

class SplashViewController: UIViewController {
    
    //MARK:- IBOutlets
    @IBOutlet var progressView: UIProgressView?
    
    //MARK:-Constant - ProgressView
    let progress = Progress(totalUnitCount: 6)
    
    //MARK:- Properties

    
    
    //MARK:- States
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startProgress()
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
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(6)) { [weak self] in
            
            let storyboardAvengersHome = UIStoryboard(name: "AvengersHome", bundle: nil)
            
            if let destination = storyboardAvengersHome.instantiateInitialViewController(){
                self?.navigationController?.setViewControllers([destination], animated: true)
            }
            
            
        }
    }
    
    private func startProgress(){
        
        progressView?.progress = 0.0
        progress.completedUnitCount = 0
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (timer) in
            guard self.progress.isFinished == false else {
                timer.invalidate()
                return
            }
            
            self.progress.completedUnitCount += 1
            self.progressView?.setProgress(Float (self.progress.fractionCompleted), animated: true)
            
        }
        
    }


}

