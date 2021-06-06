//
//  Array+.swift
//  
//
//  Created by  on 2021/06/02.
//

import Foundation

extension Array {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
