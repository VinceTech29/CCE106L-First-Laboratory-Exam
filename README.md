# Campus Store: Shopping Cart Page (Lab Exam 1 - StatelessWidget)

## Student Information
- **Name:** Lourde Vincent Pablo
- **Student ID:** 2023-004812
- **Program & Year:** BS in Information Technology (BSIT 3-A)
- **Institution:** College of Computing Education, University of Mindanao, Davao City
- **Project Name:** `stateless_lab_exam`

---

## Overview
This Flutter application is built strictly using **`StatelessWidget`s** to replicate the Campus Store: Shopping Cart Page interface. It adheres to nested layout structures, component reusability, responsive design without overflows, and accurate button callback console messages.

---

## Key Features & Requirements

1. **AppBar**
   - Back arrow `IconButton` (triggers `debugPrint('Back clicked')`).
   - Title: **"My Cart"** in bold navy text.
   - Shopping bag icon with badge **3** positioned using `Stack` (triggers `debugPrint('Cart clicked')`).

2. **Introduction Section**
   - **`CAMPUS STORE`** pill tag in light-blue rounded container.
   - Bold heading: **"Ready for checkout"**.
   - Supporting subtitle: *"Review your items before placing your order."*

3. **Delivery Information Card**
   - White rounded container with border.
   - Location icon and vertical divider.
   - **Deliver to Lourde Vincent Pablo** (dynamic student name parameter).
   - Address: *Matina, Davao City*.
   - **Change** text button (triggers `debugPrint('Change delivery address clicked')`).

4. **Order Items & Reusable `CartItemCard`**
   - Header with **"Order Items"** and **"3 items"**.
   - Pure `StatelessWidget` `CartItemCard` with constructor parameters:
     - `productName`
     - `price`
     - `quantity`
     - `icon`
   - Three required products:
     - **Wireless Mouse** — PHP 450.00 — Qty: 1
     - **USB-C Hub** — PHP 850.00 — Qty: 1
     - **Laptop Stand** — PHP 700.00 — Qty: 1
   - Each card contains custom stepper `[ - ] [ 1 ] [ + ]` and trash delete icon.

5. **Discount Banner**
   - Light-blue container with tag icon.
   - **"STUDENT10 applied"** with *"10% discount on items"*.
   - Blue check-circle confirmation icon on the right.

6. **Payment Summary**
   - Itemized rows:
     - **Subtotal:** PHP 2,000.00
     - **Discount (10%):** - PHP 200.00
     - **Delivery Fee:** PHP 50.00
   - Full divider line.
   - **Total:** PHP 1,850.00 (bold emphasized text).

7. **Place Order Button**
   - Full-width blue button with lock icon and white bold text.
   - Triggers `debugPrint('Place order clicked! Total: PHP 1850.00')`.

---

## Required Button Callbacks & Console Output

| UI Control | Action / Callback | Console Output |
| :--- | :--- | :--- |
| **Back arrow** | Tap back button | `Back clicked` |
| **Shopping bag** | Tap cart icon | `Cart clicked` |
| **Change** | Tap Change button | `Change delivery address clicked` |
| **Plus button** | Tap `+` stepper | `Increase quantity: [product name]` |
| **Minus button** | Tap `-` stepper | `Decrease quantity: [product name]` |
| **Delete button** | Tap trash icon | `Remove item: [product name]` |
| **Place Order** | Tap Place Order | `Place order clicked! Total: PHP 1850.00` |

---

## Project Structure

- `lib/main.dart` — Application entry point configuring MaterialApp & theme
- `lib/shopping_cart_page.dart` — ShoppingCartPage & reusable CartItemCard widgets
- `test/widget_test.dart` — Automated unit and widget interaction tests

---

## Repository Link
- **GitHub:** https://github.com/VinceTech29/CCE106L-First-Laboratory-Exam.git

---

## Running the Application

```bash
# 1. Fetch dependencies
flutter pub get

# 2. Run static analysis
flutter analyze

# 3. Run widget tests
flutter test

# 4. Launch the application
flutter run
```
