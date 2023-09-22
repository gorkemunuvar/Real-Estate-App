
# About

This is a an application including some simple features such as:
- Showing a real estate details
- Showing images of the estate
- Navigation to a random estate details

## Screen Record

https://github.com/gorkemunuvar/Real-Estate-App/assets/34106700/24746e1c-171d-4485-8ac8-c512778f863c

## How to run

In order to run the project, run the commands below in order.

```flutter pub get```

```flutter run```

```dart run build_runner build --delete-conflicting-outputs```

```flutter test```


## Architecture

In order to create isolated, testable and clean codebase I've levaraged from the idea of 
[Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html).

Therefore each concern is seperated by different layers.

### Data Layer
The data layer is responsible for retrieving and storing data. It is the only layer that interacts with external APIs or databases. Data sources and repository impelmentation are placed in this layer to communicate with the API. 

### Domain Layer
The domain layer is responsible for the business logic of the application. It defines the entities, value objects, and use cases of the application.


### Application Layer
The application layer is responsible for implementing the use cases of the application. It uses the domain layer to do this. In our case, we utilize from BLoCs to orchestrate business logic and presentation components.


### Presentation Layer
The presentation layer is responsible for displaying data to the user and handling user input. All the widgets and screens are placed in this layer.

### UML Diagrams of Estate Details feature

![uml](https://github.com/gorkemunuvar/Real-Estate-App/assets/34106700/562cc91f-30a0-4098-a1b5-ee0c83d0431d)



