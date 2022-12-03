//
//  MapViewController.swift
//  PizzaApp
//
//  Created by Магомед Аллахвердиев on 21.11.2022.
//

import UIKit
import MapKit

class MapViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var MapViewController: MKMapView!
    @IBOutlet weak var CallUsButton: UIButton!
    @IBAction func CallUsAction(_ sender: Any) {
        callNumber(number: phoneNumber)
    }
    @IBOutlet weak var WriteToChatButton: UIButton!
    @IBAction func WriteToChatAction(_ sender: Any) {
        let writeToChatUrl = URL(string: "https://dodopizza.ru/peterburg/about")!
        UIApplication.shared.open(writeToChatUrl)
    }
    @IBOutlet weak var ContactsTableView: UITableView!
    let contactIdCell = "ContactsCell"
        
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addPinToMaP()
        
        ContactsTableView.dataSource = self
        ContactsTableView.delegate = self
        
        CallUsButton.layer.cornerRadius = 20
        WriteToChatButton.layer.cornerRadius = 20
        //self.overrideUserInterfaceStyle = .light
        
    }
    
    
    // MARK: Метод координат и создания пина на карте 
    
    func addPinToMaP() {
        
        let adressCoordinates = CLLocationCoordinate2D(latitude: 59.925959, longitude: 30.385613)
        let initialCoordinate = MKCoordinateRegion(center: adressCoordinates, latitudinalMeters: 1000, longitudinalMeters: 1000)
        
        MapViewController.setRegion(initialCoordinate, animated: true)
        let pin = PinAnnotation(title: "Коворкинг «Baza»", subtitle: "улица Александра Невского, 9Б", coordinate: adressCoordinates)
        MapViewController.addAnnotation(pin)
    }
    
    
    // MARK: Метод звонка
    
    let phoneNumber = "89811746543"
    func callNumber(number: String) {
        if let url = URL(string: "tel://\(number)") {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:]) { (success) in
                    print(success)
                }
            } else {
                let success = UIApplication.shared.openURL(url)
                print(success)
            }
        }
    }
    
    
    // MARK: Методы для работы с таблицей
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = ContactsTableView.dequeueReusableCell(withIdentifier: contactIdCell) as! ContactsTableViewCell
        return cell
    }
}

