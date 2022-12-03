//
//  ContactsTableViewCell.swift
//  PizzaApp
//
//  Created by Магомед Аллахвердиев on 21.11.2022.
//

import UIKit

class ContactsTableViewCell: UITableViewCell {
    
    @IBAction func YoutubeButton(_ sender: Any) {
        let youtubeURL = URL(string: "https://youtube.com/@DodoPizzaRussia")!
        UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil)
    }
    
    @IBAction func VKButton(_ sender: Any) {
        let vkURL = URL(string: "https://vk.com/dodo")!
        UIApplication.shared.open(vkURL, options: [:], completionHandler: nil)
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.overrideUserInterfaceStyle = .light
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
