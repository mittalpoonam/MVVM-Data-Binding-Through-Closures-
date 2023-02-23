//
//  ProductCell.swift
//  mvvm
//
//  Created by poonam mittal on 23/02/23.
//

import UIKit

class ProductCell: UITableViewCell {

   
    @IBOutlet weak var productBackgroundView: UIView!
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productCategoryLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var rateButton: UIButton!
    
    var product: Product? {
        didSet { //property observer
            productDetailConfiguration()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        productBackgroundView.clipsToBounds = false
        productBackgroundView.layer.cornerRadius = 15
        
        productImageView.layer.cornerRadius = 10
        
        self.productBackgroundView.backgroundColor = .systemGray6
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func productDetailConfiguration(){
        guard let  product else { return }
        productTitle.text = product.title
        productCategoryLabel.text = product.category
        descriptionLabel.text = product.description
        priceLabel.text = "$\(product.price)"
        rateButton.setTitle("\(product.rating.rate)", for: .normal)
        productImageView.setImage(with: product.image)
    }
}
