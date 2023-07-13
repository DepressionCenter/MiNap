//
//  ContentView.swift
//  MiNap-Sleepwatch-front Watch App
//
//  Created by Jeong Hin Chin on 7/3/23.
//

import SwiftUI
import WatchKit
import Foundation

struct ContentView: View {
    @State var auth = false
    @State var showSleepScreen = true
    
    var body: some View {
        VStack {
            if auth {

                if showSleepScreen {
                    SleepScreen(showSleepScreen: $showSleepScreen)
                    
                } else {
                    WakeupScreen(showSleepScreen: $showSleepScreen)
                    
                }
            
            }else{
                AuthScreen()
            }
        }
    }
}

struct AuthScreen: View {
    
    var body: some View {
        VStack {
            Image(systemName: "person.fill")
                .font(.system(size: 60))
            
            Text("Please Authenticate on Mobile App")
                .font(.title3)
            
        }
    }
}

struct SleepScreen: View {
    @Binding var showSleepScreen: Bool
    @State private var animate = false
    @State private var showRecordedMessage = false
    
    var body: some View {
        VStack {
            Image(systemName: "bed.double.fill")
                .font(.system(size: 100))
                .rotationEffect(Angle.degrees(animate ? 360 : 0))
            
            Text("Sleep")
                .font(.title)
            
            Button("Go to sleep") {
                animate = true
                
                // Display the recorded message
                showRecordedMessage = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                   
                        showSleepScreen = false
                        
                }
            }
            
            if showRecordedMessage {
                Text("Recording...")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}

struct WakeupScreen: View {
    @Binding var showSleepScreen: Bool
    @State private var animate = false
    @State private var showRecordedMessage = false
    
    var body: some View {
        VStack {
            Image(systemName: "sunrise.fill")
                .font(.system(size: 100))
                .rotationEffect(Angle.degrees(animate ? 360 : 0))
            
            Text("Wake up")
                .font(.title)
            
            Button("Wake up") {
                animate = true
                
                // Display the recorded message
                showRecordedMessage = true
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                   
                        showSleepScreen = true
                        
                }
               
                
                
            }
            
            if showRecordedMessage {
                Text("Recording...")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
