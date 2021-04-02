//
//  HomeView.swift
//  Alpha
//
//  Created by addin on 31/03/21.
//

import SwiftUI
import Category
import Common

struct HomeView: View {
  
  @ObservedObject var presenter: GetListPresenter<Any, CategoryModel, Interactor<Any, [CategoryModel], GetCategoryRepository<GetCategoriesLocaleDataSource, GetCategoriesRemoteDataSource, CategoryTransformer>>>
  
  var body: some View {
    ZStack {
      if presenter.isLoading {
        loadingIndicator
      } else if presenter.isError {
        errorIndicator
      } else if presenter.list.isEmpty {
        emptyCategories
      } else {
        content
      }
    }
    .onAppear {
      if presenter.list.isEmpty {
        presenter.getList(request: nil)
      }
    }
    .navigationBarTitle("Meals App", displayMode: .automatic)
  }
}

extension HomeView {
  
  var loadingIndicator: some View {
    VStack {
      Text("Loading...")
      ProgressView()
        .progressViewStyle(CircularProgressViewStyle())
    }
  }
  
  var errorIndicator: some View {
    CustomEmptyView(
      image: "assetSearchNotFound",
      title: presenter.errorMessage
    ).offset(y: 80)
  }
  
  var emptyCategories: some View {
    CustomEmptyView(
      image: "assetNoFavorite",
      title: "The meal category is empty"
    ).offset(y: 80)
  }
  
  var content: some View {
    ScrollView {
      LazyVStack {
        ForEach(presenter.list) { category in
          ZStack {
            CategoryRow(category: category)
          }.padding(8)
        }
      }
    }
  }
  
}
