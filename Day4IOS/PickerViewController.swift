//
//  ViewController.swift
//  Day4IOS
//
//  Created by Ankita Pabbi on 2019-07-03.
//  Copyright © 2019 Ankita Pabbi. All rights reserved.
//

import UIKit

enum PickerType:Int {
    case College = 0
    case Course = 1
}
class PickerViewController: UIViewController {
    

    @IBOutlet weak var lblCourseName: UILabel!
    @IBOutlet weak var lblCollegeName: UILabel!
    @IBOutlet weak var textAddCollege: UITextField!
    @IBOutlet weak var pickerCourseName: UIPickerView!
    var courseArray = ["Android Fundamentals", "iOS Fundamentals", "Swift Programming", "Database Design", "Programming in Java", "Web Development in PHP", "Machine Learning", "Data Analytics with R", "Learn Ruby - The Hard Way", "Data Structures in C++"]
    var collegeNameArray = ["Lambton","Seneca","Goerge Brown","Cestar College","Humber","Queen's College"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerCourseName.delegate = self
        self.pickerCourseName.dataSource = self
        
        self.textAddCollege.delegate = self
        
        //Do any additional setup after loading the view.
    }

   
    @IBAction func btnAddCollege(_ sender: Any) {
        if let newCollegeName = self.textAddCollege.text {
        self.collegeNameArray.append(newCollegeName)
        self.pickerCourseName.reloadAllComponents()
        }
        }
        
}
extension PickerViewController:UIPickerViewDelegate {
    // set the value for each row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        //return "\(row + 1) - \(courseArray[row])"
        if component == PickerType.Course.rawValue {
            return courseArray[row]
        }else  {// else case is for 0th component
            return collegeNameArray[row]
        }
    }
    // fetch the selected values
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        //        if component == 1{
        //            lblCourseName.text = courseArray[row]
        //        }else{// else case is for 0th component
        //            lblCollegeName.text = collegeNameArray[row]
        //        }
        //
        let strCollegeName = self.collegeNameArray[pickerView.selectedRow(inComponent: PickerType.College.rawValue)]
        let strCourseName = self.courseArray[pickerView.selectedRow(inComponent: PickerType.Course.rawValue)]
        self.lblCourseName.text = "\(strCollegeName) - \(strCourseName)"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //Create UIImageView
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        
        //Assigne Image
        let image = UIImage(named: "pencil")
        imageView.image = image
        
        //Assign ImageView to titleView
        navigationItem.titleView = imageView
    }
    
}

extension PickerViewController: UIPickerViewDataSource {
    
    // no. of components
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    // no. of items in picker view
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == PickerType.Course.rawValue {
            return courseArray.count
        }else  { // else case is for 0th component
            return collegeNameArray.count
        }
        
    }
}
extension PickerViewController:UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if !textField.text!.isEmpty{
        if textField.tag == 0{
           self.collegeNameArray.append(textField.text!)
        }else if textField.tag == 1{
            self.courseArray.append(textField.text!)
        }
       
            textField.resignFirstResponder()
           
            self.pickerCourseName.reloadComponent(textField.tag)
        }
        return true
    }
    
}


