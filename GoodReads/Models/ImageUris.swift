//
//  ImageUris.swift
//  GoodReads
//
//  Created by User on 05/08/2019.
//  Copyright © 2019 Timur LLC. All rights reserved.
//

import Foundation

struct ImageUris: Codable {
    var small: String?
    var normal: String?
    var large: String?
    
    init(small: String?, normal: String?, large: String?) {
        self.small = small
        self.normal = normal
        self.large = large
    }
}
