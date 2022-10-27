# rAthena for iOS

## Prerequisites
Before installing rAthena for iOS there are certain hardwares you will need.

Hardware | OS Version | Required
------|------|------
Mac | 11.0 or later | Yes
iPad | 14.1 or later | No

## Installation 

1. Install the latest [Xcode developer tools](https://developer.apple.com/xcode/downloads/) from Apple.
1. Install Carthage & SwiftLint:
    ```shell
    brew update
    brew install carthage
    brew install swiftlint
    ```
1. Clone the repository:
    ```shell
    git clone https://github.com/arkadeleon/rathena-ios
    ```
1. Pull in the project dependencies:
    ```shell
    cd rathena-ios
    carthage build --use-xcframeworks --platform ios
    ```
1. Open `rAthena.xcworkspace` in Xcode.
1. Build the `ROServer` scheme in Xcode.
