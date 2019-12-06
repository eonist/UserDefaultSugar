import UIKit

class ViewController: UIViewController {
   override func viewDidLoad() {
      super.viewDidLoad()
      Swift.print("hello world")
      //      testSettingValues()
//      testReadingValues()
      removeDataTest()
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
      let defaults = UserDefaults.standard
      defaults.set(25, forKey: "Age")
      defaults.set(true, forKey: "hasOnboarded")
      defaults.set(CGFloat.pi, forKey: "Pi")
      defaults.set("Paul Hudson", forKey: "Name")
      defaults.set(Date(), forKey: "LastRun")
      //arr and dict:
      let array = ["Hello", "World"]
      defaults.set(array, forKey: "SavedArray")
      let dict = ["Name": "Paul", "Country": "UK"]
      defaults.set(dict, forKey: "SavedDict")
//
   }
   /**
    *
    */
   func testReadingValues() {
      UserDefaults.standard.set("John", forKey: "FirstName")
      Swift.print(UserDefaults.standard.object(forKey: "FirstName") ?? "err")//John
      //where is the userdefaults stored?
   }
   /**
    *
    */
   func removeDataTest() {
      testSettingValues()
//      UserDefaults.debug()
      Swift.print("remove all")
      UserDefaults.removeAll()
      UserDefaults.debug()
   }
}
