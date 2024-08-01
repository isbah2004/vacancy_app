import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vacancy_app/reusablewidgets/neomorphism_widget.dart';
import 'package:vacancy_app/reusablewidgets/reusable_button.dart';
import 'package:vacancy_app/theme/theme.dart';

class DetailScreen extends StatefulWidget {
  final String department,
      approvedNumbers,
      manpowerNumbers,
      vacancy,
      detail,
      number;
  const DetailScreen({
    super.key,
    required this.department,
    required this.approvedNumbers,
    required this.manpowerNumbers,
    required this.vacancy,
    required this.detail,
    required this.number,
  });

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Details',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: AppTheme.whiteColor,
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              NeomorphicWidget(
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: AppTheme.greyColor,
                      borderRadius: BorderRadius.circular(12)),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        buildDetailField('Department:', widget.department),
                        const SizedBox(height: 20),
                        buildDetailField(
                            'Approved numbers:', widget.approvedNumbers),
                        const SizedBox(height: 20),
                        buildDetailField(
                            'Manpower numbers:', widget.manpowerNumbers),
                        const SizedBox(height: 20),
                        buildDetailField('Vacancy:', widget.vacancy),
                        const SizedBox(height: 20),
                        buildDetailField('Detail:', widget.detail),
                        const SizedBox(height: 20),
                        buildDetailField('Number:', widget.number),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildDetailField(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(fontWeight: FontWeight.normal),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            value,
            softWrap: true,
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }
}
