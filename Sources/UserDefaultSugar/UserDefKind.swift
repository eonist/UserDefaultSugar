import Foundation
/**
 * Protocol that enables you to store structs in user default `.plistinfo`
 */
public protocol UserDefKind: Codable {
   /**
    * Key in user-default dictionary
    */
   static var key: String { get }
   /**
    * Default value for the struct 
    * - Fixme: ⚠️️ Maybe make optional or throwable?
    */
   static var defaultModel: Self { get }
   /**
    * User defaults object to use
    * - Remark: Usually `.standard`, but can use: `.init?(suiteName suitename: String?)` as well
    * - Remark: `.init(suiteName: Bundle.main.infoDictionary?["AppGroup"] as? String)`
    */
   static var userDefaults: UserDefaults? { get }
}
/**
 * Extension for UserDefKind protocol
 */
extension UserDefKind {
   /**
    * Default value for user defaults object
    */
   public static var userDefaults: UserDefaults? {
      .standard
   }
   /**
    * Returns the model for the user default key
    * - Remark: Serializes and deserializes (JSON <-> Struct)
    * - Remark: To access individual values, you can use `model.dict?["someKey"] as? SomeValue` etc
    */
   public static var model: Self {
      get {
         getData(key: Self.key) // Returns model
      } set {
         setData(key: Self.key, data: newValue) // Sets new model
      }
   }
}
/**
 * Private helpers for UserDefKind protocol
 */
extension UserDefKind {
   /**
    * Gets data for key
    * - Parameter key: key in user default dictionary
    */
   private static func getData(key: String) -> Self {
      guard let data: Self = (try? userDefaults?.get(objectType: Self.self, forKey: key)) else {
         return setData(key: key, data: Self.defaultModel)
      }
      return data
   }
   /**
    * Sets data for key
    * - Parameters:
    *   - key: key in user default dictionary
    *   - data: Data to be stored
    */
   @discardableResult private static func setData(key: String, data: Self) -> Self {
      do {
         try userDefaults?.set(object: data, forKey: key)
         // UserDefaults.standard.synchronize() // - Fixme: ⚠️️ might be needed or? Do some research, maybe enable via param flag
      } catch {
         Swift.print("⚠️️ Error setting data for key: \(key) error:  \(error)")
      }
      return data // We return data for convenience
   }
}
