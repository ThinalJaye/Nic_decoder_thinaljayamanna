import 'package:flutter/material.dart';
import '../utils/nic_formats.dart';

class NICInfoCard extends StatelessWidget {
  const NICInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'NIC Format Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            _buildFormatSection(
              'Old Format NIC',
              NICFormats.oldFormatDescription,
              NICFormats.oldFormat,
            ),
            const SizedBox(height: 16),
            _buildFormatSection(
              'New Format NIC',
              NICFormats.newFormatDescription,
              NICFormats.newFormat,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormatSection(String title, String description, String example) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(description),
        const SizedBox(height: 4),
        Text(
          'Example: $example',
          style: const TextStyle(
            fontFamily: 'Courier',
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
