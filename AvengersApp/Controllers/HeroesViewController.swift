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
        
        title = "Heroes"
        
        loadData()
        
        tableView?.delegate = self
        tableView?.dataSource = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailViewController,
              let data = sender as? Heroe else {
            return
        }
        
        destination.heroe = data
        //destination.delegate = self
        //destination.heroe?.image = data.image
    }
    
    
    //MARK:- Private Functions
    private func loadData(){
        heroes = heroeRepository.heroesList
    }
    
    //MARK:- Public Functions
    func heroe(at indexPath: IndexPath) -> Heroe? {
        if (indexPath.row < heroes.count) {
            return heroes[indexPath.row]
        } else {
            return nil
        }
    }
    
}

extension HeroesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    //set row height
    /*func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return
    }*/
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeroeCellView", for: indexPath) as? HeroeCellView
        
        if(indexPath.row < heroes.count) {
            cell?.configureViews(heroe: heroes[indexPath.row])
        }
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row < heroes.count) {
            if let heroe = heroe(at: indexPath) {
                print(heroes[indexPath.row])
                performSegue(withIdentifier: "SEGUE_FROM_HEROES_TO_DETAIL",
                             sender: heroe)
            }
            
            
            /*let detailViewController = DetailViewController(nibName: "DetailViewController", bundle: nil)
            self.navigationController?.pushViewController(detailViewController, animated: true)*/
            
        }
    }
    
    
}

/*extension HeroesViewController: DetailViewDelegate {
    func updateData(_ heroe: Heroe?) {
        
    }*/
        
//}
