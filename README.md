# Excel Search Flutter App

Ecel Search Flutter app allows users to search for voter information by Voter ID, providing instant access to voter details in a user-friendly tabular format.

## Table of Contents
1. [Setup Flutter Application](#setup-flutter-application)
2. [Data Parsing](#data-parsing)
3. [Integration of Firebase using CLI](#integration-of-firebase-using-cli)
4. [Run the App](#run-the-app)
5. [Compare and Update pubspec.yaml](#compare-and-update-pubspecyaml)

## Setup Flutter Application
1. **Install Flutter**: Follow the [official Flutter installation guide](https://flutter.dev/docs/get-started/install) to install Flutter on your machine.

2. **Create a New Flutter Project**: Create a new Flutter project using the following command:

        flutter create voter_search_app

3. **Replace lib Files**: Replace the contents of the `lib` folder in the newly created Flutter project with the files from the `lib` folder of this repository.

4. **Update pubspec.yaml**: Update the `pubspec.yaml` file of your Flutter project according to the one provided in this repository. Compare and add any missing dependencies or assets.

## Data Parsing
1. **Convert Excel Sheet to CSV**: Convert your Excel sheet containing voter data to a CSV file.

2. **Update Parsing File**: Open the `VoterDataParsing.dart` file and update the `file_path` variable with the path to your CSV file. Also, ensure that the Firebase credentials are correctly set.

3. **Run Data Parsing**: Run the `VoterDataParsing.dart` file to parse the data from the CSV file and store it in Firestore.

## Integration of Firebase using CLI
1. **Install Firebase CLI**: Install the Firebase CLI by following the instructions in the [official Firebase documentation](https://firebase.google.com/docs/cli).

2. **Initialize Firebase Project**: Navigate to your Flutter project directory in the terminal and initialize Firebase by running the following command:

       firebase init

   Follow the prompts to select Firebase services (Firestore) and complete the setup process.

3. **Add SHA1 and SHA256 Keys**: After integrating Firebase, add the SHA1 and SHA256 keys to your Firebase project settings. You can generate these keys using the following command:

        keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android

Replace `~/.android/debug.keystore` with the path to your debug keystore.

4. **Update Collection Name**: In your Firebase Firestore, change the collection name to match the one used in the `VoterDataParsing.dart` file.

## Run the App
1. **Connect Device**: Connect a physical device or emulator to your development environment.

2. **Run the App**: Run the Flutter app using the following command:

        flutter run


## Compare and Update pubspec.yaml
1. **Compare pubspec.yaml**: Compare the `pubspec.yaml` file of your Flutter project with the one provided in this repository. Ensure that all dependencies and assets are included.

2. **Update pubspec.yaml**: If there are any missing dependencies or assets, add them to your `pubspec.yaml` file.

3. **Install Dependencies**: After updating the `pubspec.yaml` file, run the following command to install the dependencies:

        flutter pub get


## License
This project is licensed under the [MIT License](LICENSE).
