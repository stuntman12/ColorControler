

import UIKit

protocol SettingColorViewControllerDelegate: AnyObject {
    func sendColor(_ color: UIColor)
}

//MARK: - ViewController

final class SettingColorViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: - Outlet
    
    @IBOutlet weak var viewColor: UIView!
    
    @IBOutlet weak var labelValueSliderGreen: UILabel!
    @IBOutlet weak var labelValueSliderBlue: UILabel!
    @IBOutlet weak var labelValueSliderRed: UILabel!
    
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    @IBOutlet weak var sliderRed: UISlider!
    
    
    @IBOutlet var textFD: [UITextField]!
    
    weak var delegate: SettingColorViewControllerDelegate!
    
    var color: UIColor!
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewSlider()
        setupValueLabel()
        actionSlider()
        textFD.forEach { $0.delegate = self }
    }
    
    //MARK: - ActionIBAction
    
    @IBAction func ActionSlider(_ sender: UISlider) {
        if sender.tag == 0 {
            labelValueSliderGreen.text = String(format: "%.2f", sliderGreen.value)
            actionSlider()
        } else if sender.tag == 1 {
            labelValueSliderBlue.text = String(format: "%.2f", sliderBlue.value)
            actionSlider()
        } else if sender.tag == 2 {
            labelValueSliderRed.text = String(format: "%.2f", sliderRed.value)
            actionSlider()
        }
    }
}

//MARK: - SettingView

extension SettingColorViewController {
    
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






