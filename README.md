# 🍔 Kiosk Application

This project is a **kiosk ordering application built with Flutter**.  
It works similarly to self-service screens in restaurants like McDonald’s or Burger King.  
Users can **browse food and drinks**, **add them to the cart**, and proceed to the **checkout step**.

---

## 🚀 Features

- 📱 **Flutter-based**: Runs on Android and iOS  
- 🍟 **Category-based menu**: Foods (burgers, döner kebab, fries) and drinks (cola, fanta, water, tea, etc.)  
- 🛒 **Cart management**: Add, remove, and update product quantities  
- 💳 **Checkout screen**: Order confirmation and payment step  
- ✅ **Order completion screen**  
- 🎨 **User-friendly interface**: Modern design with product images and a customized theme

---

## 📂 Project Structure

```plaintext
kiosk_app/
 ├── android/                # Android project files
 ├── assets/                 # Application assets
 │    └── images/            # Product images
 ├── ios/                    # iOS project files
 ├── lib/                    # Application source code
 │    ├── models/            # Data models (Product, CartItem)
 │    ├── providers/         # State management (Riverpod)
 │    ├── screens/           # App screens (Home, Menu, Cart, Checkout, Complete)
 │    ├── theme/             # Theme settings
 │    └── widgets/           # UI components (ProductCard, CartIconButton, etc.)
 ├── linux/                  # Linux project files
 ├── macos/                  # macOS project files
 ├── test/                   # Unit and widget tests
 ├── web/                    # Web project files
 ├── windows/                # Windows project files
 ├── pubspec.yaml            # Package and asset configuration
 ├── pubspec.lock            # Locked package versions
 ├── analysis_options.yaml   # Linting rules
 └── README.md               # Project description




## 🖼️ Example Screens

- **Home screen**: Welcome message, large hero image, and "Start Order" button  
- **Menu screen**: Food and drinks tabs, product cards with images, add buttons  
- **Cart screen**: List of selected products, quantity adjustment  
- **Checkout screen**: Order confirmation and payment step  
- **Completion screen**: Information shown when the order is successfully completed  



