//
//  DataService.swift
//  ListAsyncImageCache
//
//  Created by Linkon on 12/9/23.
//

import Foundation

protocol DataService {
    func fetchList() async throws -> [Product]
}
