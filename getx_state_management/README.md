<a href="https://linkedin/in/ajazify">
    <img src="https://raw.githubusercontent.com/ajazify/git_image/main/GetX_StateManagement_Flutter.png">
</a>

<h1> How to create an project with GetX architecture in Flutter.</h1>
<h3>#getx #Flutter</h3>

<p>Let's Learn how to create a FLutter app using GetX State Managment</p>

<p> GetX is a highly efficient and lightweight solution for Flutter development. It excels in delivering high-performance state management, smart dependency injection, and seamless route management. This powerful combination is designed to enhance your Flutter projects with speed and practicality, making it an excellent choice for developers seeking a robust and streamlined approach.</p>

<h2>Easy Flutter with GetX</h1>

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

»
