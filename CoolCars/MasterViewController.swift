//
//  MasterViewController.swift
//  CoolCars
//
//  Created by Németh László Harri on 2019. 01. 13..
//  Copyright © 2019. Németh László Harri. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var carBrands = [CarBrand]()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.leftBarButtonItem = editButtonItem

        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(insertNewObject(_:)))
        navigationItem.rightBarButtonItem = addButton
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        addCarBrand(brandName: "BMW", brandImageName: "BMWLogo")
        addCarBrand(brandName: "Audi", brandImageName: "AudiLogo")
        addCarBrand(brandName: "Mercedes", brandImageName: "MercedesLogo")
        addCarBrand(brandName: "Lexus", brandImageName: "LexusLogo")
}

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    @objc
    func insertNewObject(_ sender: Any) {
        let df = DateFormatter()
        df.dateFormat = "yyyy-MM-dd hh:mm:ss"
        let now = df.string(from: Date())
        carBrands.insert(CarBrand.init(carBrandName: now, carBrandImageName: ""), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }
    
    func addCarBrand(brandName: String, brandImageName : String) {
        carBrands.insert(CarBrand.init(carBrandName: brandName, carBrandImageName: brandImageName), at: 0)
        let indexPath = IndexPath(row: 0, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let carBrand = carBrands[indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.detailItem = carBrand.carBrandName
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return carBrands.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CarBrandCell = tableView.dequeueReusableCell(withIdentifier: "CarBrandCell", for: indexPath) as! CarBrandCell

        let carBrand = carBrands[indexPath.row]
        cell.carBrandCellOutlet.text = carBrand.carBrandName
        cell.carBrandLogoImage.image = carBrand.carBrandImage
        return cell
        
        // this needs to bechecked:
        // https://stackoverflow.com/questions/15499376/uiimageview-aspect-fit-and-center
    }

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            carBrands.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }


}

