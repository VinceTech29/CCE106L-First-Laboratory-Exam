import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stateless_lab_exam/main.dart';
import 'package:stateless_lab_exam/shopping_cart_page.dart';

void main() {
  testWidgets('ShoppingCartPage smoke and interaction test', (WidgetTester tester) async {
    // Provide a large enough surface to avoid scroll/offscreen issues during testing
    tester.view.physicalSize = const Size(800, 1600);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Verify AppBar
    expect(find.text('My Cart'), findsOneWidget);
    expect(find.byIcon(Icons.arrow_back), findsOneWidget);
    expect(find.byIcon(Icons.shopping_bag_outlined), findsOneWidget);
    expect(find.text('3'), findsOneWidget); // Badge

    // Verify Intro section
    expect(find.text('CAMPUS STORE'), findsOneWidget);
    expect(find.text('Ready for checkout'), findsOneWidget);
    expect(find.text('Review your items before placing your order.'), findsOneWidget);

    // Verify Delivery card
    expect(find.textContaining('Deliver to'), findsOneWidget);
    expect(find.text('Matina, Davao City'), findsOneWidget);
    expect(find.text('Change'), findsOneWidget);

    // Verify Order items
    expect(find.text('Order Items'), findsOneWidget);
    expect(find.text('3 items'), findsOneWidget);
    expect(find.text('Wireless Mouse'), findsOneWidget);
    expect(find.text('PHP 450.00'), findsOneWidget);
    expect(find.text('USB-C Hub'), findsOneWidget);
    expect(find.text('PHP 850.00'), findsOneWidget);
    expect(find.text('Laptop Stand'), findsOneWidget);
    expect(find.text('PHP 700.00'), findsOneWidget);

    // Verify 3 CartItemCards
    expect(find.byType(CartItemCard), findsNWidgets(3));

    // Verify Discount banner
    expect(find.text('STUDENT10 applied'), findsOneWidget);
    expect(find.text('10% discount on items'), findsOneWidget);

    // Verify Payment summary
    expect(find.text('Payment Summary'), findsOneWidget);
    expect(find.text('Subtotal'), findsOneWidget);
    expect(find.text('PHP 2,000.00'), findsOneWidget);
    expect(find.text('Discount (10%)'), findsOneWidget);
    expect(find.text('- PHP 200.00'), findsOneWidget);
    expect(find.text('Delivery Fee'), findsOneWidget);
    expect(find.text('PHP 50.00'), findsOneWidget);
    expect(find.text('Total'), findsOneWidget);
    expect(find.text('PHP 1,850.00'), findsOneWidget);

    // Verify Place Order button
    expect(find.text('Place Order'), findsOneWidget);

    // Track debugPrint / print outputs
    final List<String> logs = [];
    final oldPrint = debugPrint;
    debugPrint = (String? message, {int? wrapWidth}) {
      if (message != null) logs.add(message);
    };

    try {
      // 1. Back arrow
      await tester.tap(find.byIcon(Icons.arrow_back));
      expect(logs.last, equals('Back clicked'));

      // 2. Shopping bag
      await tester.tap(find.byIcon(Icons.shopping_bag_outlined));
      expect(logs.last, equals('Cart clicked'));

      // 3. Change delivery
      await tester.tap(find.text('Change'));
      expect(logs.last, equals('Change delivery address clicked'));

      // 4. Plus button for Wireless Mouse
      await tester.tap(find.byIcon(Icons.add).at(0));
      expect(logs.last, equals('Increase quantity: Wireless Mouse'));

      // 5. Minus button for Wireless Mouse
      await tester.tap(find.byIcon(Icons.remove).at(0));
      expect(logs.last, equals('Decrease quantity: Wireless Mouse'));

      // 6. Delete button for Wireless Mouse
      await tester.tap(find.byIcon(Icons.delete_outline_rounded).at(0));
      expect(logs.last, equals('Remove item: Wireless Mouse'));

      // Also test USB-C Hub and Laptop Stand callbacks
      await tester.tap(find.byIcon(Icons.add).at(1));
      expect(logs.last, equals('Increase quantity: USB-C Hub'));
      await tester.tap(find.byIcon(Icons.remove).at(1));
      expect(logs.last, equals('Decrease quantity: USB-C Hub'));
      await tester.tap(find.byIcon(Icons.delete_outline_rounded).at(1));
      expect(logs.last, equals('Remove item: USB-C Hub'));

      await tester.tap(find.byIcon(Icons.add).at(2));
      expect(logs.last, equals('Increase quantity: Laptop Stand'));
      await tester.tap(find.byIcon(Icons.remove).at(2));
      expect(logs.last, equals('Decrease quantity: Laptop Stand'));
      await tester.tap(find.byIcon(Icons.delete_outline_rounded).at(2));
      expect(logs.last, equals('Remove item: Laptop Stand'));

      // 7. Place Order button
      await tester.tap(find.text('Place Order'));
      expect(logs.last, equals('Place order clicked! Total: PHP 1850.00'));
    } finally {
      debugPrint = oldPrint;
    }
  });
}
