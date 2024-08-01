import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:vacancy_app/utils/utils.dart';

class UploadProvider extends ChangeNotifier {
  final FirebaseFirestore addDoc = FirebaseFirestore.instance;
  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> uploadData({
    required BuildContext context,
    required TextEditingController departmentController,
    required TextEditingController approvedNumberController,
    required TextEditingController manpowerNumberController,
    required TextEditingController vacancyController,
    required TextEditingController detailController,
    required TextEditingController numberController,
  }) async {
    try {
      setLoading(true);
      await addDoc.collection('vacancies').add({
        'department': departmentController.text.toString(),
        'approved_numbers': approvedNumberController.text.toString(),
        'manpower_numbers': manpowerNumberController.text.toString(),
        'vacancy': vacancyController.text.toString(),
        'details': detailController.text.toString(),
        'number': numberController.text.toString(),
      }).then((value) {
        Utils.toastMessage(message: 'Data uploaded successfully');
        Navigator.pop(context);
      });
    } catch (e) {
      Utils.toastMessage(message: 'Data uploaded successfully');
      Navigator.pop(context);
    } finally {
      setLoading(false);
    }
  }

  Future<void> deleteFile({
    required String docId,
  }) async {
    try {
      await addDoc.collection('vacancies').doc(docId).delete().then((value) {
        Utils.toastMessage(message: 'Data deleted successfully');
      });
    } catch (e) {
      Utils.toastMessage(message: 'Failed to delete data');
    }
  }
}
