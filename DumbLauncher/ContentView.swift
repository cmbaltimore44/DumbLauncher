//
//  ContentView.swift
//  DumbLauncher
//
//  Created by Cooper Baltimore on 5/12/25.
//

import SwiftUI

struct ContentView: View {
    let pages = [
        [
            (name: "Safari", url: "http://www.google.com"),
            (name: "Messages", url: "sms://123456789")
        ],
        [
            (name: "Phone", url: "tel://123456789"),
            (name: "Instagram", url: "instagram://")
        ]
    ]
    
    var body: some View {
        TabView {
            ForEach(0..<pages.count, id: \ .self) { index in
                VStack {
                    ForEach(pages[index], id: \ .name) { app in
                        Button(action: {
                            if let url = URL(string: app.url) {
                                UIApplication.shared.open(url)
                            }
                        }) {
                            Text(app.name)
                                .padding()
                                .background(Color.white.opacity(0.2))
                                .cornerRadius(8)
                        }
                        .padding()
                    }
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
    }
}
