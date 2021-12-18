import 'package:flutter/material.dart';

class CertificationsPage extends StatefulWidget {
  const CertificationsPage({Key? key}) : super(key: key);

  static const String id = 'certifications_page';

  @override
  _CertificationsPageState createState() => _CertificationsPageState();
}

class _CertificationsPageState extends State<CertificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        constraints: BoxConstraints(
          maxWidth: double.infinity,
          maxHeight: double.infinity,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0C9AFA), Color(0xFFFFFF5F)],
            stops: [0, 0.8],
            begin: AlignmentDirectional(0.64, -1),
            end: AlignmentDirectional(-0.64, 1),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CertificateContainer(
                  title: 'CCNA',
                  desc: 'Completed At 2020',
                ),
                CertificateContainer(
                  title: 'CCNP',
                  desc: 'Completed At 2021',
                ),
                CertificateContainer(
                  title: 'CEH',
                  desc: 'Completed At 2021',
                ),
                CertificateContainer(
                  title: 'JEHPT',
                  desc: 'Completed At 2021',
                ),
                CertificateContainer(
                  title: 'CCNA',
                  desc: 'Completed At 2021',
                ),
                CertificateContainer(
                  title: 'CCNA',
                  desc: 'Completed At 2021',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CertificateContainer extends StatelessWidget {
  const CertificateContainer({required this.title, required this.desc});

  final String title, desc;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 35.0),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              desc,
              style: TextStyle(fontSize: 20.0),
            ),
            Divider(
              thickness: 1,
            )
          ],
        ),
      ),
    );
  }
}
