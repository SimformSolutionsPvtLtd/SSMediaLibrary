//
//  ContentView.swift
//  Example
//
//  Created by Devansh Vyas on 29/09/21.
//

import SwiftUI
import SSMediaLibrary

struct ContentView: View {
    var body: some View {
        VStack {
            Button(action: showPdf) {
                Label("Show PDF", systemImage: "plus")
            }.padding()
            Button(action: showImage) {
                Label("Show Image", systemImage: "plus")
            }.padding()
            Button(action: showVideo) {
                Label("Show Video", systemImage: "plus")
            }.padding()
        }
    }
    
    private func showPdf() {
        guard let url = URL(string: "http://www.africau.edu/images/default/sample.pdf") else { return }
        let manager = MediaManager(url: url)
        manager.show()
    }
    
    private func showImage() {
        guard let url = URL(string: "https://file-examples-com.github.io/uploads/2017/10/file_example_JPG_100kB.jpg") else { return }
        let manager = MediaManager(url: url)
        manager.show()
    }
    
    private func showVideo() {
        guard let url = URL(string: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4") else { return }
        let manager = MediaManager(url: url)
        manager.show()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
