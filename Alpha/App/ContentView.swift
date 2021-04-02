//
//  ContentView.swift
//  Alpha
//
//  Created by addin on 30/03/21.
//

import SwiftUI
import Common
import Category

struct ContentView: View {
  
  @EnvironmentObject var homePresenter: GetListPresenter<Any, CategoryModel, Interactor<Any, [CategoryModel], GetCategoryRepository <GetCategoriesLocaleDataSource, GetCategoriesRemoteDataSource, CategoryTransformer>>>
  
    var body: some View {
      NavigationView {
        HomeView(presenter: homePresenter)
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
