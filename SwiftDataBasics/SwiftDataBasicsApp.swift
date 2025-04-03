//
//  SwiftDataBasicsApp.swift
//  SwiftDataBasics
//
//  Created by Charles Michael on 4/3/25.
//

import SwiftUI
import SwiftData


@main
struct SwiftDataBasicsApp: App {
    @AppStorage("appHasData") var appHasData = false
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: Contact.self) {  result in
                    switch result {
                    case .success(let container):
                        if !appHasData {
                            for contact in Contact.samples {
                                container.mainContext.insert(contact)
                            }
                            appHasData = true
                        }
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
        }
    }
}
