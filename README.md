# Flutter Perfect DDD

This project is a template for building Flutter applications using the Domain-Driven Design (DDD) architecture. It includes a set of carefully chosen packages to support clean architecture, state management, dependency injection, and more.

## Packages Used

Here's a list of the main packages used in this project, along with their purposes and the commands to add them to your Flutter project:

1. **flutter_bloc**: State management (bloc/cubit)
   ```
   flutter pub add flutter_bloc
   ```

2. **freezed**: Code generation for models/unions/pattern matching
   ```
   flutter pub add freezed
   flutter pub add --dev build_runner
   ```

3. **dio**: HTTP client for API requests
   ```
   flutter pub add dio
   ```

4. **retrofit**: Type-safe HTTP client
   ```
   flutter pub add retrofit
   flutter pub add --dev retrofit_generator
   ```

5. **get_it**: Dependency injection
   ```
   flutter pub add get_it
   ```

6. **injectable**: Code generation for dependency injection
   ```
   flutter pub add injectable
   flutter pub add --dev injectable_generator
   ```

7. **go_router**: Declarative routing
   ```
   flutter pub add go_router
   ```

8. **fpdart**: Functional programming features
   ```
   flutter pub add fpdart
   ```

9. **json_annotation**: JSON serialization/deserialization
   ```
   flutter pub add json_annotation
   flutter pub add --dev json_serializable
   ```

## Setup

To set up this project:

1. Clone the repository
2. Run `flutter pub get` to install all dependencies or Copy paste the above code to add latest packages
3. Run the code generators:
   ```
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

## Project Structure

The project follows a DDD-inspired structure:

- `lib/application/`: Contains the application logic (Cubits/BLoCs)
- `lib/domain/`: Defines the core business logic and entities
- `lib/infrastructure/`: Implements the repositories and data sources
- `lib/presentation/`: Contains the UI components and pages

## Running the Project

The project is set up with multiple entry points for different environments:

- Development: `lib/main_dev.dart`
- UAT: `lib/main_uat.dart`
- Production: `lib/main_prod.dart`

To run the project in a specific environment, use the corresponding launch configuration in VS Code, or run:

```
flutter run -t lib/main_dev.dart
```

Replace `main_dev.dart` with `main_uat.dart` or `main_prod.dart` for other environments.

## Building the Project

To build the project for a specific environment:

```
flutter build apk --target lib/main_prod.dart
```

Replace `apk` with `ios` for iOS builds, and adjust the target file as needed.