//
//  ProductListViewController.swift
//  mvvm
//
//  Created by poonam mittal on 23/02/23.
//

import UIKit

class ProductListViewController: UIViewController {

    
    @IBOutlet weak var productTableView: UITableView!
    
    private var viewModel = ProductViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuration()
    }
    


}

extension ProductListViewController {
    
    func configuration() {
        productTableView.register(UINib(nibName: "ProductCell", bundle: nil), forCellReuseIdentifier: "ProductCell")
        initViewModel()
        observeEvent()
    }
    
    func initViewModel() {
        viewModel.fetchProducts()
    }
    
    // data binding event observe krega -> communication
    func observeEvent() {
        viewModel.eventHandler = { [weak self ] event in
            guard let self else { return }
            
            switch event {
            case .loading:
                print("product loading...")
            case .stopLoading:
                print("stop laoding")
            case .dataLoaded:
                print("data loaded")
                DispatchQueue.main.async {
                    // UI works in main VC best
                    self.productTableView.reloadData()
                }
            case .error(let error): break
                print(error)
            }
        }
    }
}



extension ProductListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell") as? ProductCell else{
            return UITableViewCell()
        }
        let product = viewModel.products[indexPath.row]
        cell.product = product
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}
