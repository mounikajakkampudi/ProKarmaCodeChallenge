//
//  DataViewModel.swift
//  iOSChallenge
//
//  Created by Mounika Jakkampudi on 10/9/20.
//  Copyright © 2020 Tmobile. All rights reserved.
//

import Foundation

class DataViewModel {
    
    var childrensList = [Children]()
    var afterLink = ""

    func getChildrenObjectAtIndex(index: Int) -> ChildrenDataObject {
        return childrensList[index].data ?? ChildrenDataObject()
    }
    
    func getChildrenObjectCount() -> Int {
        return childrensList.count
    }
}

extension DataViewModel {
    func fetchChildrensList(completion: @escaping (Result<Bool, Error>) -> Void) {

        NetworkManager.shared.get(urlString: baseUrl + afterLink, completionBlock: { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let dta) :
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                do
                {
                    let dataObject = try decoder.decode(ResponseDataObject.self, from: dta)
                    self.childrensList.append(contentsOf: dataObject.data?.children ?? [Children]())
                    self.afterLink = dataObject.data?.after ?? ""
                    completion(.success(true))
                } catch {
                    #if DEBUG
                    print("failed to decode json \(error)")
                    #endif
                    completion(.success(false))
                }
            }
        })
    }
}
