//
//  DataModel.swift
//  ViewSeeker
//
//  Created by Minh Vo on 30/07/2023.
//

import Foundation
import CoreLocation

var destinations = decodeJsonFromJsonFile(jsonFileName: "destinations.json")

// How to decode a json file into a struct
func decodeJsonFromJsonFile(jsonFileName: String) -> [Destination] {
    if let file = Bundle.main.url(forResource: jsonFileName, withExtension: nil){
        if let data = try? Data(contentsOf: file) {
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([Destination].self, from: data)
                return decoded
            } catch let error {
                fatalError("Failed to decode JSON: \(error)")
            }
        }
    } else {
        fatalError("Couldn't load \(jsonFileName) file")
    }
    return [ ] as [Destination]
}
