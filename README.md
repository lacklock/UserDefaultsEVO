# UserDefaultsEVO
Using UserDefaults in a swift way
# Usage
define a Enum which rawValue is String, comform to `UserDefaultSettable`

```swift
extension UserDefaults {
    enum TestData: String,UserDefaultSettable {
        case name
    }
}
```
store value:
```swift
UserDefaults.TestData.name.store(value: "name")
```
get value form UserDefaults:
```swift
 let storeValue = UserDefaults.TestData.name.storedString
```