# fish_delivery_app

A new Flutter project.
"# fish_delivery_app" 

## Overview
The Fish Delivery App title "Mabini Online Fish Market" is a Flutter-based mobile application designed to facilitate the delivery of fish and seafood products in Mabini. It includes features such as user authentication, a home page, settings, and a navigation drawer for easy access to different parts of the app.

## Features
- **User Authentication:** Users can register, log in, and log out.
- **Home Page:** Displays the main content of the app.
- **Settings Page:** Allows users to configure their preferences.
- **Navigation Drawer:** Provides easy access to the home page, settings, and logout option.
- **FontAwesome Icons:** Used for various icons throughout the app.

## Project Structure
assets/images/
├── crab.png
├── fish.png
├── gcash.png
├── logo.png
├── shellfish.png
├── shrimp.png
└── squid.png
lib/
├── auth/
│ └── login_or_register.dart
├── components/
│ ├── my_button.dart
│ ├── my_cart_tile.dart
│ ├── my_description.dart
│ ├── my_drawer.dart
│ ├── my_drawer_tile.dart
│ ├── my_fish_tile.dart
│ ├── my_quantity_selector.dart
│ ├── my_sliver_app_bar.dart
│ ├── my_tab_bar.dart
│ └── my_text_field.dart
├── models/
│ ├── cart_item.dart
│ ├── fish.dart
│ └── fishmarket.dart
├── pages/
│ ├── cart_page.dart
│ ├── delivery_progress.dart
│ ├── fish_page.dart
│ ├── home_page.dart
│ ├── payment_page.dart
│ ├── register_page.dart
│ ├── settings_page.dart
├── themes/
│ ├── dark_mode.dart
│ └── light_mode.dart
├── main.dart
└── splash.dart

## Program Flow Summary

**Splash Screen**
Displays the app logo and transitions to the authentication flow or home page based on login status.

**Authentication Flow**
Login or Register: Users choose to log in (login_page.dart) or register (register_page.dart).

**Main Application**
Home Page (home_page.dart): Displays main content and available fish products.
Navigation Drawer (my_drawer.dart): Provides links to Home, Settings, and Logout.

**Product Pages**
Fish Page (fish_page.dart): Shows fish product details and allows adding to cart.

**Cart Management**
Cart Page (cart_page.dart): Users view and manage cart items, proceed to checkout.

**Checkout Flow**
Payment Page (payment_page.dart): Handles payment processing, including GCash input if selected.

**Delivery Tracking**
Delivery Progress Page (delivery_progress.dart): Updates on delivery status with options to contact the driver.

**Settings Page**
Settings (settings_page.dart): Adjust app preferences, such as theme (dark mode/light mode).

**Additional Components**
Custom Widgets: Buttons, text fields, quantity selectors, etc.
Models: Data models for cart items and fish products.

## Getting Started
To get started with the Fish Delivery App, follow these steps:

### Prerequisites
- Flutter SDK
- Dart SDK

### Installation
1. **Clone the repository:**
   ```sh
   git clone https://github.com/Jayvie1103/fish_delivery_app.git
   cd fish_delivery_app

![453217698_792742449722550_1588014076767214747_n](https://github.com/user-attachments/assets/14d27c1f-12bf-47ca-9887-67d3aa54aa33)
![453312822_477732681534736_1369960021075120631_n](https://github.com/user-attachments/assets/328c78c4-ad73-40d3-8389-bb76770b8abc)
![453277595_474254635312530_101566983937033512_n](https://github.com/user-attachments/assets/b40fedae-f66e-4d6d-a57d-62a605f8bdab)
![452093876_466904566093714_4307642637269292656_n](https://github.com/user-attachments/assets/a59331a4-ff58-4907-8701-097afe3afb2c)
![451809898_1727103841393385_8485110181762499637_n](https://github.com/user-attachments/assets/16a38c2d-e4ae-4cb1-98fb-10d34ff17e75)
![453199143_1013881996869165_8833445131028456042_n](https://github.com/user-attachments/assets/aeb12584-2727-4806-8d40-a2637cf7a8bf)
![451653027_1545425693041999_4741250637488829810_n](https://github.com/user-attachments/assets/906d98ab-da85-4da3-89b8-264cbab516ae)
![452093876_494762980046106_6398529933284576642_n](https://github.com/user-attachments/assets/8416d5ab-c481-474c-bbe7-738412834fad)
![452649281_1844116879413955_4797037973651229303_n](https://github.com/user-attachments/assets/f1133d7d-91f0-4586-bacb-667f1d786d0c)
