//
//  ViewController.swift
//  BootsoBaskets
//
//  Created by William Brannock on 5/24/19.
//  Copyright © 2019 William Brannock. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Other Variables Needed to track info
    var totalShot3: Int = 0
    var totalMade3: Int = 0
    var totalShot2: Int = 0
    var totalMade2: Int = 0
    var totalMade: Int = 0
    var totalShot: Int = 0
    
    //Setup Points label
    @IBOutlet weak var pointsLabel: UILabel!
    var totalPoints: Int = 0 {
        didSet {
            pointsLabel.text =  "Points: " + "\(totalPoints)"
        }
    }
    
    //Setup FG% Label
    @IBOutlet weak var fgLabel: UILabel!
    var shootingPercent: Double = 0 {
        didSet {
            fgLabel.text = "FG%: " + String(format: "%.2f", shootingPercent)
        }
    }
    
    //Setup eFG Label
    @IBOutlet weak var eFGLabel: UILabel!
    var eshootingPercent: Double = 0 {
        didSet {
            eFGLabel.text = "eFG%: " + String(format: "%.2f", eshootingPercent)
        }
    }
    
    //Setup Assist Label
    @IBOutlet weak var assistLabel: UILabel!
    var totalAssists: Int = 0 {
        didSet {
            assistLabel.text =  "Assists: " + "\(totalAssists)"
        }
    }
    
    //Setup Turnover Label
    @IBOutlet weak var turnoverLabel: UILabel!
    var totalTurnovers: Int = 0 {
        didSet {
            turnoverLabel.text =  "Turnovers: " + "\(totalTurnovers)"
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Initalize all variables at runtime
        totalShot3 =  0
        totalMade3 = 0
        totalShot2 = 0
        totalMade2 = 0
        totalMade = 0
        totalShot = 0
        totalPoints = 0
        shootingPercent = 0.0
        eshootingPercent = 0.0
        totalAssists = 0
        totalTurnovers = 0
        
    }
    
    //Manages Three Point Attempt
    @IBAction func threeAttemptButton(_ sender: Any) {
        let actionSheet = UIAlertController(title: "3-Point Shot Attempt", message: "Was the Shot Made or Missed?", preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let make = UIAlertAction(title: "Make", style: .default) { action in
            self.totalPoints += 3
            self.totalShot += 1
            self.totalMade += 1
            self.totalShot3 += 1
            self.totalMade3 += 1
            let curr: Double = Double(self.totalMade) / Double(self.totalShot) * 100
            self.shootingPercent = curr
            let ef: Double = (Double(self.totalMade) + 0.5 * Double(self.totalMade3)) / Double(self.totalShot)
            self.eshootingPercent = ef * 100
        }
        let miss = UIAlertAction(title: "Miss", style: .default) { action in
            self.totalShot += 1
            self.totalShot3 += 1
            let curr: Double = Double(self.totalMade) / Double(self.totalShot) * 100
            self.shootingPercent = curr
            let ef: Double = (Double(self.totalMade) + 0.5 * Double(self.totalMade3)) / Double(self.totalShot)
            self.eshootingPercent = ef * 100
            
        }
        
        actionSheet.addAction(make)
        actionSheet.addAction(cancel)
        actionSheet.addAction(miss)
        present(actionSheet, animated: true, completion: nil)
    }
    
    
    //Manages Two Point Attempt
    
    @IBAction func twoAttemptButton(_ sender: Any) {
        let actionSheet = UIAlertController(title: "2-Point Shot Attempt", message: "Was the Shot Made or Missed?", preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let make = UIAlertAction(title: "Make", style: .default) { action in
            self.totalPoints += 2
            self.totalShot += 1
            self.totalMade += 1
            self.totalShot2 += 1
            self.totalMade2 += 1
            let curr: Double = Double(self.totalMade) / Double(self.totalShot) * 100
            self.shootingPercent = curr
            let ef: Double = (Double(self.totalMade) + 0.5 * Double(self.totalMade3)) / Double(self.totalShot)
            self.eshootingPercent = ef * 100
        }
        let miss = UIAlertAction(title: "Miss", style: .default) { action in
            self.totalShot += 1
            self.totalShot2 += 1
            let curr: Double = Double(self.totalMade) / Double(self.totalShot) * 100
            self.shootingPercent = curr
            let ef: Double = (Double(self.totalMade) + 0.5 * Double(self.totalMade3)) / Double(self.totalShot)
            self.eshootingPercent = ef * 100
            
        }
        
        actionSheet.addAction(make)
        actionSheet.addAction(cancel)
        actionSheet.addAction(miss)
        present(actionSheet, animated: true, completion: nil)
    }
    
    //Manages Free Throw Attempt
    @IBAction func ffAttemptButton(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Free Throw Attempt", message: "Was the Shot Made or Missed?", preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        let make = UIAlertAction(title: "Make", style: .default) { action in
            self.totalPoints += 1

            
        }
        let miss = UIAlertAction(title: "Miss", style: .default) { action in
            
            
        }
        
        actionSheet.addAction(make)
        actionSheet.addAction(cancel)
        actionSheet.addAction(miss)
        present(actionSheet, animated: true, completion: nil)
    }
    
    //Manages Assist Button
    @IBAction func assistButton(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Assist", message: "Confirm the Assist?", preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        let make = UIAlertAction(title: "Yes", style: .default) { action in
            self.totalAssists += 1
        }
        
        
        actionSheet.addAction(make)
        actionSheet.addAction(cancel)
        present(actionSheet, animated: true, completion: nil)
        
        
    }
    
    //Manages Turnover Button
    
    @IBAction func turnoverButton(_ sender: Any) {
        let actionSheet = UIAlertController(title: "Turnover", message: "Confirm the Turnover?", preferredStyle: .actionSheet)
        
        let cancel = UIAlertAction(title: "No", style: .cancel, handler: nil)
        
        let make = UIAlertAction(title: "Yes", style: .default) { action in
            self.totalTurnovers += 1
        }
        
        
        actionSheet.addAction(make)
        actionSheet.addAction(cancel)
        present(actionSheet, animated: true, completion: nil)
    }
    
    //Manages About Screen
    @IBAction func aboutButton(_ sender: Any) {
        let alertController = UIAlertController(title: "About BBaskets", message:
            "Bootso Baskets 1.1\n Created in Virginia by William Brannock\n www.williambrannock.com", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    //Manages Reset BScreen
    @IBAction func resetButton(_ sender: Any) {
        totalShot3 =  0
        totalMade3 = 0
        totalShot2 = 0
        totalMade2 = 0
        totalMade = 0
        totalShot = 0
        totalPoints = 0
        shootingPercent = 0.0
        eshootingPercent = 0.0
        totalAssists = 0
        totalTurnovers = 0
        
    }
    
    //Manages Save Ability
    @IBAction func saveButton(_ sender: Any) {
        //UIPasteboard.general.string = pointsLabel.text
        let text = pointsLabel.text! + "\n" + fgLabel.text! + "\n" + turnoverLabel.text!
        
        // set up activity view controller
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        // exclude some activity types from the list (optional)
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
    }
    
        
        
    
    

}

