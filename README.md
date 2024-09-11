#TOKOTO APP

## 🚀 Getting Started

- Developed a modern e-commerce app using Clean Architecture principles(Presentation-Domain-Data).
- Cubit state management(Presentaion lyer).
- RESTful API integration(Sign up, Sign in, reset the password, forgot password, verify reset code, get all categories, get all Brands, get all products, get specific Products, add to carts, remove in cart.
- Firebase (Authentication - Cloud Firestore - Cloud Messaging - Cloud Storage - Crashlytics - Analytics )
- Push notification topic by API postman and local notification schedule. 
- I use shared preference to save, get, and remove the token
- I use the Hive package to save my favorite Products Reduce the loading process, make the application more flexible and notifications.
  

  
## 🤳 Screens

- **Onboarding Screen:** welcome app to user. 
- **Login screen:** The user can log in directly if he already has an account.
- **ForGet password:** If the user already has an account, he can write his own email and a confirmation code will be sent to this email, and if he already has this email, the old account will be removed and the password renewed.
- **Register Screen:** If the user does not have an account, he can create his own email account and log in to the Login screen.
- **Home Screen:** It is carried out on the categories of products, as well as brands, and there is an advertising purchase for the most important and best-selling products.
- **Product Screen:** It displays all the products available in the API and the user can search for his product when clicking on the product, the data of this product is displayed and his favorite products can be selected and also added to his purchases for later purchase.
- **Wishlist screen:** Displays all the products that have been placed in it and the number of the product can be increased and cleared.
- **Favorite Screen:** View the products you Favorite.
- **Profile Screen:** The user can log out of the application change his password and data user image email name and close notifications.
  





## 📁 Files Structure
![ecommerce-structure](https://github.com/Mohamed-Essam-Mohamed/E-COMMERCE-CLEAN-ARCH-APP/assets/152906492/65d57185-4200-45eb-9290-7f0d3af4066c)


## 🎥 Video
## 📱 UI
<img width="3577" alt="tokoto screens" src="https://github.com/user-attachments/assets/e4dda60e-28f2-4ba3-b8ef-bea8a7505136">







## 🛠 Dependencies

```pubspec.yaml
 dependencies:
  animated_text_kit: ^4.2.2
  cached_network_image: ^3.3.1
  cloud_firestore: ^4.14.0
  connectivity_plus: ^6.0.3
  cupertino_icons: ^1.0.2
  dartz: ^0.10.1
  device_info_plus: ^10.1.2
  firebase_core: ^2.24.2
  firebase_crashlytics: ^3.4.9
  firebase_messaging: ^14.7.10
  firebase_storage: ^11.6.0
  flutter:
    sdk: flutter
  flutter_bloc: ^8.1.3
  flutter_image_slideshow: ^0.1.6
  flutter_local_notifications: ^17.2.2
  flutter_screenutil: ^5.9.0
  flutter_svg: ^2.0.10+1
  flutter_timezone: ^3.0.1
  flutter_verification_code: ^1.1.7
  gap: ^3.0.1
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  http: ^1.2.1
  image_picker: ^1.1.2
  lottie: ^3.1.2
  permission_handler: ^11.3.1
  provider: ^6.1.2
  readmore: ^3.0.0
  shared_preferences: ^2.2.3
  shimmer: ^3.0.0
  timeago: ^3.7.0
  timezone: ^0.9.4
  url_launcher: ^6.3.0
  uuid: ^4.5.0
  workmanager: ^0.5.2

dev_dependencies:
  build_runner: ^2.4.12
  flutter_lints: ^2.0.0
  flutter_test:
    sdk: flutter
  hive_generator: ^2.0.1
```


- Contributions are welcome 💜
- If you encounter any issues or have suggestions for improvements, please open an issue or submit a pull request.

