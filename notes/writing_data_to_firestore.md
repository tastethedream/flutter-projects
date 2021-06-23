# Writing data to Firestore in Flutter

Insert basic instructions for Firestore here, look at previos blog post>???

- create a new file in the services directory of your project

`database,dart`

- Create an abstract class 

```
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

abstract class Database {
  Future<void> createJob(Map<String, dynamic> jobData);

}
```

- Create a Firestore class and create the path, document reference and ability to write data to your specified location

```

class FirestoreDatabase implements Database {
  FirestoreDatabase({@required this.uid}) : assert(uid != null);
  final String uid;

  Future<void> createJob(Map<String, dynamic> jobData) async {
    //create a path that contains the location where we are going to write our firestore data to
    final path = '/users/$uid/jobs/job_abc';
    // Retrieve the document reference by accessing FirebaseFirestore.instance
    final documentReference =  FirebaseFirestore.instance.doc(path);
    // Write the data to the location pointed to by the document reference
    await documentReference.set(jobData);
  }
}
```

- In your application code (in this case it is in my jobs_page.dart. Write a function to allow access to the database

```
Future<void> _createJob(BuildContext context) async {
    final database = Provider.of<Database>(context, listen: false);

}
```

- Create something to write to the database

```
  Future<void> _createJob(BuildContext context) async {
    final database = Provider.of<Database>(context, listen: false);
    //Create a job
    await database.createJob({
      'name': 'Blogging',
      'ratePerHour': 10,
    });
  }

  ```

  - Attach this to your add button in your application

  ```
        floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _createJob(context),
      ),
    );
  }
  ```

  When you hit the button you should see this job appear in your Firestore Database in the Users collection


