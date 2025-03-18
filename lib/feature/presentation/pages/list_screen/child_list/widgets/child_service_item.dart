// lib/widgets/child_service_item.dart
import 'package:flutter/material.dart';

class ChildServiceItem extends StatelessWidget {
  final String title;
  final String type;
  final String iconAsset;
  final String description;
  final Function(String, String) onTap;

  const ChildServiceItem({
    Key? key,
    required this.title,
    required this.type,
    required this.iconAsset,
    required this.description,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () => onTap(type, title),
        borderRadius: BorderRadius.circular(16),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Colors.pink[50]!],
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.pink.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  iconAsset,
                  height: 50,
                  width: 50,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.pink[100],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.child_care,
                        color: Colors.pink[600],
                        size: 30,
                      ),
                    );
                  },
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink[600],
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: Colors.pink[600],
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}