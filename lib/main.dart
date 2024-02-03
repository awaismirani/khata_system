// main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:khata_system/person_controller.dart';
import 'package:khata_system/person_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PersonAdapter());
  Hive.registerAdapter(ItemAdapter());
  await Hive.openBox<Person>('personBox');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  PersonController personController = Get.put(PersonController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Khata System ',style: TextStyle(fontWeight: FontWeight.bold,),),
            Icon(Icons.menu_book_outlined,color: Colors.green,)
          ],
        ),
      ),
      body: Center(
        child: Obx(
          () => ListView.builder(
            itemCount: personController.persons.length,
            itemBuilder: (context, index) {
              Person person = personController.persons[index];
              return ListTile(
                trailing: TextButton.icon(
                    onPressed: () {
                      personController.removePerson(index);
                    },
                    icon: Icon(
                      Icons.delete_forever,
                      color: Colors.red,
                      size: 25,
                    ),
                    label: Text("Detete")),
                title: Text(person.name,style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text('Dues: ${total(person.items)}'),
                onTap: () {
                  Get.to(() => PersonDetailScreen(person: person));
                },
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add a new person with some items
          Item newItem = Item(
            name: 'New Item',
            price: 10.0,
            description: 'Description of new item',
            isReceived: false,
            createdDate: DateTime.now(),
          );

          personController.addPerson('New Person', 1, []);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class PersonDetailScreen extends StatefulWidget {
  final Person person;

  const PersonDetailScreen({required this.person});

  @override
  State<PersonDetailScreen> createState() => _PersonDetailScreenState();
}

class _PersonDetailScreenState extends State<PersonDetailScreen> {
  @override
  Widget build(BuildContext context) {
    PersonController personController = Get.put(PersonController());
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.person.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('ID: ${widget.person.id}'),
            SizedBox(height: 20),
            Text(
              'Total: ${total(widget.person.items)}',
              style: TextStyle(
                  color: total(widget.person.items) < 0
                      ? Colors.red
                      : Colors.green),
            ),
            SizedBox(height: 10),
            widget.person.items.isEmpty
                ? Center(
                    child: Text("No Udhar yet."),
                  )
                : ListView.builder(
                    itemCount: widget.person.items.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      Item item = widget.person.items[index];
                      return ListTile(
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete_forever,
                            color: Colors.red,
                            size: 25,
                          ),
                          onPressed: () {
                            personController.removeItemFromPerson(
                                widget.person, item);
                            setState(() {});
                          },
                        ),
                        title: Text(item.name),
                        subtitle: Text(
                          'Price: \$${item.price}',
                          style: TextStyle(
                              color:
                                  item.isReceived ? Colors.green : Colors.red),
                        ),
                      );
                    },
                  ),
            SizedBox(height: 20),
          ],
        ).paddingAll(10),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          // Add a new item to the person
          Item newItem = Item(
            name: 'Another Item',
            price: 15.0,
            description: 'Another description',
            isReceived: true,
            createdDate: DateTime.now(),
          );
          personController.addItemToPerson(widget.person, newItem);
          setState(() {});
        },
        child: Text('Add Item'),
      ),
    );
  }
}

double total(List<Item> items) {
  double total = 0;
  items.forEach((e) {
    total = (e.isReceived ? total + e.price : total - e.price);
  });
  return total;
}

