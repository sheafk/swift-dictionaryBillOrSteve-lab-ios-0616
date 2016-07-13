//  ViewController.swift
//  BillOrSteve
//  Created by James Campagno on 6/8/16.
//  Copyright © 2016 Flatiron School. All rights reserved.

import UIKit

class ViewController: UIViewController {
    
    //These are the outlets that will be used to control buttons and labels on the Interface.
    @IBOutlet weak var factLabel: UILabel!
    @IBOutlet weak var steveButton: UIButton!
    @IBOutlet weak var billButton: UIButton!
    @IBOutlet weak var scoreCounter: UILabel!
    
    var person: String = ""
    var actualFact: String = ""
    var counter: Int = 0
    var facts: [String : [String]] = [:]

    
    //When Bill or Steve is tapped, one of these will do something.
    @IBAction func steveTapped(sender: AnyObject) {
        
        if person == "Steve Jobs" {
            counter += 1
            scoreCounter.text = String(counter)
            factLabel.text = "Correct!"
        }
        showFact()
    }
    
    @IBAction func billTapped(sender: AnyObject) {
        
        if person == "Bill Gates" {
            counter += 1
            scoreCounter.text = String(counter)
        }
        showFact()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createFacts()//This func populates 2 arrays with facts about Steve & Bill
        getRandomFact()//This generates a random fact
        showFact()//This will show that random fact on the interface.
    }
    
    //This function will make two arrays of facts and add them to a dictionary called facts
    func createFacts() {
        
        let steveJobsFacts = ["He took a calligraphy course, which he says was instrumental in the future company products' attention to typography and font.", "Shortly after being shooed out of his company, he applied to fly on the Space Shuttle as a civilian astronaut (he was rejected) and even considered starting a computer company in the Soviet Union.", "He actually served as a mentor for Google founders Sergey Brin and Larry Page, even sharing some of his advisers with the Google duo.", "He was a pescetarian, meaning he ate no meat except for fish."]
        
        let billGatesFacts = ["He aimed to become a millionaire by the age of 30. However, he became a billionaire at 31.", "He scored 1590 (out of 1600) on his SATs.", "His foundation spends more on global health each year than the United Nation's World Health Organization.", "The private school he attended as a child was one of the only schools in the US with a computer. The first program he ever used was a tic-tac-toe game.", "In 1994, he was asked by a TV interviewer if he could jump over a chair from a standing position. He promptly took the challenge and leapt over the chair like a boss."]
        
        facts.updateValue(billGatesFacts, forKey: "Bill Gates")
        facts.updateValue(steveJobsFacts, forKey: "Steve Jobs")

    }

    func randomNumberFromZeroTo(number: Int) -> Int {
        return Int(arc4random_uniform(UInt32(number)))
    }
    
    func randomPerson() -> String {
        let randomNumber = arc4random_uniform(2)
        
        if randomNumber == 0 {
            return "Steve Jobs"
        } else {
            return "Bill Gates"
        }
    }
    //Random Fact will be generated here
    func getRandomFact() -> (name: String, funFact: String) {
        
        let steveOrBill = randomPerson()
        let funFactArray = facts[steveOrBill] //Note this is a array of strings optional!
        var factString = String()
        
        if let funFactArray = funFactArray {
            
            factString = funFactArray[randomNumberFromZeroTo(funFactArray.count)]
        
        }
        return (steveOrBill, factString)
    }
    //Random fact will show in the factLabel uilabel
    func showFact() {
        
        let personFactTuple = getRandomFact()
        person = personFactTuple.name
        actualFact = personFactTuple.funFact
        factLabel.text = actualFact
    }

}

