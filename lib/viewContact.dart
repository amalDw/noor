import 'package:midterm/addContact.dart';
import 'package:midterm/phoneContactClass.dart';
import 'package:midterm/editPage.dart';
import 'package:midterm/midtermProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewContacts extends StatefulWidget {
  @override
  _ViewContactsState createState() => _ViewContactsState();
}

class _ViewContactsState extends State<ViewContacts> {
  Widget build(BuildContext context) {
    final contactListDisplay = Provider.of<MidTermProvider>(context);
    final List<PhoneContactClass> conList = contactListDisplay.cont;

    return Scaffold(
      appBar: AppBar(
        title: Text('Contact List'),
      ),
      body: (conList.length == 0 || conList == null)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(
                      0, (MediaQuery.of(context).size.width) / 4, 0, 0),
                  child: Center(
                    child: Text('NO contacts available'),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.fromLTRB(0, 0, 20, 20),
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddContact()));
                    },
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            )
          : Container(
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      flex: 9,
                      child: Container(
                        margin: EdgeInsets.all(4),
                        child: ListView.builder(
                            itemCount: conList.length,
                            itemBuilder: (context, index) {
                              final contact = conList[index];
                              return GestureDetector(
                                onTap: () {
                                  showDialog<String>(
                                      context: context,
                                      builder: (BuildContext) => AlertDialog(
                                            actionsPadding: EdgeInsets.all(7),
                                            title: Text(
                                                '${contact.Name1} ${contact.Name2}'),
                                            content: Column(
                                              children: [
                                                Text('${contact.Phone1}'),
                                                Text('${contact.Phone2}'),
                                              ],
                                            ),
                                            actions: <Widget>[
                                              TextButton(
                                                  style: TextButton.styleFrom(
                                                    primary: Colors.white,
                                                    backgroundColor:
                                                        Colors.blue,
                                                    textStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    final x = index;
                                                    contactListDisplay
                                                        .choosenIndex = x;
                                                    print(x);
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                EditContact()));
                                                  },
                                                  child: Text('edit')),
                                              TextButton(
                                                  style: TextButton.styleFrom(
                                                    primary: Colors.white,
                                                    backgroundColor:
                                                        Colors.blue,
                                                    textStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    contactListDisplay
                                                        .deleteContact(index);
                                                    Navigator.pop(
                                                        context, 'Delete');
                                                  },
                                                  child: Text('Delete')),
                                              TextButton(
                                                  style: TextButton.styleFrom(
                                                    primary: Colors.white,
                                                    backgroundColor:
                                                        Colors.blue,
                                                    textStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.pop(
                                                        context, 'close');
                                                  },
                                                  child: Text('close')),
                                            ],
                                          ));
                                },
                                child: Container(
                                  margin: EdgeInsets.all(5),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      child: Text(
                                          '${contact.Name1[0].toUpperCase()}'),
                                    ),
                                    title: Text(
                                        '${contact.Name1} ${contact.Name2}'),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.bottomRight,
                          margin: EdgeInsets.fromLTRB(0, 0, 20, 20),
                          child: FloatingActionButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddContact()));
                            },
                            child: Icon(Icons.add),
                          ),
                        ))
                  ],
                ),
              ),
            ),
    );
  }
}
