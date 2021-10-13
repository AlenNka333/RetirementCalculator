//
//  ViewController.swift
//  RetirementCalculator
//
//  Created by Alena Nesterkina on 12.10.21.
//

import UIKit
import AppCenterAnalytics
import AppCenterCrashes

class ViewController: UIViewController {

    @IBOutlet weak var monthlyInvestmentTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var retirementAgeTextField: UITextField!
    @IBOutlet weak var interestAgeTextField: UITextField!
    @IBOutlet weak var savingsTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if Crashes.hasCrashedInLastSession {
            let alert = UIAlertController(title: "Oooops", message: "Sorry about that, an error occured", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }

    @IBAction func calculateResult(_ sender: UIButton) {
        let current_age: Int? = Int(ageTextField.text!)
        let planned_retirement_age: Int? = Int(retirementAgeTextField.text!)
        let monthly_investment: Float? = Float(monthlyInvestmentTextField.text!)
        let current_savings: Float? = Float(savingsTextField.text!)
        let interest_rate: Float? = Float(interestAgeTextField.text!)
        
        resultLabel.text = "If you save $\(monthly_investment!) every month for \(planned_retirement_age! - current_age!) years, and invest that money plus your current investment of $\(current_savings!) at a \(interest_rate!)% anual interest rate, you will have $X by the time you are \(planned_retirement_age!)"
        
        let properties = ["current_age": String(current_age!), "planned_retirement_age": String(planned_retirement_age!)]
        
        Analytics.trackEvent("calculate_amount", withProperties: properties)
    }
    
}

