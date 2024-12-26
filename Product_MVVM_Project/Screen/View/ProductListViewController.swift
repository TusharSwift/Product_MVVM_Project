//
//  ProductListViewController.swift
//  Product_MVVM_Project
//
//  Created by Tushar on 25/12/24.
//

import UIKit

class ProductListViewController: UIViewController {

    @IBOutlet weak var productTableView: UITableView!
    
    var viewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       configuration()
    }
    
    func configuration(){
        self.productTableView.register(UINib(nibName: "ProductTableViewCell", bundle: nil), forCellReuseIdentifier: "ProductTableViewCell")
        initViewModel()
        observeEvent()
    }
    
    func initViewModel(){
        viewModel.getProducts()
    }
    
    func observeEvent(){
        viewModel.eventHandler = { [weak self]event in
            guard let self else {return}
            
            switch event{
            case .loading:
                print("Product Loading...")
            case .stopLoading:
                print("Stop Loading...")
            case .dataLoaded:
                print("Data Loaded...")
                DispatchQueue.main.async{
                    self.productTableView.reloadData()
                }
            case .message(let error):
                print(error)
            }
        }
    }
    

}

extension ProductListViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = productTableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as? ProductTableViewCell else{
            return UITableViewCell()
        }
        let product = viewModel.products[indexPath.row]
        cell.product = product
        return cell
    }
}
