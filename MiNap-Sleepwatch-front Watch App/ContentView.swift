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


// auth context object that stores pid, studyid, and session start time in each session
class AuthenticationContext: ObservableObject {
    static let shared = AuthenticationContext()

    @Published private(set) var participantID: String? {
        didSet {
            // Add logic if participantID changes
        }
    }

    @Published private(set) var studyID: String? {
        didSet {
            // Add logic if studyID changes
        }
    }
    
    @Published private(set) var sessionStartTime: Temporal.DateTime?

    private init() { }
    
    var isAuthenticated: Bool {
        return participantID != nil && studyID != nil
    }

    func setParticipantID(_ id: String) {
        participantID = id
    }

    func setStudyID(_ id: String) {
        studyID = id
    }
    
    func startSession() {
        sessionStartTime = Temporal.DateTime.now() // Save the current date and time
    }

    func endSession() {
        print("current session ended")
        sessionStartTime = nil
    }
    
    func logout() {
        participantID = nil
        studyID = nil
        sessionStartTime = nil
    }
}


// throws error if unwrapping fails
enum OptionalError: LocalizedError {
    case nilValue(description: String)
    
    var errorDescription: String? {
        switch self {
        case .nilValue(let description):
            return description
        }
    }
}

    struct ContentView: View {
        @ObservedObject var authContext = AuthenticationContext.shared
        @State var showSleepScreen = true
        
        var body: some View {
            VStack {
                if authContext.isAuthenticated {
                    
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
            @State public var studyid: String = ""
            
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
                            await persistentlogin(participantid: participantid, studyid: studyid)
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
                    let entry = MinapDBEntry(studyid: studyid,
                                             participantid:participantid
                    )
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
                    let entries = MinapDBEntry.keys
                    let predicate = entries.participantid == participantid && entries.studyid == studyid
                    let result = try await Amplify.API.query(
                        request: .list(MinapDBEntry.self, where: predicate, limit: 5)
                    )
                    switch result {
                    case .success(let result):
                        if result.count == 0 {
                            print("Could not find result")
                            return
                        }
                        print("Successfully retrieved entry: \(result[0])")
                        print("Congratulations! You are authenticated!")
                        AuthenticationContext.shared.setParticipantID(participantid)
                        AuthenticationContext.shared.setStudyID(studyid)
                        print(AuthenticationContext.shared.participantID)
                        print(AuthenticationContext.shared.studyID)
                        print(AuthenticationContext.shared.isAuthenticated)
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
        
            func persistentlogin(participantid: String, studyid: String) async {
                do {
                    let entries = MinapDBEntry.keys
                    let predicate = entries.participantid == participantid && entries.studyid == studyid
                    let result = try await Amplify.DataStore.query(MinapDBEntry.self, where: predicate)
                    print("Entries: \(result)")
                    if (result.count > 0) {
                        print("Congratulations! You are authenticated!")
                        AuthenticationContext.shared.setParticipantID(participantid)
                        AuthenticationContext.shared.setStudyID(studyid)
                        print(AuthenticationContext.shared.participantID)
                        print(AuthenticationContext.shared.studyID)
                        print(AuthenticationContext.shared.isAuthenticated)
                    }
                    else {
                        print("Could not find result")
                        return
                    }
                } catch let error as DataStoreError {
                    print("Error on query() for type Entry - \(error)")
                } catch {
                    print("Unexpected error \(error)")
                }
            }
        }
        
        
        struct SleepScreen: View {
            @Binding var showSleepScreen: Bool
            @State private var animate = false
            @State private var showRecordedMessage = false
            @ObservedObject var authContext = AuthenticationContext.shared
            
            var body: some View {
                VStack {
                    Image(systemName: "bed.double.fill")
                        .font(.system(size: 100))
                        .rotationEffect(Angle.degrees(animate ? 360 : 0))
                    
                    Text("Sleep")
                        .font(.title)
                    
                    Button(
                        "Go to Sleep"
                    )
                    {
                        print("button clicked")
                        authContext.startSession()
                        
                        // view start time
                        let formatter = ISO8601DateFormatter()
                        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
                        
                        do {
                            guard let sessionStartTime = authContext.sessionStartTime else {
                                throw OptionalError.nilValue(description: "Session start time is nil")
                            }
                            print(formatter.string(from: sessionStartTime.foundationDate))
                        } catch {
                            print("Unexpected error: \(error)")
                        }
                        
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
            @ObservedObject var authContext = AuthenticationContext.shared
            
            var body: some View {
                VStack {
                    Image(systemName: "sunrise.fill")
                        .font(.system(size: 100))
                        .rotationEffect(Angle.degrees(animate ? 360 : 0))
                    
                    Text("Wake up")
                        .font(.title)
                    
                    Button("Wake up") {
                        print("wake up button pressed")
                        Task {
                            do {
                                guard let participantID = authContext.participantID else {
                                    throw OptionalError.nilValue(description: "Participant ID is nil")
                                }
                                
                                guard let studyID = authContext.studyID else {
                                    throw OptionalError.nilValue(description: "Study ID is nil")
                                }
                                
                                guard let sessionStartTime = authContext.sessionStartTime else {
                                    throw OptionalError.nilValue(description: "Session start time is nil")
                                }
                                
                                await persistentcreateSession(participantid: participantID, studyid: studyID, sleepSessionStart: sessionStartTime, sleepSessionEnd: Temporal.DateTime.now())
                                authContext.endSession()
                            } catch {
                                print("An error occurred: \(error)")
                                authContext.endSession()
                            }
                            
                        }
                        
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
            
            func createSession(participantid: String, studyid: String, sleepSessionStart: Temporal.DateTime, sleepSessionEnd: Temporal.DateTime) async {
                do {
                    // formatter that converts date obj to string for debugging purpose
                    let formatter = ISO8601DateFormatter()
                    formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
                    
                    print("participantid: \(participantid)")
                    print("studyid: \(studyid)")
                    print(formatter.string(from: sleepSessionStart.foundationDate))
                    print(formatter.string(from: sleepSessionEnd.foundationDate))
                    
                    let entry = MinapDBEntry(
                        sleepSessionStart: sleepSessionStart,
                        sleepSessionEnd: sleepSessionEnd,
                        studyid: studyid,
                        participantid:participantid
                    )
                    let result = try await Amplify.API.mutate(request: .create(entry))
                    switch result {
                    case .success(let result):
                        print("Successfully created entry: \(result)")
                        return
                    case .failure(let error):
                        print("Got failed result with \(error.errorDescription)")
                        throw error
                    }
                } catch let error as APIError {
                    print("Failed to create session: ", error)
                } catch {
                    print("Unexpected error: \(error)")
                }
            }
            
            func persistentcreateSession(participantid: String, studyid: String, sleepSessionStart: Temporal.DateTime, sleepSessionEnd: Temporal.DateTime) async {
                do {
                    // formatter that converts date obj to string for debugging purpose
                    let formatter = ISO8601DateFormatter()
                    formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
                    
                    print("participantid: \(participantid)")
                    print("studyid: \(studyid)")
                    print(formatter.string(from: sleepSessionStart.foundationDate))
                    print(formatter.string(from: sleepSessionEnd.foundationDate))
                    
                    let entry = MinapDBEntry(
                        sleepSessionStart: sleepSessionStart,
                        sleepSessionEnd: sleepSessionEnd,
                        studyid: studyid,
                        participantid:participantid
                    )
                    let result = try await Amplify.DataStore.save(entry)
                    print(result)
                } catch let error as DataStoreError {
                    print("Error creating session - \(error)")
                } catch {
                    print("Unexpected error \(error)")
                }
            }
        }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
