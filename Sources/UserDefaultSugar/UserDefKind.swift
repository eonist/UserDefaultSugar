import Foundation
/**
 * Enables you to store structs in user default `.plistinfo`
 */
public protocol UserDefKind: Codable {
   /**
    * Key in user-default dictionary
    */
   static var key: String { get }
   /**
    *  - Fixme: ⚠️️ Maybe make optional or throwable?
    */
   static var defaultModel: Self { get }
   /**
    * - Note: Usually .standard, but can use: `.init?(suiteName suitename: String?)` as well
    * - Note: `.init(suiteName: Bundle.main.infoDictionary?["AppGroup"] as? String)`
    */
   static var userDefaults: UserDefaults? { get }
}
/**
 * Ext
 */
extension UserDefKind {
   /**
    * Default value (Overridable)
    */
   public static var userDefaults: UserDefaults? {
      .standard
   }
   /**
    * Returns the model (for the user def key)
    * - Note: Serializes and deserializes (JSON <-> Struct)
    * - Note: To access individual values, you we can use model.dict?["someKey"] as? SomeValue etc
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
 * Private helpers
 */
extension UserDefKind {
   /**
    * Gets data for key
    * - Parameter key: key in user def dictionary
    */
   private static func getData(key: String) -> Self {
      guard let data = (try? userDefaults?.get(objectType: Self.self, forKey: key)) else {
         return setData(key: key, data: Self.defaultModel)
      }
      return data
   }
   /**
    * Sets data for key
    * - Parameters:
    *   - key: key in user def dictionary
    *   - data: Data to be stored
    */
   @discardableResult private static func setData(key: String, data: Self) -> Self {
      do {
         try userDefaults?.set(object: data, forKey: key)
         // UserDefaults.standard.synchronize() // - Fixme: ⚠️️ might be needed or?
      } catch {
         Swift.print("⚠️️ Err setting data for key: \(key) error:  \(error)")
      }
      return data // We return data for convenience
   }
}
