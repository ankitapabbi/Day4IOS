//
//  DisplayArrayViewController.swift
//  Day4IOS
//
//  Created by Ankita Pabbi on 2019-07-03.
//  Copyright © 2019 Ankita Pabbi. All rights reserved.
//

import UIKit

class DisplayArrayViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
   
   
    

    @IBOutlet weak var tblCourseList: UITableView!
     var courseArray = ["Android Fundamentals", "iOS Fundamentals", "Swift Programming", "Database Design", "Programming in Java", "Web Development in PHP", "Machine Learning", "Data Analytics with R", "Learn Ruby - The Hard Way", "Data Structures in C++"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblCourseList.delegate = self
        self.tblCourseList.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.courseArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cellCourse")
        cell.textLabel?.text = self.courseArray[indexPath.row]
        return cell
    }
    override func viewWillAppear(_ animated: Bool) {
        // create UIImageView
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //Create UIImageView
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.contentMode = .scaleAspectFit
        
        //Assigne Image
        let image = UIImage(named: "book")
        imageView.image = image
        
        //Assign ImageView to titleView
        navigationItem.titleView = imageView
    }
   
}
