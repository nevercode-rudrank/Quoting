//
//  AuthorRow.swift
//  Quoty
//
//  Created by Rudrank Riyam on 16/03/22.
//

import SwiftUI
import QuoteKit

struct AuthorRow: View {
    var author: Author

    var body: some View {
        HStack {
            AsyncImage(url: QuoteKit.authorImage(with: author.slug)) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(12)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 70, height: 70)

            Text(author.name)
        }
    }
}
