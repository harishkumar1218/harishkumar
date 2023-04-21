import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:upi_india/upi_india.dart';

class upiPayments extends StatefulWidget {
  const upiPayments({super.key});

  @override
  State<upiPayments> createState() => _upiPaymentsState();
}

class _upiPaymentsState extends State<upiPayments> {
  Future<UpiResponse>? _transcation;
  UpiIndia _upiIndia = UpiIndia();
  List<UpiApp>? apps;
  TextStyle header = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  TextStyle value = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );
  void initState() {
    _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      setState(() {
        apps = value;
      });
    }).catchError((e) {
      apps = [];
    });
    super.initState();
  }

  Future<UpiResponse> initiateTranscation(UpiApp app) async {
    return _upiIndia.startTransaction(
        app: app,
        receiverUpiId: '9398630228@ybl',
        receiverName: 'afreed',
        transactionRefId: 'testing Upiindiapliugin',
        transactionNote: 'not actial just an example',
        amount: 1.00,
        flexibleAmount: true);
  }

  Widget displayUpiApps() {
    if (apps == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (apps!.length == 0) {
      return Center(
        child: Text(
          'no apps found to handle transcations',
          style: header,
        ),
      );
    } else
      return Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Wrap(
            children: apps!.map<Widget>(
              (UpiApp app) {
                return GestureDetector(
                  onTap: () {
                    _transcation = initiateTranscation(app);
                    setState(() {});
                  },
                  child: Container(
                    height: 100,
                    width: 100,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.memory(
                          app.icon,
                          height: 60,
                          width: 60,
                        ),
                        Text(app.name),
                      ],
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      );
  }

  String _upiErrorHandle(error) {
    switch (error) {
      case UpiIndiaAppNotInstalledException:
        return 'requested app is not installed on device';
      case UpiIndiaUserCancelledException:
        return 'you cancel the transcation';
      case UpiIndiaNullResponseException:
        return 'requested app didn\'t return any response';
      case UpiIndiaInvalidParametersException:
        return 'invalid details';
      default:
        return 'An unknown error was occured';
    }
  }

  void _checkTxnstatus(String status) {
    switch (status) {
      case UpiPaymentStatus.SUCCESS:
        print('transcation succesful');
        break;
      case UpiPaymentStatus.FAILURE:
        print('transcation failed');
        break;
      case UpiPaymentStatus.SUBMITTED:
        print('Transcation submitted');
        break;
      default:
        print('received an unkonwn transcation');
    }
  }

  Widget displayTranscationData(title, body) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '$title:',
            style: header,
          ),
          Flexible(
              child: Text(
            body,
            style: value,
          ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('make your payment'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: displayUpiApps(),
          ),
          Expanded(
            child: FutureBuilder(
              future: _transcation,
              builder:
                  (BuildContext context, AsyncSnapshot<UpiResponse> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        _upiErrorHandle(snapshot.error.runtimeType),
                        style: header,
                      ),
                    );
                  }
                  UpiResponse _upiResponse = snapshot.data!;
                  String txnId = _upiResponse.transactionId ?? 'N/A';
                  String rescode = _upiResponse.responseCode ?? 'N/A';
                  String txnRef = _upiResponse.transactionRefId ?? 'N/A';
                  String status = _upiResponse.status ?? 'N/A';
                  String approvalref = _upiResponse.approvalRefNo ?? 'N/A';

                  _checkTxnstatus(status);
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        displayTranscationData('transcationid', txnId),
                        displayTranscationData('responsecode', rescode),
                        displayTranscationData('reference id', txnRef),
                        displayTranscationData('status', status.toUpperCase()),
                        displayTranscationData('approval no', approvalref),
                      ],
                    ),
                  );
                } else
                  return Center(
                    child: Text(''),
                  );
              },
            ),
          ),
        ],
      ),
    );
  }
}
