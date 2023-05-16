## 0.0.1

* TODO: Describe initial release.

When calling the checkConnection() method, you can pass the desired route as an argument:

NetworkChecker networkChecker = NetworkChecker();
networkChecker.checkConnection(
    context, 'example.com', MaterialPageRoute(builder: (context) => MyRoute()));


Replace 'example.com' with the desired URL to check for connectivity, and MyRoute() with your own route widget that you want to navigate to upon successful connection.

Please note that the MyRoute widget should be defined and implemented in your Flutter application.

Remember to handle any exceptions or errors that may occur during the navigation process or in your route widget.

If you have any further questions or need additional help, feel free to ask!