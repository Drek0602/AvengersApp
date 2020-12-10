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
    
    //MARK:- IBOutlets
    @IBOutlet var detailImage: UIImageView?
    @IBOutlet var detailName: UILabel?
    @IBOutlet var detailDescription: UILabel?

    var delegate: DetailViewDelegate? = nil
    //private let heroeRepository = HeroeRepository()
    //private var heroes: Heroes = []

    
    //MARK:-States
    override func viewDidLoad() {
        super.viewDidLoad()
        print(heroe ?? "")
        
        detailImage?.image = UIImage(named: heroe?.image ?? "")
        detailName?.text = heroe?.name
        detailDescription?.text = heroe?.description
        
        
    }
    
    
    
    func configureDetailView (heroe: Heroe) {
        detailImage?.image = UIImage(named: heroe.image ?? "")
        detailName?.text = heroe.name
        detailDescription?.text = heroe.description
    }
    
    
}
