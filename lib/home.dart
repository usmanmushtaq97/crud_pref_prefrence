import 'package:crud_chared_prefrence/pref_provider.dart';
import 'package:crud_chared_prefrence/rounded_button.dart';
import 'package:crud_chared_prefrence/user_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  late PrefProvider prefProvider;

  @override
  void initState() {
    super.initState();
    prefProvider = PrefProvider();
    prefProvider = Provider.of<PrefProvider>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      prefProvider.getStoredUserList();
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<PrefProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Column(
        children: [
          TextFormField(
            controller: _firstnameController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'firstname',
            ),
          ),
          TextFormField(
            controller: _lastnameController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'lastname',
            ),
          ),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'email',
            ),
          ),
          TextFormField(
            controller: _phoneController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'phone',
            ),
          ),
          TextFormField(
            controller: _dateController,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'date',
            ),
          ),
          const SizedBox(height: 30),
          RoundButton(
              title: "Save",
              onPress: () async {
            await prefProvider.saveUserList(UserDetailsModel(
                  firstname: _firstnameController.text.toString(),
                  lastname: _lastnameController.text.toString(),
                  email: _emailController.text.toString(),
                  mobile: _phoneController.text.toString(),
                  dateJoin: _dateController.text.toString(),
                ));
              print("click");
              }),
          FutureBuilder(
            future: prefProvider.getStoredUserList(),
            builder: (context, AsyncSnapshot<List<UserDetailsModel>> snapshot) {
              if (snapshot.hasError) {
                return const Text("No Data found");
              } else if (snapshot.hasData) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      var firstname =
                          snapshot.data![index].firstname.toString();
                      var lastname = snapshot.data![index].lastname.toString();
                      var email = snapshot.data![index].email.toString();
                      var mobile = snapshot.data![index].mobile.toString();
                      var dateJoin = snapshot.data![index].dateJoin.toString();
                      debugPrint(firstname);
                      return Center(
                          child: Card(
                              child: Column(
                        children: [
                          Text("firstname: $firstname"),
                          Text("lastname: $lastname"),
                          Text("email: $email"),
                          Text("mobile : $mobile"),
                          Text("date: $dateJoin"),
                        ],
                      )));
                    },
                  ),
                );
              } else {
                return const Expanded(
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.red,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
