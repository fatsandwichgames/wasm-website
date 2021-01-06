//
//  Project.swift
//  Games
//
//  Created by Szymon Lorenz on 9/12/20.
//

import Foundation

struct Project: Identifiable {
    let id: String
    let name: String
    let description: String
    let appStoreUrl: String
    let thumbnailUrl: String
    var youtube: String? = nil
    var facebook: String? = nil
    var instagram: String? = nil
    var twitter: String? = nil
}
