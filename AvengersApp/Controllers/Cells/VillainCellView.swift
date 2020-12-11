//
//  VillainCellView.swift
//  AvengersApp
//
//  Created by Tim Acosta on 8/12/20.
//


import UIKit

class VillainCellView: UITableViewCell {
    //MARK:- IBOutlet    
    @IBOutlet var villainCellView: UIView?
    @IBOutlet var villainCellImage: UIImageView?
    @IBOutlet var villainCellName: UILabel?
    
    //MARK:- Instantiate view
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        villainCellView?.layer.cornerRadius = 4.0
        villainCellView?.layer.shadowColor = UIColor.gray.cgColor
        villainCellView?.layer.shadowOffset = CGSize.zero
        villainCellView?.layer.shadowOpacity = 0.7
        villainCellView?.layer.shadowRadius = 4.0
        
        villainCellImage?.layer.cornerRadius = 4.0
        
    }
    
    //MARK:- Re-use view
    override func prepareForReuse() {
        super.prepareForReuse()
        
        villainCellImage?.image = nil
        villainCellName?.text = nil
        
    }
    
    
    //MARK:- Configure view
    func configureViews (villain: Villain) {
        villainCellImage?.image = UIImage(named: villain.image ?? "")
        villainCellName?.text = villain.name
    }
    
}

