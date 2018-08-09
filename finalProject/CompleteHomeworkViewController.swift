//
//  CompleteHomeworkViewController.swift
//  finalProject
//
//  Created by London Bielicke on 8/9/18.
//  Copyright © 2018 London Bielicke. All rights reserved.
//

import UIKit

class CompleteHomeworkViewController: UIViewController, UINavigationControllerDelegate {

    var previousVC = HomeworkChecklistTableViewController()
    var selectedAssignment : AssignmentCD?
    
    @IBOutlet weak var assignmentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assignmentLabel.text = selectedAssignment?.assignment

    }

    @IBAction func completeButton(_ sender: Any) {
        if let context =  (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let theAssignment = selectedAssignment {
                context.delete(theAssignment)
                navigationController?.popViewController(animated: true)
            }
        }
    }
}
