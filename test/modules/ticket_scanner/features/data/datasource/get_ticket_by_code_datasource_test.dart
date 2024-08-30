import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code_bar_reader_base/modules/ticket_scanner/core/consts/ticket_consts.dart';
import 'package:code_bar_reader_base/modules/ticket_scanner/feature/data/datasources/get_ticket_by_code_datasource.dart';
import 'package:code_bar_reader_base/modules/ticket_scanner/feature/data/datasources/get_ticket_by_code_datasource_impl.dart';
import 'package:code_bar_reader_base/modules/ticket_scanner/feature/data/models/ticket_model.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks/ticket_model_mock.dart';

void main() {
  late FirebaseFirestore firebaseFirestore;
  late GetTicketByCodeDatasource getTicketByCodeDatasource;

  setUpAll(() async {
    firebaseFirestore = FakeFirebaseFirestore();
    getTicketByCodeDatasource = GetTicketByCodeDatasourceImpl(
      firebaseFirestore: firebaseFirestore,
    );

    await firebaseFirestore
        .collection(TickerConsts.collection)
        .doc('123')
        .set(ticketMapMock);
  });

  test('Deve retornar um TicketModel', () async {
    final result = await getTicketByCodeDatasource(code: '123');

    expect(result, isA<TicketModel>());
  });
}
