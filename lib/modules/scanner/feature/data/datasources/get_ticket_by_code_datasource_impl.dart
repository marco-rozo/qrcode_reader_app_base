import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code_bar_reader_base/modules/scanner/core/consts/ticket_consts.dart';
import 'package:code_bar_reader_base/modules/scanner/feature/data/datasources/get_ticket_by_code_datasource.dart';
import 'package:code_bar_reader_base/modules/scanner/feature/data/models/ticket_model.dart';

class GetTicketByCodeDatasourceImpl implements GetTicketByCodeDatasource {
  final FirebaseFirestore _firebaseFirestore;

  GetTicketByCodeDatasourceImpl({
    required FirebaseFirestore firebaseFirestore,
  }) : _firebaseFirestore = firebaseFirestore;

  @override
  Future<TicketModel> call({required String code}) async {
    return _firebaseFirestore
        .collection(TickerConsts.collection)
        .doc(code)
        .get()
        .then(
          (snapshot) =>
              TicketModel.fromMap(snapshot.data() as Map<String, dynamic>),
        );
  }
}
