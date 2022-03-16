//
//  AuthorView.swift
//  Quoty
//
//  Created by Rudrank Riyam on 16/03/22.
//

import SwiftUI
import QuoteKit

struct AuthorView: View {
    var body: some View {
        List {
            ForEach(Authors.demoAuthors) { author in
                NavigationLink(destination: AuthorDetailView(author: author)) {
                    AuthorRow(author: author)
                }
            }
        }
        .navigationTitle("Authors")
#if os(macOS)
        .frame(minWidth: 300)
#endif
    }
}

struct AuthorView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorView()
    }
}
