import 'package:flutter/material.dart';

/// Reusable product card widget for items in the shopping cart.
/// Built as a pure [StatelessWidget] with required constructor parameters.
class CartItemCard extends StatelessWidget {
  final String productName;
  final String price;
  final int quantity;
  final IconData icon;
  final VoidCallback? onIncrease;
  final VoidCallback? onDecrease;
  final VoidCallback? onDelete;

  const CartItemCard({
    super.key,
    required this.productName,
    required this.price,
    required this.quantity,
    required this.icon,
    this.onIncrease,
    this.onDecrease,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE2E8F0),
          width: 1.2,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Light-blue container with relevant Material icon
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: const Color(0xFFE0EDFD),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF1E60E2),
              size: 32,
            ),
          ),
          const SizedBox(width: 14),

          // Product details & Quantity stepper
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  productName,
                  style: const TextStyle(
                    fontSize: 15.5,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0F172A),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1E60E2),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    // Minus button
                    InkWell(
                      onTap: onDecrease ??
                          () {
                            debugPrint('Decrease quantity: $productName');
                          },
                      borderRadius: BorderRadius.circular(6),
                      child: Container(
                        width: 32,
                        height: 28,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: const Color(0xFF1E60E2),
                            width: 1.5,
                          ),
                        ),
                        child: const Icon(
                          Icons.remove,
                          size: 16,
                          color: Color(0xFF1E60E2),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Quantity display
                    Container(
                      width: 36,
                      height: 28,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: const Color(0xFFE2E8F0),
                          width: 1,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          '$quantity',
                          style: const TextStyle(
                            fontSize: 13.5,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),

                    // Plus button
                    InkWell(
                      onTap: onIncrease ??
                          () {
                            debugPrint('Increase quantity: $productName');
                          },
                      borderRadius: BorderRadius.circular(6),
                      child: Container(
                        width: 32,
                        height: 28,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: const Color(0xFF1E60E2),
                            width: 1.5,
                          ),
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 16,
                          color: Color(0xFF1E60E2),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Delete icon button
          IconButton(
            icon: const Icon(
              Icons.delete_outline_rounded,
              color: Color(0xFF64748B),
              size: 22,
            ),
            onPressed: onDelete ??
                () {
                  debugPrint('Remove item: $productName');
                },
            splashRadius: 20,
          ),
        ],
      ),
    );
  }
}

/// Main Shopping Cart page implemented as a [StatelessWidget].
class ShoppingCartPage extends StatelessWidget {
  final String studentName;

  const ShoppingCartPage({
    super.key,
    this.studentName = 'Lourde Vincent Pablo',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6FA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4F6FA),
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF0F172A),
            size: 24,
          ),
          onPressed: () {
            debugPrint('Back clicked');
          },
        ),
        titleSpacing: 0,
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontWeight: FontWeight.w800,
            fontSize: 22,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14.0),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Color(0xFF0F172A),
                    size: 26,
                  ),
                  onPressed: () {
                    debugPrint('Cart clicked');
                  },
                ),
                Positioned(
                  top: 4,
                  right: 4,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Color(0xFF1E60E2),
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 18,
                      minHeight: 18,
                    ),
                    child: const Center(
                      child: Text(
                        '3',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10.5,
                          fontWeight: FontWeight.bold,
                          height: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 2. Introduction Section
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFDCEBFE),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  'CAMPUS STORE',
                  style: TextStyle(
                    color: Color(0xFF1E60E2),
                    fontSize: 11.5,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Ready for checkout',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF0F172A),
                  letterSpacing: -0.4,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Review your items before placing your order.',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF64748B),
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 18),

              // 3. Delivery Information Card
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFFE2E8F0),
                    width: 1.2,
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Color(0xFF1E60E2),
                      size: 26,
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 1,
                      height: 34,
                      color: const Color(0xFFE2E8F0),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Deliver to $studentName',
                            style: const TextStyle(
                              fontSize: 14.5,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF0F172A),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 2),
                          const Text(
                            'Matina, Davao City',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0xFF64748B),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        debugPrint('Change delivery address clicked');
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Change',
                        style: TextStyle(
                          color: Color(0xFF1E60E2),
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // 4. Order Items Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                    child: Text(
                      'Order Items',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                  ),
                  Text(
                    '3 items',
                    style: TextStyle(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF64748B),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Order Items: 3 Reusable Product Cards
              CartItemCard(
                productName: 'Wireless Mouse',
                price: 'PHP 450.00',
                quantity: 1,
                icon: Icons.mouse_outlined,
                onIncrease: () {
                  debugPrint('Increase quantity: Wireless Mouse');
                },
                onDecrease: () {
                  debugPrint('Decrease quantity: Wireless Mouse');
                },
                onDelete: () {
                  debugPrint('Remove item: Wireless Mouse');
                },
              ),
              const SizedBox(height: 10),
              CartItemCard(
                productName: 'USB-C Hub',
                price: 'PHP 850.00',
                quantity: 1,
                icon: Icons.hub_outlined,
                onIncrease: () {
                  debugPrint('Increase quantity: USB-C Hub');
                },
                onDecrease: () {
                  debugPrint('Decrease quantity: USB-C Hub');
                },
                onDelete: () {
                  debugPrint('Remove item: USB-C Hub');
                },
              ),
              const SizedBox(height: 10),
              CartItemCard(
                productName: 'Laptop Stand',
                price: 'PHP 700.00',
                quantity: 1,
                icon: Icons.laptop_mac_outlined,
                onIncrease: () {
                  debugPrint('Increase quantity: Laptop Stand');
                },
                onDecrease: () {
                  debugPrint('Decrease quantity: Laptop Stand');
                },
                onDelete: () {
                  debugPrint('Remove item: Laptop Stand');
                },
              ),
              const SizedBox(height: 14),

              // 5. Discount Banner
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                decoration: BoxDecoration(
                  color: const Color(0xFFE0EDFD),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color(0xFFBFDBFE),
                    width: 1,
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.discount_outlined,
                      color: Color(0xFF1E60E2),
                      size: 22,
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 1,
                      height: 28,
                      color: const Color(0xFFBFDBFE),
                    ),
                    const SizedBox(width: 10),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'STUDENT10 applied',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            '10% discount on items',
                            style: TextStyle(
                              fontSize: 12.5,
                              color: Color(0xFF64748B),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(
                      Icons.check_circle,
                      color: Color(0xFF1E60E2),
                      size: 24,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 14),

              // 6. Payment Summary Card
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: const Color(0xFFE2E8F0),
                    width: 1.2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Payment Summary',
                      style: TextStyle(
                        fontSize: 16.5,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFF0F172A),
                      ),
                    ),
                    const SizedBox(height: 14),
                    _buildSummaryRow('Subtotal', 'PHP 2,000.00'),
                    const SizedBox(height: 8),
                    _buildSummaryRow('Discount (10%)', '- PHP 200.00'),
                    const SizedBox(height: 8),
                    _buildSummaryRow('Delivery Fee', 'PHP 50.00'),
                    const SizedBox(height: 6),
                    const Divider(
                      color: Color(0xFFE2E8F0),
                      thickness: 1,
                      height: 24,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Expanded(
                          child: Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF0F172A),
                            ),
                          ),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'PHP 1,850.00',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // 7. Place Order Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    debugPrint('Place order clicked! Total: PHP 1850.00');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E60E2),
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.lock,
                        color: Colors.white,
                        size: 18,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Place Order',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _buildSummaryRow(String label, String amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xFF334155),
            ),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          amount,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color(0xFF0F172A),
          ),
        ),
      ],
    );
  }
}
