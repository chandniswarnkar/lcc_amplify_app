import 'package:flutter/material.dart';

class RewardsPage extends StatefulWidget {
  const RewardsPage({ super.key });

  @override
  State<RewardsPage> createState() => _RewardsPageState();
}

class _RewardsPageState extends State<RewardsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rewards"),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute<Null>(
                  builder: (BuildContext context) {
                    return RewardsIcons();
                  },
                  fullscreenDialog: true,
                ));
          }),
      body: Container(
        color: const Color(0xFF530C17),
      ),
    );
  }
}

class RewardsIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Rewards")),
        body: Container(
            color: const Color(0x8C79272B),
            margin: EdgeInsets.all(20),
            child: ListView(
              children: [
                Row(children: [Text("Quick Learner1"),Text("Quick Learner2"),],),
                Row(children: [Text("Quick Learner3"),Text("Quick Learner4"),],),
                Row(children: [Text("Quick Learner5"),Text("Quick Learner6"),],),

              ],
            ),
          ),
    );
  }
}