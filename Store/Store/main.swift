//
//  main.swift
//  Store
//
//  Created by Ted Neward on 2/29/24.
//

import Foundation

protocol SKU {
  var name: String { get }
  func price() -> Int
}

class Item: SKU {
  let name: String
  let priceEach: Int

  init(name: String, priceEach: Int) {
    self.name = name
    self.priceEach = priceEach
  }


  func price() -> Int {
    return priceEach
  }
}

class Receipt {
    private var items: [SKU] = []

    func addItem(_ item: SKU) {
      items.append(item)
    }

    var itemsList: [SKU] {
      return items
    }
    
    func total() -> Double {
            return Double(items.reduce(0) {$0 + $1.price()})
        }

    func output() -> String {
        var outputString: String
        outputString = "Receipt:\n"
        for item in items {
            outputString += "\(item.name): $\(String(format: "%.2f", Double(item.price()) / 100))\n"
        }
        outputString += "------------------\n"
        outputString += "TOTAL: $\(String(format: "%.2f", total()/100))"
        return outputString
    }
  }


class Register {
    private var currentReceipt = Receipt()

     func scan(_ item: SKU) {
       currentReceipt.addItem(item)
     }
    
    func subtotal(inCents: Bool = false) -> Int {
      var total = 0
      for item in currentReceipt.itemsList {
        total += item.price()
      }
      return total
    }
    
    func total() -> Receipt {
       let receipt = currentReceipt
       currentReceipt = Receipt() // Reset for new transaction
       return receipt
     }
    
}

class Store {
    let version = "0.1"
    func helloWorld() -> String {
        return "Hello world"
    }
}

