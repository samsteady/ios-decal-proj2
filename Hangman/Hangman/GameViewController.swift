//
//  GameViewController.swift
//  Hangman
//
//  Created by Shawn D'Souza on 3/3/16.
//  Copyright © 2016 Shawn D'Souza. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    var phrase: String = ""
    
    var triedLetters = [Bool]()
    
    
    @IBOutlet weak var Q: UIButton!
    @IBOutlet weak var W: UIButton!
    @IBOutlet weak var E: UIButton!
    @IBOutlet weak var R: UIButton!
    @IBOutlet weak var T: UIButton!
    @IBOutlet weak var U: UIButton!
    @IBOutlet weak var Y: UIButton!
    @IBOutlet weak var O: UIButton!
    @IBOutlet weak var I: UIButton!
    @IBOutlet weak var P: UIButton!
    @IBOutlet weak var A: UIButton!
    @IBOutlet weak var L: UIButton!
    @IBOutlet weak var S: UIButton!
    @IBOutlet weak var D: UIButton!
    @IBOutlet weak var F: UIButton!
    @IBOutlet weak var G: UIButton!
    @IBOutlet weak var H: UIButton!
    @IBOutlet weak var J: UIButton!
    @IBOutlet weak var K: UIButton!
    @IBOutlet weak var Z: UIButton!
    @IBOutlet weak var M: UIButton!
    @IBOutlet weak var X: UIButton!
    @IBOutlet weak var C: UIButton!
    @IBOutlet weak var V: UIButton!
    @IBOutlet weak var B: UIButton!
    @IBOutlet weak var N: UIButton!
    
    var buttons = [UIButton]()
    
    
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
    
    var guessLabelText = [String]()
    
    let wrongColor = UIColor(red: 206/255, green: 90/255, blue: 55/255, alpha: 1)
    let rightColor = UIColor(red: 88/255, green: 163/255, blue: 109/255, alpha: 1)
    
    var numWrongGuesses = 0
    @IBOutlet weak var graphicsImageView: UIImageView!
    
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
                if gameIsWon() {
                    self.performSegue(withIdentifier: "wonSegue", sender: nil)
                }
            } else {
                button.backgroundColor = wrongColor
                numWrongGuesses += 1
                switch numWrongGuesses {
                case 1:
                    graphicsImageView.image = UIImage(named: "head-01.png")
                    break
                case 2:
                    graphicsImageView.image = UIImage(named: "body-01.png")
                    break
                case 3:
                    graphicsImageView.image = UIImage(named: "leftArm-01.png")
                    break
                case 4:
                    graphicsImageView.image = UIImage(named: "rightArm-01.png")
                    break
                case 5:
                    graphicsImageView.image = UIImage(named: "leftLeg-01.png")
                    break
                case 6:
                    graphicsImageView.image = UIImage(named: "rightLeg-01.png")
                    self.performSegue(withIdentifier: "lostSegue", sender: nil)
                    break
                default: break
                    
                }
            }
            
        }
    }

    func gameIsWon() -> Bool {
        var isWon = true
        for str in guessLabelText {
            if str == "_" {
                isWon = false
                break
            }
        }
        return isWon
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        numWrongGuesses = 0
        
        buttons = [Q, W, E, R, T, Y, U, I, O, P,
                A, S, D, F, G, H, J, K, L,
                Z, X, C, V, B, N, M]
        
        triedLetters = [false,false,false,false,false,false,false,false,false,false,false,
                        false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
        graphicsImageView.image = UIImage(named: "noose-01.png")
        
        for i in 0...25 {
            buttons[i].backgroundColor = UIColor.darkGray
        }

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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        viewDidLoad()
        
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
