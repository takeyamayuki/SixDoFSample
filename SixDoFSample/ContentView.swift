//
//  ContentView.swift
//  SixDoFSample
//
//  Created by 武山侑輝 on 2024/01/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ARViewContainer() // ARビューをここに追加
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
