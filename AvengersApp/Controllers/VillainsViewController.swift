//
//  VillainsViewController.swift
//  AvengersApp
//
//  Created by Tim Acosta on 10/12/20.
//

import UIKit

class VillainsViewController: UIViewController {
    //MARK:- IBOutlets
    @IBOutlet var tableView: UITableView?
    
    
    //MARK:- Private properties
    private let villainRepository = VillainRepository()
    private var villains: Villains = []
    
    //MARK:- Lifecycle States
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.parent?.title = "Villanos"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
        tableView?.delegate = self
        tableView?.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? DetailViewController,
              let data = sender as? Villain else {
            return
        }
        
        destination.villain = data
        //destination.delegate = self
        //destination.heroe?.image = data.image
    }
    
    //MARK:- Private Functions
    private func loadData(){
        villains = villainRepository.villainList
    }
    
    //MARK:- Public Functions
    func villain(at indexPath: IndexPath) -> Villain? {
        if (indexPath.row < villains.count) {
            return villains[indexPath.row]
        } else {
            return nil
        }
    }
    
}


extension VillainsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return villains.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VillainCellView", for: indexPath) as? VillainCellView
        
        if(indexPath.row < villains.count) {
            cell?.configureViews(villain: villains[indexPath.row])
        }
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row < villains.count) {
            if let villain = villain(at: indexPath) {
                print(villains[indexPath.row])
                performSegue(withIdentifier: "SEGUE_FROM_VILLAINS_TO_DETAIL",
                             sender: villain)
            }
            
            
            /*let detailViewController = DetailViewController(nibName: "DetailViewController", bundle: nil)
             self.navigationController?.pushViewController(detailViewController, animated: true)*/
            
        }
    }
    
    
}



