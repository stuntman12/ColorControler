

import UIKit

protocol SettingColorViewControllerDelegate: AnyObject {
    func sendColor(_ color: UIColor)
}

//MARK: - ViewController

final class SettingColorViewController: UIViewController {
    
    //MARK: - Outlet
    
    @IBOutlet weak var viewColor: UIView!
    
    @IBOutlet weak var labelValueSliderGreen: UILabel!
    @IBOutlet weak var labelValueSliderBlue: UILabel!
    @IBOutlet weak var labelValueSliderRed: UILabel!
    
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    @IBOutlet weak var sliderRed: UISlider!
    
        
    @IBOutlet weak var textFDGreen: UITextField!
    
    @IBOutlet weak var textFDBlue: UITextField!
    
    @IBOutlet weak var textFDRed: UITextField!
    weak var delegate: SettingColorViewControllerDelegate!
    
    var color: UIColor!
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textFDRed.delegate = self
        textFDBlue.delegate = self
        textFDGreen.delegate = self
        setupViewSlider()
        setupValueLabel()
        actionSlider()
    }
    
    //MARK: - ActionIBAction
    
    @IBAction func buttonDone(_ sender: UIBarButtonItem) {
        view.endEditing(true)
        dismiss(animated: true)
    }
    
    @IBAction func actionSlider(_ sender: UISlider) {
        if sender.tag == 0 {
            labelValueSliderGreen.text = String(format: "%.2f", sliderGreen.value)
        } else if sender.tag == 1 {
            labelValueSliderBlue.text = String(format: "%.2f", sliderBlue.value)
        } else if sender.tag == 2 {
            labelValueSliderRed.text = String(format: "%.2f", sliderRed.value)
        }
        actionSlider()
    }
}

//MARK: - SettingView

extension SettingColorViewController: UITextFieldDelegate {
    
    private func setupValueLabel() {
        labelValueSliderGreen.text = String(format: "%.2f", sliderGreen.value)
        labelValueSliderBlue.text = String(format: "%.2f", sliderBlue.value)
        labelValueSliderRed.text = String(format: "%.2f", sliderRed.value)
    }
    
    private func setupViewSlider() {
        let ciColor = CIColor(color: color)
        sliderGreen.value = Float(ciColor.green)
        sliderRed.value = Float(ciColor.red)
        sliderBlue.value = Float(ciColor.blue)
    }
    
    //MARK: - ActionSlider
    private func actionSlider() {
        viewColor.backgroundColor = .init(red: CGFloat(sliderRed.value),
                                          green: CGFloat(sliderGreen.value),
                                          blue: CGFloat(sliderBlue.value),
                                          alpha: 1)
        delegate.sendColor(viewColor.backgroundColor!)
    }
    
    //MARK: - DelegateTextField
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let number = textField.text else { return }
        guard let floatNumber = Float(number) else { showAlert(title: "Ошибка", message: "Введите число"); return }
        if textField == textFDRed {
            sliderRed.value = floatNumber / 100
        } else if textField == textFDBlue {
            sliderBlue.value = floatNumber / 100
        } else if textField == textFDGreen {
            sliderGreen.value = floatNumber / 100
        }
        actionSlider()
        setupValueLabel()
    }
    
    func showAlert(title: String, message: String) {
        let alert =  UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertButton = UIAlertAction(title: "Ок", style: .default)
        alert.addAction(alertButton)
        present(alert, animated: true)
    }
}




