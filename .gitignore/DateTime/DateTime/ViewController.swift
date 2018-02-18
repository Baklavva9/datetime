//
//  ViewController.swift
//  DateTime
//
//  Created by Izati Ng on 23/12/17.
//  Copyright © 2017 bklv. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var cityField: UITextField!
    
    // Budget section
    
    @IBOutlet var budgetLabel: UILabel!
    @IBOutlet var expenseLabel: UILabel!
    @IBOutlet var balanceLabel: UILabel!
    
    @IBOutlet var budgetTextField: UITextField!
    @IBOutlet var expenseTextField: UITextField!
    
    @IBAction func Calculate(sender: UIButton) {
        var a = (budgetTextField.text as! NSString).floatValue
        var b = (expenseTextField.text as! NSString).floatValue
        var balance = a - b
    
        balanceLabel.text = "\(balance)"
    }
    

     // Date picker for expense entry
        
        @IBOutlet var dateTextField: UITextField!
        let picker = UIDatePicker()
    
    
    // NSDate to a String
        let date = NSDate()
        let dateFormatter = DateFormatter()
    
//        dateFormatter.dateFormat = "dd-MM-yyyy"
//        timeLabel.text = dateFormatter.string(from: date as Date)
    
//      dateFormatter.dateFormat = "dd-MM-yyyy"
//      timeLabel.text = dateFormatter.string(from: date as Date)
    //  let stringDate = dateFormatter.string(from: date as Date)
     
        
    //   print(stringDate)
        
//        //String to a NSDate
//        let dateString = "20/03/2016"
//        dateFormatter.dateFormat = "dd/MM/yyyy"
//        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0.00")
//        let dateFromString = dateFormatter.date(from: dateString)
//        print(dateFromString)
        
        // NSDate GMT +0
        // Your local iOS Timezone
    
    // UIPickerView for category selection
    
 
    let cities = ["Food", "Petrol", "Sailing Club", "Travel", "MBA", "Books"]
   
    var pickerView = UIPickerView()
        

    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        cityField.inputView = pickerView
        cityField.textAlignment = .center
        cityField.placeholder = "Select Category"
        
        // realtime date projection below navigator
        dateFormatter.dateFormat = "dd-MM-yyyy"
        timeLabel.text = dateFormatter.string(from: date as Date)
        
        // Date picker to appear
        createDatePicker()
        
        // declaring UITextField delegate, for keypad to appear
        
        budgetTextField.delegate = self
        expenseTextField.delegate = self
        
        
        }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    

    // UIPickerView for Category
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return cities.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return cities[row]
    
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    cityField.text = cities[row]
    cityField.resignFirstResponder()
    
    }
    
    // UIDatePicker
    
    func createDatePicker() {
    
        // toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // done button for toolbar
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([done], animated: false)
        
        dateTextField.inputAccessoryView = toolbar
        dateTextField.inputView = picker

        // format picker for date
        picker.datePickerMode = .date
        
    }

@objc func donePressed() {
    // format date
    
    let formatter = DateFormatter()
    formatter.dateStyle = .long
    formatter.timeStyle = .none
    let dateString = formatter.string(from: picker.date)
    
    dateTextField.text = "\(dateString)"
    self.view.endEditing(true)
 }

}



























