//
//  UIImage + Extension.swift
//  IOSDevJobs
//
//  Created by Дмитрий Ахмеров on 25.08.2020.
//  Copyright © 2020 Denis Roenko. All rights reserved.
//

import UIKit

extension UIImage {
    
    func fetchImage(from string: String) -> UIImage? {
        guard let url = URL(string: string) else { return nil }
        var image: UIImage? = nil
        do {
            let data = try Data(contentsOf: url, options: [])
            image = UIImage(data: data)
        }
        catch {
            print(error.localizedDescription)
        }
        return image
    }
    
}
