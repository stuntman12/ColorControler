

import UIKit

final class ViewController: UIViewController {

    //MARK: - Outlet
    
    @IBOutlet weak var viewColor: UIView!
    
    @IBOutlet weak var labelNameColorGreen: UILabel!
    @IBOutlet weak var labelNameColorBlue: UILabel!
    @IBOutlet weak var labelNameColorRed: UILabel!
    
    @IBOutlet weak var labelValueSliderGreen: UILabel!
    @IBOutlet weak var labelValueSliderBlue: UILabel!
    @IBOutlet weak var labelValueSliderRed: UILabel!
    
    @IBOutlet weak var sliderGreen: UISlider!
    @IBOutlet weak var sliderBlue: UISlider!
    @IBOutlet weak var sliderRed: UISlider!
    
    //MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewColor()
        setupNameLabel()
        setupValueLabel()
    }

    @IBAction func actionSliderGreen() {
        labelValueSliderGreen.text = String(format: "%.2f", sliderGreen.value)
        actionSlider()
    }
    
    @IBAction func actionSliderBlue() {
        labelValueSliderBlue.text = String(format: "%.2f", sliderBlue.value)
        actionSlider()
    }
    
    @IBAction func actionSliderRed() {
        labelValueSliderRed.text = String(format: "%.2f", sliderRed.value)
        actionSlider()
    }
}

    //MARK: - SettingView

extension ViewController {
    private func setupViewColor() {
        viewColor.layer.cornerRadius = viewColor.frame.width / 5
    }
    
    private func setupNameLabel() {
        labelNameColorGreen.text = "Green"
        labelNameColorBlue.text = "Blue"
        labelNameColorRed.text = "Red"
    }
    
    private func setupValueLabel() {
        labelValueSliderGreen.text = String(format: "%.2f", sliderGreen.value)
        labelValueSliderBlue.text = String(format: "%.2f", sliderBlue.value)
        labelValueSliderRed.text = String(format: "%.2f", sliderRed.value)
    }
    
    //MARK: - ActionSlider
    private func actionSlider() {
        viewColor.backgroundColor = .init(red: CGFloat(sliderRed.value), green: CGFloat(sliderGreen.value), blue: CGFloat(sliderBlue.value), alpha: 1)
    }
}


