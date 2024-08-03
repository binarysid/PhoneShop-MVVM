//
//  MockDataService.swift
//  PhoneShop
//
//  Created by Linkon on 3/8/24.
//

class MockDataService: DataService {
    func fetchList() async throws -> [Product] {
        return PreViewLoader.products
    }
}

extension MockDataService {
    func postFeedback(_ data: FeedbackData) async throws {
       
    }
}
