import Foundation
/**
 * Enables you to store structs in user default .plistinfo
 */
public protocol UserDefKind: Codable {
   static var key: String { get }
   static var defaultModel: Self { get } // - Fixme: ⚠️️ maybe make optional
}
/**
 * Ext
 */
extension UserDefKind {
   /**
    * Returns the model (for the user def key)
    * - Note: Serializes and deserializes (JSON <-> Struct)
    * - Note: To access individual values, you we can use model.dict?["someKey"] as? SomeValue etc
    */
   public static var model: Self {
      get { getData(key: Self.key)
      } set { setData(key: Self.key, data: newValue) }
   }
}
/**
 * Private helpers
 */
extension UserDefKind {
   /**
    * Gets data
    */
   private static func getData(key: String) -> Self {
      guard let data = (try? UserDefaults.standard.get(objectType: Self.self, forKey: key)) else {
         return setData(key: key, data: Self.defaultModel)
      }
      return data
   }
   /**
    * Sets data
    */
   @discardableResult
   private static func setData(key: String, data: Self) -> Self {
      try? UserDefaults.standard.set(object: data, forKey: key)
      return data // We return data for convenience
   }
}
