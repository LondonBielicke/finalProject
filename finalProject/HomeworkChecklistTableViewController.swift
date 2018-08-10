//
//  HomeworkChecklistTableViewController.swift
//  finalProject
//
//  Created by London Bielicke on 8/8/18.
//  Copyright © 2018 London Bielicke. All rights reserved.
//

import UIKit

class HomeworkChecklistTableViewController: UITableViewController {

    var homework : [AssignmentCD] = []

//    func createAssignments() -> [HomeworkChecklist] {
//
//        let math = HomeworkChecklist()
//        math.name = "do math hw"
//        math.dueSoon = true
//
//        let english = HomeworkChecklist()
//        english.name = "write essay"
//
//        return[math, english]
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getAssignments()
    }
    
    func getAssignments() {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            if let coreDataAssignments = try? context.fetch(AssignmentCD.fetchRequest()) as? [AssignmentCD] {
                if let theAssignments = coreDataAssignments {
                    homework = theAssignments
                    tableView.reloadData()
                }
            }
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homework.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let assignment = homework[indexPath.row]
        
        if let name = assignment.assignment {
            if assignment.dueSoon {
                cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 17.0)
                cell.textLabel?.text =  name
            } else {
                cell.textLabel?.text = assignment.assignment
            }
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let assignment = homework[indexPath.row]
        
        performSegue(withIdentifier: "moveToComplete", sender: assignment)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddAssignmentsViewController {
            addVC.previousVC = self
        }
        if let completeVC = segue.destination as? CompleteHomeworkViewController {
            if let assignment = sender as? AssignmentCD {
                completeVC.selectedAssignment = assignment
                completeVC.previousVC = self
            }
        }
    }
}
