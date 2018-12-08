import Foundation

public extension UserDefaults {
   /**
    * Reads all (key,val) pairs in UserDefaults.standard
    */
   public static func debug(){
      UserDefaults.standard.dictionaryRepresentation().forEach { (key, value) in
         print("Key: \(key) value: \(value)")
      }
   }
   /**
    * Removes all keys and values from user defaults
    * NOTE: Seems to not remove the apple data. like keyboar etc. Only what the user set
    */
   public static func removeAll() {
      UserDefaults.standard.dictionaryRepresentation().forEach{  (key, _) in
         UserDefaults.standard.removeObject(forKey: key)
      }
   }
}

