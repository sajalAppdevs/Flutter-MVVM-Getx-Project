import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm_getx/data/response/status.dart';
import 'package:mvvm_getx/res/routes/routes_name.dart';
import 'package:mvvm_getx/view_model/controller/home_controller/home_controller.dart';
import 'package:mvvm_getx/view_model/controller/user_pref/user_pref.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController controller=Get.put(HomeController());


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.userListApi();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: false,
        title: Text("App Bar"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            UserPreference pref=UserPreference();
            pref.removeUser().then((value) {
              Get.toNamed(RoutesName.loginScreen);
            },);
          }, icon: Icon(Icons.logout))
        ],
      ),
      body: Obx(() {
        switch(controller.rxRequestStatus.value){
          case Status.LOADING :
            return const Center(child: CircularProgressIndicator(),);
          case Status.ERROR :
            return Center(child: Text("something went wrong"),);
          case Status.COMPLETE :
            return ListView.builder(
              itemCount: controller.userList.value.data!.length,
              itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                child: Card(
                  elevation: 10,
                  child: Container(
                    height: 150,
                    width: MediaQuery.sizeOf(context).width,
                    child: Center(
                      child: ListTile(
                        title: Text(controller.userList.value.data![index].firstName!),
                        subtitle: Text(controller.userList.value.data![index].email!),
                        trailing: Text(controller.userList.value.data![index].id.toString()),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            height: 60,
                            width: 60,
                            child: Image.network(controller.userList.value.data![index].avatar!,fit: BoxFit.fill,),
                          ),
                        )
                      ),
                    ),
                  ),
                ),
              );
            },);
        }
      }),
    );
  }
}
