# Home BLoC Structure

This directory contains the BLoC (Business Logic Component) implementation for the Home feature, following Clean Architecture principles.

- `home_bloc.dart`: Main BLoC class, event-to-state mapping.
- `home_event.dart`: Defines all possible events for the Home feature.
- `home_state.dart`: Defines all possible states for the Home feature, including examples for immutability and copyWith usage.

## Usage
- Add new events to `home_event.dart` as needed.
- Add new states to `home_state.dart` as needed.
- Implement event handlers in `home_bloc.dart`.

This structure ensures separation of concerns and maintainability for the Home feature's state management. 