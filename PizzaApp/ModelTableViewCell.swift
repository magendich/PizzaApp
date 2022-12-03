//
//  ModelTableViewCell.swift
//  PizzaApp
//
//  Created by Магомед Аллахвердиев on 18.11.2022.
//

import UIKit

class ModelTableViewCell: UITableViewCell {
    
    @IBOutlet weak var PizzaTitle: UILabel!
    @IBOutlet weak var PizzaPrice: UILabel!
    @IBOutlet weak var PizzaImage: UIImageView!
    @IBOutlet weak var PizzaDescription: UILabel!
    @IBOutlet weak var PizzaIngredients: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        PizzaIngredients.sizeToFit()
        PizzaPrice.layer.masksToBounds = true
        PizzaPrice.layer.cornerRadius = 10
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}

// MARK: Расширение и метод для парсинга картинки с ссылки из JSON 

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}

