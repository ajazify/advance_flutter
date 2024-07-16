<a href="https://linkedin/in/ajazify">
    <img src="https://raw.githubusercontent.com/ajazify/git_image/main/GetX_StateManagement_Flutter.png">
</a>

<h1> How to create an App with GetX Patter in Flutter.</h1>
<h3>#getx #Flutter</h3>

<p>Let's Learn how to create a FLutter app using GetX State Managment</p>

<p> GetX is a highly efficient and lightweight solution for Flutter development. It excels in delivering high-performance state management, smart dependency injection, and seamless route management. This powerful combination is designed to enhance your Flutter projects with speed and practicality, making it an excellent choice for developers seeking a robust and streamlined approach.</p>

<h2>Easy Flutter with GetX</h2>

<h4>Snackbars/dialogs/bottomsheets with no context</h4>
<pre>Get.snackbar('Hi', 'Message');<br>Get.defaultDialog(title: "I am a dialog");</pre>

<h4>Easiest State Management</h4>
<pre>var count = 0.obs;<br>Obx(()=> Text(count.string)); // Text() will be updated when count changes </pre>

<h4>Access data from one instance in another screen easily.</h4>
<pre>Get.put(Instance());<br>Instance inst = Get.find();<br>Text(inst.name);</pre>

<h4>Easy key/value storage</h4>
<pre>GetStorage box = GetStorage();<br>box.write('key', 'value');<br>box.read('key'); // out: value</pre>

<h4>Easy internationalization</h4>
<pre>Text('Hello World'.tr);<br>Get.changeLocale (Locale('pt')); // out: Text('Olá mundo');</pre>

<h4>Easy change theme:</h4>
<pre>Get.changeTheme (ThemeData.dark());</pre>

<h4>Easy validators:</h4>
<pre>GetUtils.isEmail('abc@gmail.com') ? validate() errorMessage();</pre>

<h4>Easy Page Navigation</h4>
<pre>
    » Get.to(Login()); //Navigate to a New Page <br>
    » Get.toNamed(Login()); //Navigate to a Named Route <br>
    » Get.offAll(Home()); //Navigate to a New Page and Remove All Previous Routes <br>
    » Get.offAllNamed('/home'); //Navigate to a Named Route and Remove All Previous Routes <br>
    » Get.off(Login()); //Navigate to a New Page and Replace the Current Route <br>
    » Get.offNamed('/login'); //Navigate to a Named Route and Replace the Current Route <br>
    » Get.back(); //Navigate Back to Previous Page <br>
    » Get.until((route) => route.settings.name == '/login'); //Navigate to a Named Route and Remove Routes Until a Specific Condition is Met<br>
    » Get.toNamed('/profile', arguments: {'id': 123}); //Navigate with Parameters <br>
    » var id = Get.arguments['id']; //Retrieve Passed Parameters <br>
</pre>

<h2>Let's Get Started!</h2>
<h1>Step 1</h1>
<h4>Create a new Flutter project.</h4>
<pre>flutter create your_project_name</pre>

<h1>Step 2</h1>
<h4>Add latest GetX package to your pubspec.yaml file.</h4>
<pre> dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.6
  get: ^4.6.6 </pre>

<h1>Step 3</h1>
<h4>Folder Structure</h4>
<pre> 
lib/
│
├── modules/
│   ├── auth/
│   │   ├── controllers/
│   │   │   └── login_controller.dart
│   │   ├── views/
│   │   │   └── login_page.dart
│   │   └── models/
│   │       └── login_request_model.dart
│   │
│   ├── home/
│   │   ├── controllers/
│   │   │   └── home_controller.dart
│   │   ├── views/
│   │   │   └── home_page.dart
│   │   └── models/
│   │       └── post_model.dart
│
├── core/
│   ├── bindings/
│   ├── routes/
│   │   ├── app_routes.dart
│   │   └── app_pages.dart
│   ├── providers/
│   │   └── api_provider.dart
│   └── repositories/
│       └── user_repository.dart
│
├── widgets/
│   └── custom_button.dart
│
└── main.dart
</pre>

<h1>Step 4</h1>
<h3>Controller</h3>
<h4>Extend your controller class with GetxController to control your page</h4>
<pre>
import 'package:get/get.dart';
class LoginController extends GetxController {
}
</pre>

<h1>Step 5</h1>
<h3>Binding</h3>
<h4>Bindings can be used to initialize your controllers, repositories, APIs, and page.</h4>
<pre>
//login_binding.dart
    
class ViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
</pre>


<h1>Step 6</h1>
<h3>Page/View</h3>
<h4>You use this page to display your UI in your app.
</h4>
<pre>
//login_page.dart

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: const Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
</pre>



<h1>Step 7</h1>
<h3>Set up your route</h3>
<h4>Extend your controller class with GetxController to control your page</h4>
<pre>
//app_routes.dart

class AppRoutes {
  static const login = '/login';
}
</pre>

<pre>
//app_pages.dart

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => LoginPage(),
      binding: ViewBinding(),
    ),
  ];
}
</pre>

<h1>Step 8</h1>
<h3>Update main.dart</h3>
<h4>change your MaterialApp widget with GetMaterialApp in main.dart and add the routes and binding</h4>
<pre>
//main.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialBinding: HomeBinding(),
      home: HomePage(),
      getPages: AppPages.pages,
    );
  }
}
</pre>

»
