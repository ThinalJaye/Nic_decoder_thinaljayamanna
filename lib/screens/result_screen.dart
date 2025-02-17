import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nic_controller.dart';
import '../theme/app_theme.dart';

class ResultScreen extends StatelessWidget {
  final NicController controller = Get.find();

  Widget _buildDetailCard(IconData icon, String title, String value) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: AppTheme.primaryBlue),
        title: Text(title, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        subtitle: Text(
          value,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: title == 'Voting Status' && value == 'Cannot Vote (Under 18)' 
                ? Colors.red 
                : Colors.black87,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NIC Details', 
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Obx(() => Column(
                children: [
                  _buildDetailCard(
                    Icons.format_list_numbered,
                    'NIC Format',
                    controller.nicFormat.value,
                  ),
                  _buildDetailCard(
                    Icons.calendar_today,
                    'Date of Birth',
                    controller.dateOfBirth.value,
                  ),
                  _buildDetailCard(
                    Icons.calendar_view_day,
                    'Born on',
                    controller.weekday.value,
                  ),
                  _buildDetailCard(
                    Icons.person_outline,
                    'Gender',
                    controller.gender.value,
                  ),
                  _buildDetailCard(
                    Icons.cake,
                    'Age',
                    '${controller.age.value} years',
                  ),
                  _buildDetailCard(
                    Icons.how_to_vote,
                    'Voting Status',
                    controller.canVote.value 
                        ? 'Can Vote (18+ years)'
                        : 'Cannot Vote (Under 18)',
                  ),
                  _buildDetailCard(
                    Icons.confirmation_number,
                    'Serial Number',
                    controller.serialNumber.value,
                  ),
                ],
              )),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton.icon(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Check Another NIC'),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Input NIC',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner),
            label: 'Results',
          ),
        ],
      ),
    );
  }
}