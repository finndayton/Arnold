import UIKit
import Messages

class MessagesViewController: MSMessagesAppViewController {
    
    // MARK: - View lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Message handling methods
    
    override func willBecomeActive(with conversation: MSConversation) {
        super.willBecomeActive(with: conversation)
    }
    
    override func didBecomeActive(with conversation: MSConversation) {
        super.didBecomeActive(with: conversation)
    }
    
    override func willResignActive(with conversation: MSConversation) {
        super.willResignActive(with: conversation)
    }
    
    override func didResignActive(with conversation: MSConversation) {
        super.didResignActive(with: conversation)
    }
    
    override func didReceive(_ message: MSMessage, conversation: MSConversation) {
        super.didReceive(message, conversation: conversation)
    }
    
    override func didStartSending(_ message: MSMessage, conversation: MSConversation) {
        super.didStartSending(message, conversation: conversation)
    }
    
    override func didCancelSending(_ message: MSMessage, conversation: MSConversation) {
        super.didCancelSending(message, conversation: conversation)
    }
    
    override func didTransition(to presentationStyle: MSMessagesAppPresentationStyle) {
        super.didTransition(to: presentationStyle)
    }
    
    // MARK: - User interface methods
    
    func presentArnoldViewController() {
        guard let conversation = activeConversation else { return }
        let controller = ArnoldViewController()
        controller.delegate = self
        presentViewController(controller, with: conversation, completion: nil)
    }
    
}

extension MessagesViewController: ArnoldViewControllerDelegate {
    
    func arnoldViewController(_ controller: ArnoldViewController, didSendText text: String) {
        guard let conversation = activeConversation else { return }
        let message = MSMessage()
        let layout = MSMessageTemplateLayout()
        layout.caption = "Anonymous message"
        layout.subcaption = text
        message.layout = layout
        conversation.insert(message) { (error) in
            if let error = error {
                print("Error sending message: \(error.localizedDescription)")
            }
        }
    }
    
}
