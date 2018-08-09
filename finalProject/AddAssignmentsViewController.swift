//
//  AddAssignmentsViewController.swift
//  finalProject
//
//  Created by London Bielicke on 8/9/18.
//  Copyright © 2018 London Bielicke. All rights reserved.
//

import UIKit

class AddAssignmentsViewController: UIViewController {

    var previousVC = HomeworkChecklistTableViewController()

    @IBOutlet weak var dueSoonInput: UISwitch!

    @IBOutlet weak var assignmentsInput: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    @IBAction func SubmitButtonTapped(_ sender: Any) {
//        let assignment = HomeworkChecklist()
//
//        if let titleText = assignmentsInput.text {
//            assignment.name = titleText
//            assignment.dueSoon = dueSoonInput.isOn
//
//            previousVC.homework.append(assignment)
//            previousVC.tableView.reloadData()
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            let assignment = AssignmentCD(entity: AssignmentCD.entity(), insertInto: context)
            
            if let titleText = assignmentsInput.text {
                assignment.assignment = titleText
                assignment.dueSoon = dueSoonInput.isOn
            }
            
            try? context.save()
            navigationController?.popViewController(animated: true)
        }





















    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
