# Task Manager App

## Project Description

The Task Manager App is a simple and intuitive mobile application built using Flutter, which allows users to manage their tasks effectively. Users can create, update, delete, and mark tasks as completed. The app provides a straightforward interface to manage tasks with prioritization (high, medium, low) and detailed views for each task.

The app provides features such as:
- Adding and removing tasks.
- Marking tasks as completed or pending.
- Viewing task details.
- Managing tasks efficiently with task prioritization.

### Key Features:
- **Task Creation**: Users can create tasks with a title, description, and priority.
- **Task Completion**: Tasks can be marked as completed with a checkbox.
- **Task Deletion**: Users can swipe to delete tasks from the list.
- **Navigation**: Tap on tasks to view task details.

## Assumptions Made

1. **Task IDs**: Each task has a unique ID (integer type) to allow task-specific operations such as toggling completion or deletion.
2. **Internet Connection**: No internet connection is required for app functionality, as tasks are managed locally.
3. **Platform Support**: The app is intended to run on Android and iOS.
4. **State Management**: The app uses GetX for state management to handle UI updates reactively.

## Instructions to Run the App

### Prerequisites
Before running the app, ensure that you have the following installed:

1. **Flutter SDK**: Follow the instructions at [Flutter installation guide](https://flutter.dev/docs/get-started/install) to install the Flutter SDK.
2. **Android Studio or Visual Studio Code**: Install either Android Studio or Visual Studio Code to build and run the app.
3. **Emulator/Device**: You can run the app on an Android or iOS device or an emulator.

### Clone the Repository
First, clone the repository to your local machine:

```bash
git clone https://github.com/yourusername/task-manager-app.git

