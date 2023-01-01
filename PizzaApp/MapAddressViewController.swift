//
//  MapAddressViewController.swift
//  PizzaApp
//
//  Created by Магомед Аллахвердиев on 27.12.2022.
//

import UIKit
import MapKit



class MapAddressViewController: UIViewController, MKMapViewDelegate, UIGestureRecognizerDelegate {
    
    
    @IBAction func readyMapButton(_ sender: Any) {
        print(deliveryInfo)
        tranferAddressDelegate?.updateAdress(deliInfo: deliveryInfo ?? DeliveryInfo(city: "", street: "", house: ""))
        dismiss(animated: true)
    }
    @IBOutlet weak var mapView: MKMapView!
    
    
    var keyLat: Float = 59.940082
    var keyLong: Float = 30.312814
    var objectLatitude: Double = 0
    var objectLongitude: Double = 0
    var userAddress: DeliveryInfo?
    var result: YandexGeocoder?
    var tranferAddressDelegate: TransferAddressFromMapDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.mapType = MKMapType.standard
        
        setLocation()
        longTapGesture()
    
    }
    
    // MARK: Метод, когторый задаёт изначальные координаты на карте при переходе на экран карты (ценрт Санкт-Петербурга)
    
    func setLocation() {
        let location = CLLocationCoordinate2D(latitude: CLLocationDegrees(keyLat), longitude: CLLocationDegrees(keyLong))
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        

    }
    
    // MARK: Методы, которые отслеживают долгое нажатие на экран
    
    func longTapGesture() {
        let longTapGesture = UILongPressGestureRecognizer(target: self, action: #selector(handleLongTapGesture(gestureRecognizer:)))
        self.mapView.addGestureRecognizer(longTapGesture)
    }
    
    @objc func handleLongTapGesture(gestureRecognizer: UILongPressGestureRecognizer) {
        
        if gestureRecognizer.state != UIGestureRecognizer.State.ended {
            let touchLocation = gestureRecognizer.location(in: mapView)
            let locationCoordinate = mapView.convert(touchLocation, toCoordinateFrom: mapView)
            
            objectLatitude = locationCoordinate.latitude
            objectLongitude = locationCoordinate.longitude
            print("tap at latitude and longitude \(objectLatitude) \(objectLongitude)")
            
            
            let urlString = "https://geocode-maps.yandex.ru/1.x/?apikey=a2a4cfc3-1fc3-482b-b68b-3ee70975de89&format=json&geocode=\(objectLongitude),\(objectLatitude)"
            print(urlString)
            parseJSON(urlString: urlString) { _,_ in }
            
            usleep(500000)
            let myPin = MKPointAnnotation()
            myPin.coordinate = locationCoordinate
            print(userAddress.self)
            myPin.title = "\(userAddress?.city ?? "") \(userAddress?.street ?? "") \(userAddress?.house ?? "")"
            mapView.addAnnotation(myPin)
        }
        
        if gestureRecognizer.state != UIGestureRecognizer.State.began { return }
    }
    
    // MARK: Который делает запрос в geoCoder api Яндекса и декодирует данные в структуру YandexGeocoder
    
    func parseJSON(urlString: String, completed: @escaping (Data?, Error?) -> Void) {
        
        let url = URL(string: urlString)
        
        URLSession.shared.dataTask(with: url!) { data, response, error in
            
            if data == data {
                do {
                    self.result = try JSONDecoder().decode(YandexGeocoder.self, from: data!)
                    DispatchQueue.main.async {
                        completed(data, nil)
                    }
                    
                    if self.result?.response.GeoObjectCollection.featureMember[0].GeoObject.metaDataProperty.GeocoderMetaData.Address.Components.count == 6 {
                        self.userAddress = DeliveryInfo(
                            city: self.result?.response.GeoObjectCollection.featureMember[0].GeoObject.metaDataProperty.GeocoderMetaData.Address.Components[3].name ?? "",
                            street: self.result?.response.GeoObjectCollection.featureMember[0].GeoObject.metaDataProperty.GeocoderMetaData.Address.Components[4].name ?? "",
                            house: (self.result?.response.GeoObjectCollection.featureMember[0].GeoObject.metaDataProperty.GeocoderMetaData.Address.Components[5].name))
                        deliveryInfo = self.userAddress
                        print(self.userAddress,"1")
                    } else {
                        self.userAddress = DeliveryInfo(
                            city: self.result?.response.GeoObjectCollection.featureMember[0].GeoObject.metaDataProperty.GeocoderMetaData.Address.Components[3].name ?? "",
                            street: self.result?.response.GeoObjectCollection.featureMember[0].GeoObject.metaDataProperty.GeocoderMetaData.Address.Components[4].name ?? "",
                            house: "")
                        deliveryInfo = self.userAddress
                        print(self.userAddress,"2")
                    }
                } catch {
                    print(error.localizedDescription)
                }
            }
        }.resume()
    }

}

