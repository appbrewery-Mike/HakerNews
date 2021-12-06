//
//  NetWorkManager.swift
//  H4X0R News SwiftUI
//
//  Created by Misha on 2021/11/29.
//

import Foundation

class NetWorkManager: ObservableObject{
    
   @Published var posts = [Post]()
    
    func fetchData(){
        if let url = URL(string: "http://hn.algolia.com/api/v1/search?tags=front_page")  {
            let sessionObj = URLSession(configuration: .default)
            let task = sessionObj.dataTask(with: url) { data, response, error in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data{
                        do {
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = results.hits
                            }
                            
                        }
                        catch
                        {print(error)
                            
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
