//
//  MDMusciProvider.swift
//  MusicDoge
//
//  Created by ANDY HUANG on 2021/7/4.
//

import Foundation

protocol MDMusicProviding {
    func fetchStoreFront() -> MDStoreFront?
}

class MDMusicProvider: MDMusicProviding {
    func fetchStoreFront() -> MDStoreFront? {
        return MDStoreFront.toOption(From: Data())
    }
}
