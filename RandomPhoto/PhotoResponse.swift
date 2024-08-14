//
//  PhotoResponse.swift
//  RandomPhoto
//
//  Created by Lesley Lopez on 8/14/24.
//

import Foundation

struct PhotoResponse: Codable {
    
    var urls: Urls?
}

struct Urls: Codable {
    var raw: String?
    var full: String?
    var regular: String?
    var small: String?
    var thumb: String?
}
