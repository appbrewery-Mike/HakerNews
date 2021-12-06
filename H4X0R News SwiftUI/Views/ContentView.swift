//
//  ContentView.swift
//  H4X0R News SwiftUI
//
//  Created by Misha on 2021/11/29.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetWorkManager()
    
    var body: some View {
        NavigationView{

            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                    
                }
                
            }
            .navigationTitle("H4XOR NEWS")
            
            
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

