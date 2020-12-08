//
//  HeroeCellView.swift
//  AvengersApp
//
//  Created by Tim Acosta on 8/12/20.
//

import UIKit

class HeroeCellView: UITableViewCell {
    //MARK:- IBOutlets
    @IBOutlet var heroCellView: UIView?
    @IBOutlet var heroeCellImage: UIImageView?
    @IBOutlet var heroeCellName: UILabel?
    
    //MARK:- Instantiate view
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        heroCellView?.layer.cornerRadius = 4.0
        heroCellView?.layer.shadowColor = UIColor.gray.cgColor
        heroCellView?.layer.shadowOffset = CGSize.zero
        heroCellView?.layer.shadowOpacity = 0.7
        heroCellView?.layer.shadowRadius = 4.0
        
        heroeCellImage?.layer.cornerRadius = 4.0
        
    }
    
    //MARK:- Re-use view
    override func prepareForReuse() {
        super.prepareForReuse()
        
        heroeCellImage?.image = nil
        heroeCellName?.text = nil
        
    }
    
    
    //MARK:- Configure view
    
    func configureViews (heroe: Heroe) {
        heroeCellImage?.image = UIImage(named: heroe.image ?? "")
        heroeCellName?.text = heroe.name
    }
    
}
