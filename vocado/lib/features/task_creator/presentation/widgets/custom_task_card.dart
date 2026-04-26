import 'package:flutter/material.dart';
import 'package:vocado/features/task_creator/presentation/widgets/custom_circle_avatar.dart';

class CustomTaskCard extends StatelessWidget {
  final String title;
  final String name;
  final String status;
  final String? date;

  const CustomTaskCard({
    super.key,
    required this.title,
    required this.name,
    required this.status,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          colors: [Color(0xFF8E7CC3), Color(0xFFA084CA)],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            status,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),

          const SizedBox(height: 5),

          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 10),

          Row(
            children: [
              const Icon(Icons.access_time,
                  size: 16, color: Colors.white70),
              const SizedBox(width: 5),
              Text(
                date ?? "",
                style: const TextStyle(
                    color: Colors.white70, fontSize: 12),
              ),
            ],
          ),

          const SizedBox(height: 5),

          Row(
            children: [
              const Icon(Icons.person_outline,
                  size: 16, color: Colors.white70),
              const SizedBox(width: 5),
              Text(
                "Team Lead : $name",
                style: const TextStyle(
                    color: Colors.white70, fontSize: 12),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CustomCircleAvatar(text: name.isNotEmpty ? name[0] : 'A'),
              const SizedBox(width: 6),
              const CustomCircleAvatar(text: '+3', isGrey: true),
            ],
          )
        ],
      ),
    );
  }
}