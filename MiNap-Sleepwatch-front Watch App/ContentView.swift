//
//  ContentView.swift
//  MiNap-Sleepwatch-front Watch App
//
//  Created by Jeong Hin Chin on 7/3/23.
//

import SwiftUI
import WatchKit
import Foundation
import Amplify

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
    
    struct AuthScreen: View {
        @State public var participantid: String = ""
        @State public var processedparticipantid: Int = 0
        @State public var studyid: String = ""
        @State public var processedstudyid: Int = 0
        
        var body: some View {
            VStack {
                Text("Login")
                    .font(.title3)
                
                TextField("ParticipantID", text: $participantid)
                    .textContentType(.oneTimeCode)
                    .padding(.horizontal, 15)
                
                TextField("StudyID", text: $studyid)
                    .textContentType(.oneTimeCode)
                    .padding(.horizontal, 15)
                    .padding(.top, 15)
                
                Button(action: {
                    Task {
                        do {
                            
                            try await login(participantid: participantid, studyid: studyid)
                        } catch {
                            print("An error occurred: \(error)")
                        }
                    }
                }) {
                    Text("Sign In")
                        .foregroundColor(.white)
                        .padding(.vertical, 12)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal, 15)
                .padding(.top, 20)
            }
        }
        
        func create(participantid: String, studyid: String) async {
            do {
                print("participantid: \(participantid)")
                print("studyid: \(studyid)")
                var entry = MinapDBEntry(id:participantid,
                                         studyid: studyid,
                                         remarks: "")
                let result = try await Amplify.API.mutate(request: .create(entry))
                switch result {
                case .success(let result):
                    print("Successfully created entry: \(result)")
                    return
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            } catch let error as APIError {
                print("Failed to query todo: ", error)
            } catch {
                print("Unexpected error: \(error)")
            }
        }
        
        func login(participantid: String, studyid: String) async {
            do {
                print("participantid: \(participantid)")
                print("studyid: \(studyid)")
                let result = try await Amplify.API.query(
                    request: .get(MinapDBEntry.self, byId: participantid)
                )
                switch result {
                case .success(let result):
                    guard let result = result else {
                        print("Could not find result")
                        return
                    }
                    print("Successfully retrieved entry: \(result)")
                    if (result.studyid == studyid)
                    {
                        print("Congratulations! You are authenticated!")
                    }
                    else {
                        print("studyid does not match.")
                    }
                case .failure(let error):
                    print("Got failed result with \(error.errorDescription)")
                }
            } catch let error as APIError {
                print("participantid does not exist.")
                print("Failed to query todo: ", error)
            } catch {
                print("Unexpected error: \(error)")
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
}
