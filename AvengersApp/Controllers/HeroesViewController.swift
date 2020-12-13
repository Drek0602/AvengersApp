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
    
    
    
    //MARK:- Lifecycle States
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.parent?.title = "Heroes"
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationItem.title = "Heroes"
    
        
        //title = "Heroes"
        
        loadData()
        
        tableView?.delegate = self
        tableView?.dataSource = self
        
    }
    
    //MARK:- Prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailViewController,
              let data = sender as? Heroe else {
            return
        }
        
        destination.heroe = data
    }
    
    
    
    //MARK:- Private Functions
    //load heroes repo, being called in viewDidLoad
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
            
        }
        
    }
    
}

//TODO: Not being used 
extension HeroesViewController {
    func setTitles(navigationTitle: String, tabBarTitle: String) {
        title = tabBarTitle
        navigationItem.title = navigationTitle
    }
}

