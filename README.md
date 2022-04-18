# Flutter App Biolerplate With GetX

##### version: 0.0.4

A project structure is design on flutter with the getX state management tool

**Project Structure**

```
project
└─── lib
    └─── src
        └─── controller
            |   base_controller.dart
            |   permissison_controller.dart
            |   ...
        └─── core
            └─── bindings
            |    app_binding.dart
            └─── extensions
            |    find_or_put_extension.dart
            └─── theme
            |    app_theme.dart
            |    colors.style.dart
            |    fonts.style.dart
            |    texts.style.dart
            └─── utilities
        └─── models
        └─── routes
            |   app_pages.dart
            |   app_routes.dart
        └─── services
            |   app_exceptions.dart
            |   base_client.dart
            |   permission_service.dart
            |   ...
        └─── views
            └─── homeScreen
            └─── splashScreen
            └─── ...
    │   main.dart
    │   config.dart
    
│   README.md
│   ...
```

**How to use this biolerplate**

1. Fork the repository **"flutter_boiler_plate_with_getx"**.
2. Create a new repository
   * Under **"Repository template"** used your fork **"flutter_boiler_plate_with_getx"** repository as a template
   * Fill the below field and create repository
3. Clone your repository and change package name.
   * Change the package name under the pubspec.yaml and all the pages which import file with package name and under AndroidManifest file. 
4. You are ready to start development. 