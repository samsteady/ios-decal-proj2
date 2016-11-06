//
//  GameViewController.swift
//  Hangman
//
//  Created by Shawn D'Souza on 3/3/16.
//  Copyright © 2016 Shawn D'Souza. All rights reserved.
//

import UIKit

extension UILabel{
    func addTextSpacing(spacing: CGFloat){
        let attributedString = NSMutableAttributedString(string: self.text!)
        attributedString.addAttribute(NSKernAttributeName, value: spacing, range: NSRange(location: 0, length: self.text!.characters.count))
        self.attributedText = attributedString
    }
}

class GameViewController: UIViewController {
    var phrase: String = ""
    
    var triedLetters = [false,false,false,false,false,false,false,false,false,false,false,
    false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
    
    
    @IBAction func pressedQ(_ sender: UIButton) {
        checkLetter(button: sender, index: 0, letter: "Q")
    }
    @IBAction func pressedW(_ sender: UIButton) {
        checkLetter(button: sender, index: 1, letter: "W")
    }
    @IBAction func pressedE(_ sender: UIButton) {
        checkLetter(button: sender, index: 2, letter: "E")
    }
    @IBAction func pressedR(_ sender: UIButton) {
        checkLetter(button: sender, index: 3, letter: "R")
    }
    @IBAction func pressedT(_ sender: UIButton) {
        checkLetter(button: sender, index: 4, letter: "T")
    }
    @IBAction func pressedU(_ sender: UIButton) {
        checkLetter(button: sender, index: 6, letter: "U")
    }
    @IBAction func pressedY(_ sender: UIButton) {
        checkLetter(button: sender, index: 5, letter: "Y")
    }
    @IBAction func pressedO(_ sender: UIButton) {
        checkLetter(button: sender, index: 8, letter: "O")
    }
    @IBAction func pressedI(_ sender: UIButton) {
        checkLetter(button: sender, index: 7, letter: "I")
    }
    @IBAction func pressedP(_ sender: UIButton) {
        checkLetter(button: sender, index: 9, letter: "P")
    }
    @IBAction func pressedA(_ sender: UIButton) {
        checkLetter(button: sender, index: 10, letter: "A")
    }
    @IBAction func pressedL(_ sender: UIButton) {
        checkLetter(button: sender, index: 18, letter: "L")
    }
    @IBAction func pressedS(_ sender: UIButton) {
        checkLetter(button: sender, index: 11, letter: "S")
    }
    @IBAction func pressedD(_ sender: UIButton) {
        checkLetter(button: sender, index: 12, letter: "D")
    }
    @IBAction func pressedF(_ sender: UIButton) {
        checkLetter(button: sender, index: 13, letter: "F")
    }
    @IBAction func pressedG(_ sender: UIButton) {
        checkLetter(button: sender, index: 14, letter: "G")
    }
    @IBAction func pressedH(_ sender: UIButton) {
        checkLetter(button: sender, index: 15, letter: "H")
    }
    @IBAction func pressedJ(_ sender: UIButton) {
        checkLetter(button: sender, index: 16, letter: "J")
    }
    @IBAction func pressedK(_ sender: UIButton) {
        checkLetter(button: sender, index: 17, letter: "K")
    }
    @IBAction func pressedZ(_ sender: UIButton) {
        checkLetter(button: sender, index: 19, letter: "Z")
    }
    @IBAction func pressedM(_ sender: UIButton) {
        checkLetter(button: sender, index: 25, letter: "M")
    }
    @IBAction func pressedX(_ sender: UIButton) {
        checkLetter(button: sender, index: 20, letter: "X")
    }
    @IBAction func pressedC(_ sender: UIButton) {
        checkLetter(button: sender, index: 21, letter: "C")
    }
    @IBAction func pressedV(_ sender: UIButton) {
        checkLetter(button: sender, index: 22, letter: "V")
    }
    @IBAction func pressedB(_ sender: UIButton) {
        checkLetter(button: sender, index: 23, letter: "B")
    }
    @IBAction func pressedN(_ sender: UIButton) {
        checkLetter(button: sender, index: 24, letter: "N")
    }
    @IBOutlet weak var guessLabel: UILabel!
    @IBOutlet weak var hangmanImage: UIImageView!
    
    var guessLabelText = [String]()
    
    let wrongColor = UIColor(red: 206/255, green: 90/255, blue: 55/255, alpha: 1)
    let rightColor = UIColor(red: 88/255, green: 163/255, blue: 109/255, alpha: 1)
    
    
    func checkLetter(button: UIButton, index: Int, letter: String) {
        if !triedLetters[index] {
            print(letter)
            var i = 0
            var correctGuess = false
            for char in phrase.characters {
                if String(char) == letter {
                    guessLabelText[i] = letter
                    correctGuess = true
                }
                i += 1
            }
            let attributedString = NSMutableAttributedString(string: guessLabelText.joined(separator: ""))
            attributedString.addAttribute(NSKernAttributeName, value: CGFloat(10), range: NSRange(location: 0, length: guessLabelText.count))
            guessLabel.attributedText! = attributedString
            triedLetters[index] = true
            if correctGuess {
                button.backgroundColor = rightColor
            } else {
                button.backgroundColor = wrongColor
            }
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let hangmanPhrases = HangmanPhrases()
        phrase = hangmanPhrases.getRandomPhrase()
        guessLabelText = [String]()
        for char in phrase.characters {
            if char != " " {
                guessLabelText.append("_")
            } else {
                guessLabelText.append(" ")
            }
        }
        let attributedString = NSMutableAttributedString(string: guessLabelText.joined(separator: ""))
        attributedString.addAttribute(NSKernAttributeName, value: CGFloat(10), range: NSRange(location: 0, length: guessLabelText.count))
        guessLabel.attributedText! = attributedString
        print("this is the phrase")
        print(phrase)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
