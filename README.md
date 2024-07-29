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

