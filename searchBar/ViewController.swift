//
//  ViewController.swift
//  searchBar
//
//  Created by José Cadena on 07/08/18.
//  Copyright © 2018 José Cadena. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate, UISearchResultsUpdating, UISearchControllerDelegate {
    
    
    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController(searchResultsController:nil)
    
    struct estados{
        let estado: String
        let capital: String }

    
    var listaEstados = [estados(estado: "Oaxaca", capital:"Oaxaca"), estados(estado: "Jalisco", capital: "Guadalajara"),
                       estados(estado: "Chiapas", capital: "Tuxtla Gutierrez"), estados(estado: "Nuevo Leon", capital: "Monterrey"), estados(estado: "Durango", capital: "Durango")
    ]
    
    var filteredState = [estados]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        container.addSubview(searchController.searchBar)
        searchController.delegate = self
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        searchController.searchBar.showsCancelButton = false
        tableView.backgroundColor = UIColor.clear
        searchController.searchBar.layer.shadowColor = UIColor.gray.cgColor
        searchController.searchBar.layer.shadowOpacity = 0.4
        searchController.searchBar.layer.shadowOffset = CGSize.zero
        searchController.searchBar.layer.shadowRadius = 3
        searchController.searchBar.layer.masksToBounds = true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredState.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! statesCell
        cell.lblState.text = filteredState[indexPath.row].estado
        cell.lblCapital.text = filteredState[indexPath.row].capital
        return cell
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        searchController.searchBar.showsCancelButton = false
        if searchController.searchBar.text! == "" {
            filteredState = listaEstados } else {
            // Filter the results
            filteredState = listaEstados.filter {
                $0.estado.lowercased().contains(searchController.searchBar.text!.lowercased()) ||
                    $0.capital.lowercased().contains(searchController.searchBar.text!.lowercased()) }
        }
        tableView.reloadData()
    }

}

