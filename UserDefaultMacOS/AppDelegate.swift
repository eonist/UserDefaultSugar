import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
   @IBOutlet weak var window: NSWindow!
   /**
    * Creates the view
    */
   lazy var view: NSView = {
      let contentRect = window.contentRect(forFrameRect: window.frame) // Get the size of the window without the title bar
      let view: View = .init(frame: contentRect) // Create a new view with the same size as the window
      window.contentView = view // Set the window's content view to the new view
      view.layer?.backgroundColor = NSColor.white.cgColor // Set the background color of the view to white
      return view // Return the new view as the result of the function
   }()
   func applicationDidFinishLaunching(_ aNotification: Notification) {
      _ = view
   }
}
open class View: NSView {
   override open var isFlipped: Bool { true } // TopLeft orientation
   override public init(frame: CGRect) {
      super.init(frame: frame)
      Swift.print("Hello world")
      self.wantsLayer = true // If true then view is layer backe
      // testSettingValues()
      // testReadingValues()
      removeDataTest()
   }
   /**
    * Boilerplate
    */
   public required init?(coder decoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
   }
}
/**
 * View
 */
extension View {
   /**
    * Test setting
    */
   func testSettingValues() {
      let defaults = UserDefaults.standard // // Get the shared UserDefaults instance
      // Regular values
      defaults.set(25, forKey: "Age") // Set the value 25 for the key "Age" in UserDefaults
      defaults.set(true, forKey: "hasOnboarded") // Set the value true for the key "hasOnboarded" in UserDefaults
      defaults.set(CGFloat.pi, forKey: "Pi") // Set the value of pi for the key "Pi" in UserDefaults
      defaults.set("Paul Hudson", forKey: "Name") // Set the value "Paul Hudson" for the key "Name" in UserDefaults
      defaults.set(Date(), forKey: "LastRun") // Set the current date and time for the key "LastRun" in UserDefaults
      // arr and dict:
      let array = ["Hello", "World"] // Create an array with two strings
      defaults.set(array, forKey: "SavedArray") // Set the array for the key "SavedArray" in UserDefaults
      let dict = ["Name": "Paul", "Country": "UK"] // Create a dictionary with two key-value pairs
      defaults.set(dict, forKey: "SavedDict") // Set the dictionary for the key "SavedDict" in UserDefaults
   }
   /**
    * - Fixme: ⚠️️ 
    */
   func testReadingValues() {
      UserDefaults.standard.set("John", forKey: "FirstName")
      Swift.print(UserDefaults.standard.object(forKey: "FirstName") ?? "err") // John
      // where is the userdefaults stored? Answer see blog-post
   }
   /**
    * - Fixme: ⚠️️
    */
   func removeDataTest() {
      testSettingValues() // Call the function to test setting values in UserDefaults
      // UserDefaults.debug()
      Swift.print("remove all") // Print a message to the console
      UserDefaults.removeAll() // Remove all values from UserDefaults
      UserDefaults.debug() // Print the current state of UserDefaults to the console
   }
}
