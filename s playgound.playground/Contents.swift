import UIKit

var greeting = "Hello, playground"


enum Vehicle {
    case car(passengers: Int, trunks: Int),
         buss(passengers: Int,luggage: Int),
         train(passengers: Int,buggage: Int)
    
}


func capacity(vehicle: Vehicle) -> Int{
    switch vehicle {
        
    case .car(passengers: let passengers, trunks: let trunks):
        return passengers + trunks
    case .buss(passengers: let passengers, luggage: let luggage):
        return passengers + luggage
    case .train(passengers: let passengers, buggage: let buggage):
        return passengers + buggage
    }
}


let car = Vehicle.car(passengers: 4, trunks: 4)

print(capacity(vehicle: car))
