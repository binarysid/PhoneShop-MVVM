//
//  DataService.swift
//  PhoneShop
//
//  Created by Linkon on 12/9/23.
//

import Foundation

protocol DataService {
    func fetchList() async throws -> [Product]
    func postFeedback(_ data: FeedbackData) async throws
}
