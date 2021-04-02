//
//  CategoryRow.swift
//  Alpha
//
//  Created by addin on 31/03/21.
//

import SwiftUI
import SDWebImageSwiftUI
import Category

struct CategoryRow: View {
  
  var category: CategoryModel
  
  var body: some View {
    VStack {
      image
      content
    }
    .frame(width: UIScreen.main.bounds.width - 32, height: 250)
    .background(Color.blue.opacity(0.3))
    .cornerRadius(30)

  }
  
}

extension CategoryRow {
  
  var image: some View {
    WebImage(url: URL(string: category.image))
      .resizable()
      .indicator(.activity)
      .transition(.fade(duration: 0.5))
      .scaledToFit()
      .frame(width: 200)
      .cornerRadius(30)
      .padding(.top)
  }
  
  var content: some View {
    VStack(alignment: .leading, spacing: 10) {
      Text(category.title)
        .font(.title)
        .bold()
      Text(category.desc)
        .font(.system(size: 14))
        .lineLimit(2)
    }.padding()
  }
  
}
