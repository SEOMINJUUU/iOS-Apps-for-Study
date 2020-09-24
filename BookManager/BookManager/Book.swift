//
//  Book.swift
//  BookManager
//
//  Created by 서민주 on 2020/09/24.
//  Copyright © 2020 minjuseo. All rights reserved.
//

import Foundation

struct Book {
    var name: String?
    var genre: String?
    var author: String?
    
    func bookPrint() {
        print("name: \(name!)")
        print("genre: \(genre!)")
        print("author: \(author!)")
        print("-----------------")
    }
}
