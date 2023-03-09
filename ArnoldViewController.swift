import UIKit
import Messages

protocol ArnoldViewControllerDelegate: AnyObject {
    func arnoldViewController(_ controller: ArnoldViewController, didSendText text: String)
}

class ArnoldViewController: UIViewController {
    
    weak var delegate: ArnoldViewControllerDelegate?
    
    // MARK: - View lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - User interface methods
    
    func setupUI() {
        let sendButton = UIButton(type: .system)
        sendButton.setTitle("Send", for: .normal)
        sendButton.addTarget(self, action: #selector(sendButtonPressed), for: .touchUpInside)
        view.addSubview(sendButton)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        sendButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        let cancelButton = UIButton(type: .system)
        cancelButton.setTitle("Cancel", for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonPressed), for: .touchUpInside)
        view.addSubview(cancelButton)
        cancelButton.translatesAutoresizingMaskIntoConstraints = false
        cancelButton.topAnchor.constraint(equalTo: sendButton.bottomAnchor, constant: 8).isActive = true
        cancelButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "Type your message here..."
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 16).isActive = true
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        textField.bottomAnchor.constraint(equalTo: sendButton.topAnchor, constant: -8).isActive = true
    }
    
    // MARK: - Button action methods
    
    @objc func sendButtonPressed() {
        guard let text = (view.subviews.first { $0 is UITextField } as? UITextField)?.text else { return }
        delegate?.arnoldViewController(self, didSendText: text)
        dismiss(animated: true, completion: nil)
    }
    
    @objc func cancelButtonPressed() {
        dismiss(animated: true, completion: nil)
    }
    
}
