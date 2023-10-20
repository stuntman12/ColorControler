import UIKit

//MARK: - ViewController
final class BackgroundViewController: UIViewController {
    
    //MARK: - Override func
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingColorViewController else { return }
        settingVC.delegate = self
        settingVC.color = view.backgroundColor
    }
    
    //MARK: - IBAction
    @IBAction func unwind(for segue: UIStoryboardSegue) {
    }
}

//MARK: - Delegate
extension BackgroundViewController: SettingColorViewControllerDelegate {
    func sendColor(_ color: UIColor) {
        let colorCI = CIColor(color: color)
        view.backgroundColor = .init(ciColor: CIColor(red: colorCI.red, 
                                                      green: colorCI.green,
                                                      blue: colorCI.blue))
    }
}
    
