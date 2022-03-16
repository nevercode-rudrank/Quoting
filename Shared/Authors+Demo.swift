//
//  Authors+Demo.swift
//  Quoty
//
//  Created by Rudrank Riyam on 16/03/22.
//

import Foundation
import QuoteKit

extension Authors {
    static var demoAuthors: [Author] {
        if let path = Bundle.main.path(forResource: "Authors", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let model = try JSONDecoder().decode(Authors.self, from: data)
                return model.results
            } catch let error {
                print("parse error: \(error.localizedDescription)")
                return []
            }
        } else {
            print("Invalid filename/path.")
            return []
        }
    }
}
