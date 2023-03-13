import 'package:app_5/widgets/menu.dart';
import 'package:floating_action_bubble/floating_action_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();

  final List<String> namePrimary = <String>[];
  final List<String> username = <String>[];
  final List<String> password = <String>[];

  TextEditingController userController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameprimaryController = TextEditingController();

  late Animation<double> _animation;
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  void _deleteItem(int index) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete UserID'),
        content: Text(
            'Are you sure you want to delete username ${username[index]} of ${namePrimary[index]}?'),
        actions: [
          ElevatedButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
            child: const Text('Delete'),
            onPressed: () {
              setState(() {
                namePrimary.removeAt(index);
                username.removeAt(index);
                password.removeAt(index);
              });
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text('Deleted'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _editItem(int index) {
    nameprimaryController.text = namePrimary[index];
    userController.text = username[index];
    passController.text = password[index];
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit UserID'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: nameprimaryController,
              decoration: const InputDecoration(label: Text('Product Name :')),
            ),
            TextFormField(
              controller: userController,
              decoration: const InputDecoration(label: Text('Username :')),
            ),
            TextFormField(
              controller: passController,
              obscureText: true,
              decoration: const InputDecoration(label: Text('Password :')),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
            child: const Text('Edit'),
            onPressed: () {
              setState(() {
                namePrimary[index] = nameprimaryController.text;
                username[index] = userController.text;
                password[index] = passController.text;
              });
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text('Edited'),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void _addItem() {
    nameprimaryController.text = '';
    userController.text = '';
    passController.text = '';
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add UserID'),
        content: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameprimaryController,
                decoration: const InputDecoration(label: Text('Product Name:')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณากรอกชื่อ';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: userController,
                decoration: const InputDecoration(label: Text('Username :')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณากรอกชื่อผู้ใช้งาน';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: passController,
                obscureText: true,
                decoration: const InputDecoration(label: Text('Password :')),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'กรุณากรอกรหัสผ่าน';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
        actions: [
          ElevatedButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          ElevatedButton(
            child: const Text('Add'),
            onPressed: () {
              setState(
                () {
                  if (_formKey.currentState!.validate()) {
                    namePrimary.add(nameprimaryController.text);
                    username.add(userController.text);
                    password.add(passController.text);
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text('Add'),
                      ),
                    );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }

  void _viewItem(int index) {
    nameprimaryController.text = namePrimary[index];
    userController.text = username[index];
    passController.text = password[index];
    bool obscureText = true;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('View UserID'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              enabled: false,
              controller: nameprimaryController,
              decoration: const InputDecoration(label: Text('Product Name :')),
            ),
            TextFormField(
              controller: userController,
              decoration: InputDecoration(
                label: const Text('Username :'),
                suffixIcon: IconButton(
                    onPressed: () {
                      Clipboard.setData(
                          ClipboardData(text: userController.text));
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 1),
                          content:
                              Text('Copied Username ${userController.text}'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.copy)),
              ),
            ),
            TextFormField(
              controller: passController,
              obscureText: obscureText,
              decoration: InputDecoration(
                label: const Text('Password :'),
                suffixIcon: IconButton(
                    onPressed: () {
                      Clipboard.setData(
                          ClipboardData(text: passController.text));
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          duration: Duration(seconds: 1),
                          content: Text('Copied Password'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.copy)),
              ),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void _viewBottomsheet(int index) {
    nameprimaryController.text = namePrimary[index];
    userController.text = username[index];
    passController.text = password[index];
    bool obscureText = true;
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              child: Column(children: [
                const Text(
                  'View UserID',
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  enabled: false,
                  controller: nameprimaryController,
                  decoration:
                      const InputDecoration(label: Text('Product Name :')),
                ),
                TextFormField(
                  controller: userController,
                  decoration: InputDecoration(
                    label: const Text('Username :'),
                    suffixIcon: IconButton(
                        onPressed: () {
                          Clipboard.setData(
                              ClipboardData(text: userController.text));
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              duration: const Duration(seconds: 1),
                              content: Text(
                                  'Copied Username ${userController.text}'),
                            ),
                          );
                        },
                        icon: const Icon(Icons.copy)),
                  ),
                ),
                TextFormField(
                  controller: passController,
                  obscureText: obscureText,
                  decoration: InputDecoration(
                    label: const Text('Password :'),
                    suffixIcon: IconButton(
                        onPressed: () {
                          Clipboard.setData(
                              ClipboardData(text: passController.text));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              duration: Duration(seconds: 1),
                              content: Text('Copied Password'),
                            ),
                          );
                        },
                        icon: const Icon(Icons.copy)),
                  ),
                ),
              ]),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'User ID Memories',
          style: TextStyle(fontSize: 27),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(8),
        itemCount: username.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                // center: Alignment.topLeft,
                stops: [0.1, 0.9],
                colors: [Colors.greenAccent, Colors.blueAccent],
                tileMode: TileMode.clamp,
              ),
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
            ),
            padding: const EdgeInsets.all(8.0),
            width: MediaQuery.of(context).size.width,
            child: ListTile(
              onTap: () => _viewItem(index), //onTap
              leading: CircleAvatar(
                radius: 30,
                child: Text(namePrimary[index][0]),
              ),
              title: Text(
                namePrimary[index],
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                'Username:${username[index]}',
                overflow: TextOverflow.ellipsis,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () => _editItem(index),
                    icon: const Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () => _deleteItem(index),
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          thickness: 1.0,
          color: Colors.black,
        ),
      ),
      floatingActionButton: FloatingActionBubble(
        // Menu items
        items: <Bubble>[
          // Floating action menu item
          Bubble(
            title: "Add Item",
            iconColor: Colors.white,
            bubbleColor: Colors.blue,
            icon: Icons.add,
            titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
            onPress: _addItem,
          ),
          // Floating action menu item
          Bubble(
            title: "Resume App",
            iconColor: Colors.white,
            bubbleColor: Colors.blue,
            icon: Icons.person,
            titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              Navigator.pushNamed(context, '/resume_app');
            },
          ),
          //Floating action menu item
          Bubble(
              title: "BMI Calculate App",
              iconColor: Colors.white,
              bubbleColor: Colors.blue,
              icon: Icons.calculate,
              titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                Navigator.pushNamed(context, '/calculate_app');
              }),
        ],
        // animation controller
        animation: _animation,
        // On pressed change animation state
        onPress: () => _animationController.isCompleted
            ? _animationController.reverse()
            : _animationController.forward(),
        // Floating Action button Icon color
        iconColor: Colors.blue,
        // Flaoting Action button Icon
        iconData: Icons.change_circle_outlined,
        backGroundColor: Colors.white,
      ),
    );
  }
}
