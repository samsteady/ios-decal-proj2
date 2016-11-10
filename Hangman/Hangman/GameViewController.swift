//
//  GameViewController.swift
//  Hangman
//
//  Created by Samuel Steady on 10/30/16.
//  Copyright © 2016 Samuel Steady. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    /// keyboard UIButton variables used for iterating over
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

    
    /// array initialized by viewDidLoad of all keyboard buttons
    var buttons = [UIButton]()
    
    /// UILabel with user's currently guessed letters
    /// and "_" where unguessed letters are
    @IBOutlet weak var guessLabel: UILabel!
    
    /// phrase used for current Hangman session, initialized by initializeGame().
    var phrase: String = ""
    
    /// array of what letters have been tried as alphabeticly
    /// increasing array indices from 0 to 25, initialized by initializeGame().
    var triedLetters = [Bool]()
    
    /// array of text displayed in UILabel guessLabel as String character array.
    var guessLabelText = [String]()
    
    /// color of keyboard keys guessed incorrectly
    let wrongColor = UIColor(red: 206/255, green: 90/255, blue: 55/255, alpha: 1)
    
    /// color of keyboard keys guessed correctly
    let rightColor = UIColor(red: 88/255, green: 163/255, blue: 109/255, alpha: 1)
    
    /// color of phrase when all letters guessed correctly.
    let correctPhraseColor = UIColor(red: 4/255, green: 145/255, blue: 34/255, alpha: 1)
    
    /// how many wrong guesses so far
    var numWrongGuesses = 0
    
    
    /// image view for Hangman graphics
    @IBOutlet weak var graphicsImageView: UIImageView!
    
    /// boolean used to set keyboard to inactive while waiting for
    /// 1 second delayed "play again" alert prompt
    var keyboardActive = true

    
    /// keyboard button actions. Each calls checkLetters
    /// with appropriate args to check that letter.
    /// - parameter sender: UIButton corresponding to keyboard button pressed
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
    
    
    /// checks if letter is in word
    ///
    /// - parameter button: keyboard button guessed
    /// - parameter index:  index of keyboard button in triedLetters array
    /// - parameter letter: String representation of letter
    func checkLetter(button: UIButton, index: Int, letter: String) {
        if keyboardActive && !triedLetters[index] {
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
                    gameWon()
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
                    gameLost()
                    break
                default: break
                    
                }
            }
            
        }
    }

    
    /// checks if game is won but not if game is lost.
    ///
    /// - returns: boolean true if game is won else false if game is still going
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
    
    
    /// displays guessLabel with correctly-guessed phase in green.
    /// delays for one second so user can read word, then prompts to play again.
    func gameWon() {
        let attributedString = NSMutableAttributedString(string: phrase)
        let range = NSRange(location: 0, length: guessLabelText.count)
        attributedString.addAttribute(NSKernAttributeName, value: CGFloat(10), range: range)
        attributedString.addAttribute(NSForegroundColorAttributeName, value: correctPhraseColor, range: range)
        guessLabel.attributedText! = attributedString
        let when = DispatchTime.now() + 0.09*Double((String(phrase).characters.count))
        keyboardActive = true
        DispatchQueue.main.asyncAfter(deadline: when) {
            let alertController = UIAlertController(title: "Game Won!", message: "Do You Want to Play Again?", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                self.initializeGame()
            }))
            self.present(alertController, animated: true, completion: nil)
            self.keyboardActive = true
        }
    }
    
    
    /// displays guessLabel with missing letters in red.
    /// delays for one second so user can read word, then prompts to play again.
    func gameLost() {
        let attributedString = NSMutableAttributedString(string: phrase)
        for i in 0...phrase.characters.count-1 {
            if guessLabelText[i] == "_" {
                let range = NSRange(location:i,length:1)
                attributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.red, range: range)
            }
        }
        attributedString.addAttribute(NSKernAttributeName, value: CGFloat(10), range: NSRange(location: 0, length: guessLabelText.count))
        guessLabel.attributedText! = attributedString
        let when = DispatchTime.now() + 0.09*Double((String(phrase).characters.count))
        keyboardActive = false
        DispatchQueue.main.asyncAfter(deadline: when) {
            let alertController = UIAlertController(title: "Game Lost", message: "Do You Want to Play Again?", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
                self.initializeGame()
            }))
            self.present(alertController, animated: true, completion: nil)
            self.keyboardActive = true
        }
    }
    
    /// sets up new round of Hangman
    func initializeGame() {
        numWrongGuesses = 0
        triedLetters = [false,false,false,false,false,false,false,false,false,false,false,
                        false,false,false,false,false,false,false,false,false,false,false,false,false,false,false]
        graphicsImageView.image = UIImage(named: "noose-01.png")
        for i in 0...25 {
            buttons[i].backgroundColor = UIColor.darkGray
        }
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
        print(phrase)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons = [Q, W, E, R, T, Y, U, I, O, P,
                   A, S, D, F, G, H, J, K, L,
                   Z, X, C, V, B, N, M]
        initializeGame()
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
