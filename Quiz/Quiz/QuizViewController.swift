//
//  QuizViewController.swift
//  Quiz
//
//  Created by 剱物蒼太 on 2017/01/04.
//  Copyright © 2017年 剱物蒼太. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var quizArray = [AnyObject]()
    
    var correctAnswer: Int = 0
    
    @IBOutlet var quizTextView: UITextView!
    
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButoon3: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var tmpArray = [Any]()
        
        tmpArray.append(["問題文１","選択肢","選択肢２","選択肢３",1])
        tmpArray.append(["問題文２","選択肢","選択肢２","選択肢３",2])
        tmpArray.append(["問題文３","選択肢","選択肢２","選択肢３",3])
        tmpArray.append(["問題文４","選択肢","選択肢２","選択肢３",1])
        tmpArray.append(["問題文５","選択肢","選択肢２","選択肢３",2])
        tmpArray.append(["問題文６","選択肢","選択肢２","選択肢３",3])
        
        srandom(UInt32(time(nil)))
        while (tmpArray.count > 0) {
            let index = Int(arc4random_uniform(UInt32(tmpArray.count)))
            quizArray.append(tmpArray[index] as AnyObject)
            tmpArray.remove(at: index)
        }
        choiceQuiz()



        // Do any additional setup after loading the view.
    }
    
    func choiceQuiz() {
        
        quizTextView.text = quizArray[0][0] as? String
        
        choiceButton1.setTitle(quizArray[0][1] as? String, for: .normal)
        choiceButton2.setTitle(quizArray[0][2] as? String, for: .normal)
        choiceButoon3.setTitle(quizArray[0][3] as? String, for: .normal)
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        if quizArray[0][4] as! Int == sender.tag {
            correctAnswer = correctAnswer + 1
        }
        quizArray.remove(at: (0))
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.correctAnswer = self.correctAnswer
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
