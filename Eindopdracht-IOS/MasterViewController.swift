//
//  MasterViewController.swift
//  Eindopdracht-IOS
//
//  Created by Stefan Willems on 26/03/2020.
//  Copyright © 2020 Stefan Willems. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var objects = [Any]()
    private var pokemons: [Pokemon]?


    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        pokemons = [];
        NetworkManager().fetchPokemons { (pokemons) in
            self.pokemons = pokemons
            DispatchQueue.main.async {
                self.tableView.reloadData()
                
            }
        }
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let object = pokemons![indexPath.row] as Pokemon
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = object
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemons!.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let object = pokemons![indexPath.row] as Pokemon
        
        if let viewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            viewController.detailItem = object
            navigationController?.pushViewController(viewController, animated: true)
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let object = pokemons![indexPath.row]
        cell.textLabel!.text = object.name
        cell.accessoryType = .detailDisclosureButton
        return cell
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let object = pokemons![indexPath.row]
        UserDefaults.standard.set(object.name, forKey: "favorite")
        self.showToast(controller: self, message: object.name + " has been favoritised" ,seconds: 1)
    }
    
    func showToast(controller: UIViewController, message : String, seconds: Double) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.black
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15
        
        controller.present(alert, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }

}

