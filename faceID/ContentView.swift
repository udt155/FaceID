//
//  ContentView.swift
//  faceID
//
//  Created by Urvish Trivedi on 4/9/25.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @State private var backgroundColor = Color.white
    @State private var showDefaultBackground = true
    
    var body: some View {
        ZStack {
            backgroundColor
                .ignoresSafeArea()

            Button(action: authenticateUser) {
                Text("Authenticate with Face ID")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
    }

    func authenticateUser() {
        let context = LAContext()
        var error: NSError?

        // Check if device supports Face ID
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Use Face ID to authenticate"

            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        self.backgroundColor = .green
                    } else {
                        self.backgroundColor = .red
                    }

                    // Reset background color after 5 seconds
                    DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                        self.backgroundColor = .white
                    }
                }
            }
        } else {
            // No biometrics available
            self.backgroundColor = .red
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.backgroundColor = .white
            }
        }
    }
}
