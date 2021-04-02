//
//  Injection.swift
//  Alpha
//
//  Created by addin on 31/03/21.
//

import UIKit
import Category
import Common

final class Injection: NSObject {
  
  func provideCategory<U: UseCase>() -> U where U.Request == Any, U.Response == [CategoryModel] {
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let locale = GetCategoriesLocaleDataSource(realm: appDelegate.realm)
    let remote = GetCategoriesRemoteDataSource(endpoint: Endpoints.Gets.categories.url)
    
    let mapper = CategoryTransformer()
    
    let repository = GetCategoryRepository(localeDataSource: locale, remoteDataSource: remote, mapper: mapper)
    
    return Interactor(repository: repository) as! U
    
  }
  
}
