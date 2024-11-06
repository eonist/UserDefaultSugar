import UIKit

class ViewController: UIViewController {
   override func viewDidLoad() {
      super.viewDidLoad()
      Swift.print("hello world") // prints "hello world" to the console
      //      testSettingValues()
//      testReadingValues()
      removeDataTest() // calls the removeDataTest function
   }
}

/**
 * Test
 */
extension ViewController {
   /**
    * Test setting
    */
   func testSettingValues() {
      let defaults = UserDefaults.standard // creates a new UserDefaults object
      defaults.set(25, forKey: "Age") // sets the value 25 for the key "Age"
      defaults.set(true, forKey: "hasOnboarded") // sets the value true for the key "hasOnboarded"
      defaults.set(CGFloat.pi, forKey: "Pi") // sets the value of pi for the key "Pi"
      defaults.set("Paul Hudson", forKey: "Name") // sets the value "Paul Hudson" for the key "Name"
      defaults.set(Date(), forKey: "LastRun") // sets the current date for the key "LastRun"
      // arr and dict:
      let array = ["Hello", "World"] // creates a new array
      defaults.set(array, forKey: "SavedArray") // sets the array for the key "SavedArray"
      let dict = ["Name": "Paul", "Country": "UK"] // creates a new dictionary
      defaults.set(dict, forKey: "SavedDict") // sets the dictionary for the key "SavedDict"
//
   }
   /**
    * - Fixme: ⚠️️
    */
   func testReadingValues() {
      UserDefaults.standard.set("John", forKey: "FirstName") // sets the value "John" for the key "FirstName"
      Swift.print(UserDefaults.standard.object(forKey: "FirstName") ?? "err")// John // prints the value for the key "FirstName" to the console
      // where is the userdefaults stored?
   }
   /**
    * - Fixme: ⚠️️
    */
   func removeDataTest() {
      testSettingValues() // calls the testSettingValues function
      // UserDefaults.debug()
      Swift.print("remove all") // prints "remove all" to the console
      UserDefaults.removeAll() // removes all data stored in UserDefaults
      UserDefaults.debug() // prints the current state of UserDefaults to the console
   }
}
