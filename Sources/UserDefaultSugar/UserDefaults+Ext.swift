import Foundation

extension UserDefaults {
   /**
    * Reads all (key, val) pairs in `UserDefaults.standard` 
    */
   public static func debug() {
      UserDefaults.standard.dictionaryRepresentation().forEach { key, value in
         print("Key: \(key) value: \(value)")
      }
   }
   /**
    * Removes all keys and values from user defaults
    * - Remark: Seems to not remove the apple data. like keyboar etc. Only what the user set
    * - Remark: There is also `resetStandardUserDefaults()` the method releases the `standardUserDefaults` and sets it to nil. A new `standardUserDefaults` will be created the next time it's accessed. The only visible effect this has is that all KVO observers of the previous `standardUserDefaults` will no longer be observing it.
    * - Remark: Can also do: `UserDefaults.standard.removePersistentDomain(forName: Bundle.main.bundleIdentifier!) -> https://stackoverflow.com/a/34331533/5389500
    */
   public static func removeAll() {
      UserDefaults.standard.dictionaryRepresentation().forEach { key, _ in
         UserDefaults.standard.removeObject(forKey: key)
      }
   }
}
/**
 * UserDefaults extensions
 * - Fixme: ⚠️️ Add example
 */
extension UserDefaults {
   /**
    * Set Codable object to UserDefaults
    * - Parameters:
    *   - object: Codable Object
    *   - forKey: Key string
    * - Throws: UserDefaults Error
    */
   public func set<T: Codable>(object: T, forKey: String) throws {
      let jsonData = try JSONEncoder().encode(object)
      set(jsonData, forKey: forKey)
   }
   /**
    * Get Codable object from UserDefaults
    * - Parameters:
    *   - object: Codable Object
    *   - forKey: Key string
    * - Throws: UserDefaults Error
    */
   public func get<T: Codable>(objectType: T.Type, forKey: String) throws -> T? {
      guard let result = value(forKey: forKey) as? Data else { return nil }
      return try JSONDecoder().decode(objectType, from: result)
   }
}
/**
 * Asserter
 */
extension UserDefaults {
   /**
    * UserDef extension
    * ## Examples:
    * UserDefaults.standard.exists(keyName: hasBeenLaunchedBeforeFlag)
    */
   public func exists(keyName: String) -> Bool {
      self.object(forKey: keyName) != nil // Key exists
   }
}
