//
//  MiNap_Sleepwatch_frontApp.swift
//  MiNap-Sleepwatch-front Watch App
//
//  Created by Quishi Zhao on 6/29/23.
//

import SwiftUI
import Amplify
import AWSAPIPlugin
import AWSDataStorePlugin


func configureAmplify() {
        do {
            try Amplify.add(plugin: AWSAPIPlugin(modelRegistration: AmplifyModels()))
            try Amplify.add(plugin: AWSDataStorePlugin(modelRegistration: AmplifyModels()))
            try Amplify.configure()
            print("Successfully initialized Amplify")
        } catch {
            print("An error occurred setting up Amplify: \(error)")
        }
}


@main
struct MiNap_Sleepwatch_front_Watch_AppApp: App {
    init() {
        configureAmplify()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
