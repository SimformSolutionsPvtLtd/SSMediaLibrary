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
        Button(action: addItem) {
            Label("Add Item", systemImage: "plus")
        }
    }

    private func addItem() {
        guard let url = URL(string: "http://www.africau.edu/images/default/sample.pdf") else { return }
        let manager = MediaManager(url: url)
        manager.show()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
