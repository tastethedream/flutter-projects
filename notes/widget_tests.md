# Unit & Widgets Tests with Mokito

Testing ensures that your code behaves as expected. This can be done manually or automated with CI 
sysytems.

## Testing Flutter Applications

[Testing Flutter Apps](https://flutter.dev/docs/testing)

### Unit Tests

- Tests a single function, method or class 
- verify the correctness of a unit under a variety of conditions
- Easy to set up
- Fast
- Granular, you need lots of them

### Widget Tests

- Tests a widget
- Verify that the widgets UI looks and interacts as expected
- More setup work
- More confidence than unit tests

### Integration Tests

- Tests a complete (or large part) application
- Verify that all the widgets and services work together as expected
- Can also verify your applications performance


## Writing A Unit Test

- When you create a new flutter app, a file named `test` is created in the root of the
project

- Indside this folder there is a file `widget_test.dart` delete this file

- Choose a simple part of your application that you would like to test

- Select the `Test` folder and create a new dart file and name it to indicate what 
you are testing e.g `validator_test.dart`

- In your new file import `flutter test`

`import 'package:flutter_test/flutter_test.dart';`

- Create a Main Function

```
void main() {

}
```
- Write the test, in this case we are are testing whether a string is not empty

```
void main() {
 test('non empty String', () {
   final validator = NonEmptyStringValidator()
});
}
```

- Now write the expectation, here we expect the value of  `NonEmptyStringValidator()`
to be true

```
void main() {
 test('non empty String', () {
   final validator = NonEmptyStringValidator();
   expect(validator.isValid('test'), true);
});
}
```

## Running A Unit Test

We have now written our first test to check if a string is not empty.


- Open up the command line in your IDE

- Ensure you are in the root of your project

- Run the test

  `flutter test`

  this will run all files with `_test` in the file name that live inside the 
  `test` folder

- You will receive a report to give you the outcome

`All tests passed!`

- You can also run the tests inside Android Studio by clicking the 
green arrows in the gutter

## Checking and fixing test errors

- If your test fails check you have coded the test correctly before assuming 
your project code is incorrect. Have you added the correct expected outcome etc

- You may also find edge cases you had not considered when testing where you have 
to go back to the project code and add a scenario. For example, here I had not considered what should happen if a null
value was returned so  wrote a test that failed and then amended  my project code to take care of it. 

```
abstract class StringValidator {
  bool isValid( String value);
}

class NonEmptyStringValidator implements StringValidator {
  @override
  bool isValid(String value) {
    if (value == null) {
      return false;
    }
    return value.isNotEmpty;
  }
}

// mixin for the email sign in form
class EmailAndPasswordValidators {
  final StringValidator emailValidator = NonEmptyStringValidator();
  final StringValidator passwordValidator = NonEmptyStringValidator();
  final String invalidEmailErrorText = 'Please add your email address to continue';
  final String invalidPasswordErrorText = 'Please enter your password to continue';

}
```
Then re ran the test for this. Here is the completed test for the above section of code

```
import 'package:flutter_test/flutter_test.dart';
import 'package:time_tracker_flutter_course/app/sign_in/validator.dart';

void main() {
 test('non empty String', () {
   final validator = NonEmptyStringValidator();
   expect(validator.isValid('test'), true);
});

 test('empty string', () {
   final validator = NonEmptyStringValidator();
   expect(validator.isValid(''), false);
 });

 test('null string', () {
   final validator = NonEmptyStringValidator();
   expect(validator.isValid(null), false);
 });
}

```
## Grouping Tests Together

You can group tests together using the `group` method 

```
void main() {
  group('hours', () {
    test('positive', () {
      expect(Format.hours(10), '10h');
    });
    test('zero', () {
      expect(Format.hours(0), '0h');
    });
    test('negative', () {
      expect(Format.hours(-5), '0h');
    });
    test('decimal', () {
      expect(Format.hours(4.5), '4.5h');
    });
  });
}
```

## The setUp() method

Here we have used the setUp method to ensure this test is set up for the correct
date format before running

```
 group('date - GB Locale', () {
    //setting the locale before testing date format
    setUp(() async {
        Intl.defaultLocale = 'en_GB';
        await initializeDateFormatting(Intl.defaultLocale);
    });
    test('2019-08-12', () {
      expect(
        Format.date(DateTime(2019, 8, 12)),
        '12 Aug 2019',
      );
    });
  });
}
```

## Test Lifecycle Methods

- SetUp
- tearDown
- setUpAll
- tearDownAll

## Formatting Tests

To check the formatting of days of the week

```
group('dayOfWeek - GB locale', () {
    setUp(() async {
      Intl.defaultLocale = 'en_GB';
      await initializeDateFormatting(Intl.defaultLocale);
    });
    test('Monday', () {
      expect(
        Format.dayOfWeek(DateTime(2019, 8, 12)),
        'Mon',
      );
    });

```

To check currency formatting

```
 group('currency - US locale', () {
    setUp(()  {
      Intl.defaultLocale = 'en_US';
          });
    test('positive', () {
      expect(Format.currency(10), '\$10');
    });
    test('zero', () {
      expect(Format.currency(0), '');
    });
    test('negative', () {
      expect(Format.currency(-5), '-\$5');
    });

  });
  ```

## Testing Model Classes

These tests are a great way to ensure that youre client application(Firebase)
processes data correctly.

Here we are testing that certain values are set when a new job is created

```
import 'package:flutter_test/flutter_test.dart';
import 'package:time_tracker_flutter_course/app/home/models/job.dart';

void main() {
    group('fromMap', () {
      // Test to check if we return null when we get a null data argument
      test('null data', () {
        final job = Job.fromMap(null, 'abc');
        expect(job, null);
      });
    // Test whether values of name and rateperhour are set when a new job is created
      test('job with all properties', () {
          final job = Job.fromMap({
            'name': 'Blogging',
            'rateperhour': 10,
          }, 'abc');
          expect(job.name, 'Blogging');
          expect(job.ratePerHour, 10);
          expect(job.id, 'abc');
      });


  });
}
```

# Widget Tests

WidgetTester is used to build and interact with widgets in a test environment.

```
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('', (WidgetTester tester) async {


  });

}
```

Once you have an empty test you can choose which widget you would like to test.
In this case we are testing the widget `CustomRaisedButton()`

```
import 'package:flutter_test/flutter_test.dart';
import 'package:time_tracker_flutter_course/widgets/custom_raised_button.dart';

void main() {
  testWidgets('', (WidgetTester tester) async {
    await tester.pumpWidget(CustomRaisedButton());

  });

}
```

If the test was run now you would get the following error

`No Directionality widget found.`

**Widgets should always have an ancestor MaterialApp**

To solve this we can wrap our widget in a MaterialApp widget and make our widget the 
`home:` argument and import `material.dart`.  

```
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:time_tracker_flutter_course/widgets/custom_raised_button.dart';

void main() {
  testWidgets('', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CustomRaisedButton()));

  });

}
```

## Finding widgets and matcher arguments

- Widgets can be found with a `finder`
- Use `matchers` to write expectations on widgets

```
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:time_tracker_flutter_course/widgets/custom_raised_button.dart';

void main() {
  testWidgets('', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CustomRaisedButton()));
    // test if the widget contains a raised button
    final button = find.byType(RaisedButton);
    expect(button, findsOneWidget);
  });

}
```
You can also test the child of the raised button. Here we are checking the child 
has a Text field.

```
void main() {
  testWidgets('', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CustomRaisedButton(
      child: Text('tap me'),
    )));
    // test if the widget contains a raised button
    final button = find.byType(RaisedButton);
    expect(button, findsOneWidget);
    expect(find.text('tap me'), findsOneWidget);
  });

}
```

## Testing Widget Callbacks












