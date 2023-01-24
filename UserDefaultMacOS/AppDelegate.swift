import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
   @IBOutlet weak var window: NSWindow!
   /**
    * Creates the view
    */
   lazy var view: NSView = {
      let contentRect = window.contentRect(forFrameRect: window.frame) // Size of win sans titlebar
      let view: View = .init(frame: contentRect)
      window.contentView = view
      view.layer?.backgroundColor = NSColor.white.cgColor
      return view
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
      let defaults = UserDefaults.standard
      // Regular values
      defaults.set(25, forKey: "Age")
      defaults.set(true, forKey: "hasOnboarded")
      defaults.set(CGFloat.pi, forKey: "Pi")
      defaults.set("Paul Hudson", forKey: "Name")
      defaults.set(Date(), forKey: "LastRun")
      // arr and dict:
      let array = ["Hello", "World"]
      defaults.set(array, forKey: "SavedArray")
      let dict = ["Name": "Paul", "Country": "UK"]
      defaults.set(dict, forKey: "SavedDict")
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
      testSettingValues()
      //      UserDefaults.debug()
      Swift.print("remove all")
      UserDefaults.removeAll()
      UserDefaults.debug()
   }
}
