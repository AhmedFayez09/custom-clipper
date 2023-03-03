import '../app.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _items = [];

  final GlobalKey<AnimatedListState> _key = GlobalKey();
  void _addItem() {
    _items.insert(0, 'Item ${_items.length + 1}');
    _key.currentState!.insertItem(0, duration: const Duration(seconds: 1));
  }

  void _removeItem(int index) {
    _key.currentState!.removeItem(index, (context, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: const Card(
          margin: EdgeInsets.all(10),
          elevation: 0,
          color: Colors.purple,
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(horizontal: 10),
            title: Text(
              "Removing",
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    }, duration: const Duration(seconds: 1));
    _items.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          centerTitle: true,
          title: IconButton(onPressed: _addItem, icon: const Icon(Icons.add)),
        ),
        body: AnimatedList(
          key: _key,
          initialItemCount: 0,
          padding: const EdgeInsets.all(10),
          itemBuilder: (context, index, animation) {
            return SizeTransition(
              key: UniqueKey(),
              sizeFactor: animation,
              child: Card(
                margin: const EdgeInsets.all(10),
                elevation: 0,
                color: Colors.purple,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  title: Text(
                    _items[index],
                    style: const TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () => _removeItem(index),
                    icon: const Icon(Icons.delete),
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        ));
  }
}
