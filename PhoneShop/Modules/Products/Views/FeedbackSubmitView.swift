//
//  FeedbackSubmitView.swift
//  PhoneShop
//
//  Created by Linkon Sid on 9/28/23.
//

import SwiftUI

struct FeedbackSubmitView: View {
    @EnvironmentObject private var store: ProductStoreModel
    @Binding var rating: Int

    var body: some View {
        Button(action: {
            onSubmitFeedback()
        }, label: {
            Text("Submit Feedback")
                .bold()
                .foregroundStyle(.white)
                .padding()
                .background(.blue)
                .clipShape(Capsule())
        })
    }
}

extension FeedbackSubmitView {
    func onSubmitFeedback() {
        Task {
            do {
                try await store.submitFeedback(FeedbackData(rating: rating, review: ""))
            } catch {
                
            }
        }
    }
}

#Preview {
    @State var rating = 0
    return FeedbackSubmitView(rating: $rating)
}
