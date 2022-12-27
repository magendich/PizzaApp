//
//  AddressModel.swift
//  PizzaApp
//
//  Created by Магомед Аллахвердиев on 27.12.2022.
//

import Foundation


struct YandexGeocoder: Decodable {
    let response: Response
}

struct Response: Decodable {
    let GeoObjectCollection: GeoObjectCollection

}

struct GeoObjectCollection: Decodable {
    let featureMember: [FeatureMember]

}

struct FeatureMember: Decodable {
    let GeoObject: GeoObject

}

struct GeoObject: Decodable {
    let metaDataProperty: GeoObjectMetaDataProperty

}

struct GeoObjectMetaDataProperty: Decodable {
    let GeocoderMetaData: GeocoderMetaData

}

struct GeocoderMetaData: Decodable {
    let Address: Address

}

struct Address: Decodable {
    let Components: [Component]

}

struct Component: Decodable {
    let kind, name: String
}


