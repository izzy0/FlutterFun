# flutter_application_1

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

# Launch Andriod Emulator Without Opening Andriod Studios
type ``` flutter emulators ```
find the device you want to open in the list 
then type ``` flutter emulators --launch <emulator id> ```
# Project Notes 

## Navigation
view in 1_basics

### Setting Up Routes
```
routes: {
    '/firstpage': (context) => FirstPage(),
    '/secondpage': (context) => SecondPage(),
},
```

### Navigating A Page 
#### Navigation with onTap():
Push desired page using Navigator
```
onPress: () {
    Navigator.pushNamed(context, '/secondpage');
}
```
Navigating to page and basically "reseting" the view you need to pop the intial context so that the view is reset. Example: using a drawer menu and not popping when clicking a menu item it will keep the drawer open when clicking the back button, when including pop() in the navigatior this will show the drawer closed showing a "reset" view.

```
onPress: () {
    Navigator.pop(context);
    Navigator.pushNamed(context, '/secondpage');
}
```
#### Navigation with a bottomNavigationBar
create a list of pages you need, then follow the index of each item in the bottomBar *make sure to conver stateless widget to stateful 
```
  int _selectedIndex = 0;

  // this method updates the new selected state
  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List _pages = [
    HomePage(),
    ProfilePage(),
    SettingsPage(),
  ];
```
Here you will see that the body in indexed in _pages

```
body: _pages[_selectedIndex], <--- body changes based on index
bottomNavigationBar: BottomNavigationBar(
    currentIndex: _selectedIndex,
    onTap: _navigateBottomBar,
    items: [
        BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'HOME',
        ),
    ...],
    ),
```

## Stateful

High Leve View of what is needed for state
1. Variable 
2. Method
3. UI (User Interface)

use setState(); to rebuild the widget, if not used the widget will remain unchanges while the variable will change.

## Inputs

To get values from a text feild use a TextEditingController
```
TextEditingController myController = TextEditingController();

//use example
String userName = myController.text;

//connecting the controller
 ...
 TextField(
    controller: myController,
 )...
```