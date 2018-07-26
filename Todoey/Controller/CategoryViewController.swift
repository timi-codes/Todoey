//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Tejumola David on 7/26/18.
//  Copyright © 2018 Tejumola David. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    
    var categoryArray = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate)
        .persistentContainer.viewContext
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadCategory()
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add Category", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            let newCategory = Category(context: self.context)
            newCategory.name = textField.text!
            self.categoryArray.append(newCategory)
            self.saveCategory()
        }
        
        alert.addTextField { (alerttextField) in
            alerttextField.placeholder = "Create Category"
            textField = alerttextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    //MARK: - Tableview Datasource Methods
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        
        cell.textLabel?.text = categoryArray[indexPath.row].name

        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray.count
    }
    
    //MARK: - Tableview Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "gotoItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! TodoListViewController
        
        if let indexPath = tableView.indexPathForSelectedRow {
            destinationVC.selectedCategory = categoryArray[indexPath.row]
        }
    }
    
    
    //MARK: - Data manipulation methods
    func loadCategory(with request : NSFetchRequest<Category> = Category.fetchRequest()){
        do{
            categoryArray = try context.fetch(request)
        }catch{
            print("error loading context \(error)")
        }
        tableView.reloadData()
    }

    
    func saveCategory(){
        do {
            try context.save()
        }
        catch{
            print("error saving context \(error)")
        }
        self.tableView.reloadData()
    }
    
  
}
