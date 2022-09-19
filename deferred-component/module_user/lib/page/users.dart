import 'package:flutter/material.dart';
import 'package:lib_bussiness/singleton/singleton.dart';
import 'package:module_user_interface/entity/user.dart';
import 'package:module_user_interface/dao/dao.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  @override
  State createState() => _State();
}

class _State extends State<UsersPage> {
  final userImpl = Singleton.find<IUser>();
  late final Stream<List<USer>> userStream;

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    userStream = userImpl.dao.getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: StreamBuilder<List<USer>>(
              initialData: const [],
              stream: userStream,
              builder: (context, snapshot) {
                var users = snapshot.requireData;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    var item = users[index];
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('name: ${item.name}'),
                        const SizedBox(width: 16),
                        Text('age: ${item.age}'),
                      ],
                    );
                  },
                  itemCount: users.length,
                );
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    const Text('name: '),
                    Expanded(
                      child: TextField(
                        controller: nameController,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text('age: '),
                    Expanded(
                      child: TextField(
                        controller: ageController,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      var name = nameController.text;
                      var age = ageController.text;
                      if (name.isEmpty || age.isEmpty) return;
                      var user = USer(
                        null,
                        name,
                        int.parse(age),
                      );
                      userImpl.dao.saveUser(user);
                    },
                    child: const Text('Add'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
