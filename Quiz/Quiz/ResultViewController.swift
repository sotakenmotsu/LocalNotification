//
//  ResultViewController.swift
//  Quiz
//
//  Created by 剱物蒼太 on 2017/01/04.
//  Copyright © 2017年 剱物蒼太. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var correctAnswer: Int = 0
    
    @IBOutlet var resultLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.text = String(correctAnswer)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func back() {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
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
