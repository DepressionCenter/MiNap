//
//  MiNap_Sleepwatch_frontApp.swift
//  MiNap-Sleepwatch-front Watch App
//
//  Created by Quishi Zhao on 6/29/23.
//

import SwiftUI
import Amplify
import AWSAPIPlugin


class MyWatchAppDelegate: NSObject, WKApplicationDelegate {
    func application(
        _ application: WKApplication
    ) -> Bool {
        do {
            try Amplify.add(plugin: AWSAPIPlugin())
            try Amplify.configure()
        } catch {
            print("An error occurred setting up Amplify: \(error)")
        }
        return true
    }
}


@main
struct MiNap_Sleepwatch_front_Watch_AppApp: App {
    @WKApplicationDelegateAdaptor var appDelegate: MyWatchAppDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
