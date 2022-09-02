
import UIKit

protocol Calculation   {
    func line()
    func FnOrderSummary()
    func printing(productName  :  String)
    func billPayment(totalBill  :  Int)
}
extension Calculation  {
    func line()  {

    }
    func FnOrderSummary()  {
        
    }
    func printing(productName  :  String)  {

    }
    func billPayment(totalBill  :  Int)  {
        
    }
}
func line()   {
    print("------------------------------------------------------------------")
}
var UnexpectedInputCall  :  () -> String =   {    //closure declaration
    return "sorry 😟 try with given options only\n"
}
@propertyWrapper
class EmailPropertyWrapper  {
    private var _value : String = ""
    var wrappedValue : String   {     //computed property used with getter and setter
        get   {
            return emailValidate(emailId : _value) ? _value : UnexpectedInputCall()
        }
        set   {
            _value = newValue
        }
    }
    init( wrappedValue : String)   { //initialisation for wrapped value
        self._value = wrappedValue
        self.wrappedValue = wrappedValue
    }
    private func emailValidate(emailId : String) ->  Bool   {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-za-z]{2,64}"
        let pred = NSPredicate(format: "SELF MATCHES %@", regex)
        return pred.evaluate(with: emailId)
    }
}
class MemberDetails   {      //member class declared
    let name                 :  String
    var age                  :  Int
    let mobNum               :  String
    @EmailPropertyWrapper var emailId :  String
    var walletBalance        :  Int = 100000
    init(name  :  String,  age  :  Int,  mobNum  :  String, emailId : String)  { //initialisation for member class
         self.name    = name
         self.age     = age
         self.mobNum  = mobNum
         self.emailId = emailId
    }
}
struct StoreDetails   {
    var productInformation    : [String  :  Int]  =  ["water" : 10, "sugar" :  20, "honey" : 30, "bacon" : 100]
}
var object_store_details = StoreDetails()

class ShoppingDetails   {
    var productName   :  String
    init(productName  :  String)  {
        self.productName = productName
    }
    func printing(productName  :  String)   {
        let  value = object_store_details.productInformation[productName]!
        print("user shopped for \(productName) which costs \(value) ")
    }
}
var objproductInformation  = StoreDetails()

class Cart   {
    var updateItemList   :  [String:Int] = [:]
    init(updateItemList  :  [String:Int])  {
        self.updateItemList = updateItemList
    }
}
class Summary  :  Calculation    {
    
    var updateItemList : [String] = []
    
    var totalBill     : Int = 0
    var inputBalance  : Int
    init(inputBalance : Int , updateItemList : [String])  {
        self.inputBalance = inputBalance
        self.updateItemList = updateItemList
    }
    func FnOrderSummary()   {
        for (i,_) in objCart.updateItemList  {
            if let y = objproductInformation.productInformation[i]  , let z = objCart.updateItemList[i] {
                print("✔ \(i) --->  for Rs.  \(y*z)  ")
                totalBill = totalBill + (y*z)
            }
            else  {
                print("✗ \(i) is unavailable in stock .")
            }
        }
        line()
        print( "Total bill for the complete order summary in Cart is  : -> \(totalBill)\n")
        print( "Please go through the payment by clicking YES or NO to Exit."   )
        billPayment(totalBill : totalBill)
    }
    func billPayment(totalBill : Int)  {
        print("YES")
        if totalBill <= inputBalance   {
            print("!!! Transaction successfull for Rs. \(totalBill) \n !! Now your cart Is Empty  !!")
        }
        else  {
            print("Transaction failed please add  :  \(totalBill - inputBalance) to purchase.")
        }
    }
}

var userOpted = ["water" : 3, "honey" : 4, "berry" : 5, "mango" : 6, "apple" : 6, "bacon" : 8]
var objCart = Cart(updateItemList :  userOpted)
print("<-------~~~~~~~~~~~~:  WELCOME TO SHOPPERS MART  :~~~~~~~~~~~~------->\n\n")
print("~~~~~~~~~~~~~~~~~CURRENT USER CREDENTIAL  DETAILS~~~~~~~~~~~~~~~~~~~~~~~")
var member1 = MemberDetails(name : "Ayush", age : 18, mobNum : "12313242456", emailId: "ayush9876@gmail.com")
print("\n Name  : \(member1.name) \n Age  : \(member1.age)\n MobileNumber  :  \(member1.mobNum) \n Email Id :  \(member1.emailId) ")
line()
print("~~~~~~~~~~~~~~~~~~~~~PRODUCTS AVAILABLE IN SHOP~~~~~~~~~~~~~~~~~~~~\n\n")
print("|| :  :  PRODUCT NAME  : || :  PRICE  :  : ||")
for (i,_) in objproductInformation.productInformation   {
    if let value = objproductInformation.productInformation[i]   {      //
    print("👉            \(i)             \(value).Rs       ")
    }else  {
        print("")
    }
}
line()
print("Item Added In Cart")
line()                                           //
print("`````````product_name | quantity`````````")
for (i,j) in objCart.updateItemList  {
print("  \(i)          -->   \(j)  ")
}
line()
print("order summary of items purchased.\n")
line()
var update_list : [String] = ["water" , "honey"]
var objsummary = Summary(inputBalance :  1000 , updateItemList: update_list)
objsummary.FnOrderSummary()

