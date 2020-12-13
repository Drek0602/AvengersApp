//
//  DetailViewController.swift
//  AvengersApp
//
//  Created by Tim Acosta on 10/12/20.
//

import UIKit

protocol DetailViewDelegate {
    func updateData(_ heroe: Heroe?)
}

class DetailViewController: UIViewController {
    var heroe: Heroe? = nil
    var villain: Villain? = nil
    
    //MARK:- IBOutlets
    @IBOutlet var detailImage: UIImageView?
    @IBOutlet var detailName: UILabel?
    @IBOutlet var detailDescription: UILabel?
    @IBOutlet var detailActor: UILabel?
    @IBOutlet var detailSpecies: UILabel?
    
    //MARK: - Colors
    private let grayColor = UIColor(red: 128/255, green: 128/255, blue: 128/255, alpha: 1)

    
    //MARK:-States
    override func viewDidLoad() {
        super.viewDidLoad()
        print(heroe ?? "")
        print(villain ?? "")
        
        detailDescription?.layer.borderColor = grayColor.cgColor
        detailDescription?.layer.borderWidth = 1
        detailDescription?.layer.cornerRadius = 3
        
        detailDescription?.textAlignment = .center
        
    
        if heroe != nil {
            self.title = heroe?.name
            detailImage?.image = UIImage(named: heroe?.image ?? "")
            detailName?.text = heroe?.name
            detailDescription?.text = heroe?.description
            detailActor?.text = heroe?.actor
            detailSpecies?.text = heroe?.species
        } else {
            self.title = villain?.name
            detailImage?.image = UIImage(named: villain?.image ?? "")
            detailName?.text = villain?.name
            detailDescription?.text = villain?.description
            detailActor?.text = villain?.actor
            detailSpecies?.text = villain?.species
        }
        
        
    }
    
    
    
    func configureDetailView (heroe: Heroe) {
        detailImage?.image = UIImage(named: heroe.image ?? "")
        detailName?.text = heroe.name
        detailDescription?.text = heroe.description
    }
    
    
}
