//
//  GameLostViewController.swift
//  Hangman
//
//  Created by Sam Steady on 11/6/16.
//  Copyright © 2016 Sam Steady. All rights reserved.
//

import UIKit

class GameLostViewController: UIViewController {
    let phrase = ""
    let guess = ""

    @IBAction func playAgain(_ sender: AnyObject) {
        _ = navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
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
