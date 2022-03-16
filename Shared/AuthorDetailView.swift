//
//  AuthorDetailView.swift
//  Quoty
//
//  Created by Rudrank Riyam on 16/03/22.
//

import SwiftUI
import QuoteKit

struct AuthorDetailView: View {
    @State private var quotes: Quotes?
    var author: Author

    var body: some View {
        ScrollView(showsIndicators: false) {
            AsyncImage(url: QuoteKit.authorImage(with: author.slug)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(12)
            } placeholder: {
                ProgressView()
            }

            Text(author.name)
                .font(.largeTitle)
                .padding(.bottom)

            Text(author.bio)
                .font(.title2)
                .lineSpacing(2)
                .padding(.bottom)

            Text("Quotes")
                .font(.largeTitle)
                .padding()

            if let quotes = quotes {
                ForEach(quotes.results) { quote in
                    Text(quote.content)
                        .font(.callout)
                        .padding()
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            
        }
        .padding(.horizontal)
        .task {
            do {
                quotes = try await QuoteKit.quotes(authors: [author.slug])
            } catch {

            }
        }
    }
}
