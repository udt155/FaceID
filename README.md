# 👁️‍🗨️ FaceID SwiftUI App

This is a basic iOS app built using **SwiftUI** that demonstrates **Face ID authentication** using Apple’s `LocalAuthentication` framework.

## 🚀 Features

- Simple user interface with a button to trigger Face ID
- Uses system biometrics (Face ID or Touch ID) to authenticate the user
- Changes the background color to:
  - 🟩 **Green** if authentication is successful
  - 🟥 **Red** if authentication fails or is unavailable
- Resets background to white after 5 seconds

---

## 📱 Screenshots

> (You can add a screenshot later)

---

## 🧠 How the Code Works

### `ContentView.swift`

- Uses `@State` to manage `backgroundColor`, which controls the screen's background.
- A `ZStack` is used to:
  - Fill the screen with the background color
  - Center a button for Face ID authentication

### Button Action

When the button is pressed, it calls `authenticateUser()`:

```swift
Button(action: authenticateUser) {
    Text("Authenticate with Face ID")
}

```


Privacy Note:

<key>NSFaceIDUsageDescription</key>
<string>We use Face ID to authenticate you securely.</string>

💡 Requirements

iOS 15+
Xcode 13+
Face ID supported device or simulator with enrolled biometrics

