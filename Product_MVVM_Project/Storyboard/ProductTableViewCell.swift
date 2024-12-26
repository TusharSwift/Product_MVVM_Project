//
//  ProductTableViewCell.swift
//  Product_MVVM_Project
//
//  Created by Tushar on 26/12/24.
//

import UIKit

class ProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productBackgroundView: UIView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productCateogryLbl: UILabel!
    @IBOutlet weak var rateBtn: UIButton!
    @IBOutlet weak var productDescription: UILabel!
    @IBOutlet weak var priceLbl: UILabel!
    var product : ProductModel?{
        didSet{
            productDetailConfig()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        productBackgroundView.clipsToBounds = false
        productBackgroundView.layer.cornerRadius = 15
        productImage.layer.cornerRadius = 10
        productImage.backgroundColor = .clear
        productBackgroundView.backgroundColor = .systemGray6
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func productDetailConfig(){
        guard let product else{return}
        productTitle.text = product.title
        productCateogryLbl.text = product.category
        productDescription.text = product.description
        priceLbl.text = "$\(product.price)"
        rateBtn.setTitle("\(product.rating.rate)", for: .normal)
        productImage.setImage(with: product.image)
    }
    
}
