import 'package:ecommerce_app/providers/LocationProvider/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecommerce_app/views/notifications/notification_screen.dart';

class HomeHeaderWidget extends StatelessWidget {
  final VoidCallback onLocationTap;
  final ValueChanged<String>? onSearch;

  const HomeHeaderWidget({
    super.key,
    required this.onLocationTap,
    this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF7B3FF2), Color(0xFF2D1B69)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
                      SizedBox(height: 25,),

          /// 🔹 TOP ROW (LOCATION + NOTIFICATION)
          Row(
            children: [
              Expanded(child: _LocationWidget(onTap: onLocationTap)),
              const SizedBox(width: 12),
              InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const NotificationScreen(),
                    ),
                  );
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.notifications_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          /// 🔹 SEARCH BAR
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: onSearch,
                    decoration: const InputDecoration(
                      hintText: 'Search',
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(4),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF7B3FF2), Color(0xFF2D1B69)],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.tune, color: Colors.white, size: 20),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//
// ---------- LOCATION WIDGET (FROM YOUR FIRST CODE) ----------
//

class _LocationWidget extends StatelessWidget {
  final VoidCallback onTap;

  const _LocationWidget({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Consumer<LocationProvider>(
      builder: (context, provider, _) {
        return InkWell(
          onTap: onTap,
          child: Row(
            children: [
              const Icon(
                Icons.location_on_outlined,
                color: Colors.white,
                size: 20,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: provider.isLoading
                    ? const SizedBox(
                        width: 14,
                        height: 14,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        _getDisplayAddress(provider.address),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getDisplayAddress(String address) {
    if (address.trim().isEmpty) return "Set location";

    final parts = address.split(',');
    for (final p in parts) {
      final t = p.trim();
      if (t.isNotEmpty && RegExp(r'^[a-zA-Z]').hasMatch(t)) {
        return t;
      }
    }
    return "Location";
  }
}
