import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hiveexample/employee.dart';
import 'package:path_provider/path_provider.dart';
class MyHomePage extends StatefulWidget {


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Box _employeeBox;
  TextEditingController employeeNameController =TextEditingController();
  TextEditingController employeeHobbyController =TextEditingController();

  @override
  void initState() {
super.initState();
Hive.registerAdapter(EmployeeAdapter());
_openBox();
  }


  void _openBox() async{

    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    _employeeBox = await Hive.openBox('employeeBox');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hive"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Text("Employee name ",textAlign: TextAlign.center,style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.w600
              ),),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: TextField(

                controller: employeeNameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Employee Name',
                ),
              ),
            ),

            Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Text("Employee hobby ",textAlign: TextAlign.center,style: TextStyle(
                fontSize: 20,fontWeight: FontWeight.w600
              ),),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: TextField(

                controller: employeeHobbyController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Employee Hobby',
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Text("Employee Data  ",textAlign: TextAlign.center,style: TextStyle(
                  fontSize: 20,fontWeight: FontWeight.w600
              ),),
            ),
            _employeeBox ==null? Container():  ListView.builder(shrinkWrap: true,
              itemCount:  _employeeBox.length,
              itemBuilder: (context ,index)
              {
                final employee = _employeeBox.get(index) as Employee;
                print("pretty print ${employee.name}");
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text("${employee.name}",style: TextStyle(fontWeight: FontWeight.w400 ,fontSize: 15),),  Text("${employee.hobby} ",style: TextStyle(fontWeight: FontWeight.w400 ,fontSize: 15),),
                    ],
                  ),
                );
              },),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()
        {
          if(employeeNameController.text != "" && employeeHobbyController.text != "")
            {
              _employeeBox.add(Employee(employeeNameController.text, employeeHobbyController.text));
            }


          employeeHobbyController.clear();
          employeeNameController.clear();

          // for just our list updated
          setState(() {
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }


}
