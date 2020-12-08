//
//  HeroesViewController.swift
//  AvengersApp
//
//  Created by Tim Acosta on 8/12/20.
//

import UIKit

class HeroesViewController: UIViewController {
    //MARK:- IBOutlets
    @IBOutlet var tableView: UITableView?
    
    //MARK:- Private properties
    private let heroeRepository = HeroeRepository()
    private var heroes: Heroes = []
    
    //MARK:- States
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView?.delegate = self
        tableView?.dataSource = self
        
        loadData()
        
    }
    
    
    //MARK:- Private Functions
    private func loadData(){
        heroes = heroeRepository.heroesList
    }
    
}

extension HeroesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeroeCellView", for: indexPath) as? HeroeCellView
        
        if(indexPath.row < heroes.count) {
            cell?.configureViews(heroe: heroes[indexPath.row])
        }
        
        return cell ?? UITableViewCell()
    }
    
    
}
