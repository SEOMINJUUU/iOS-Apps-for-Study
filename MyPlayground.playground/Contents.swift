//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.frame = CGRect(x: 150, y: 200, width: 200, height: 20)
        label.text = "Hello World!"
        label.textColor = .black
        
        view.addSubview(label)
        self.view = view
    }
}
// Present the view controller in the Live View window
//PlaygroundPage.current.liveView = MyViewController()


class ViewController: UIViewController {
    private weak var contentView: UIView!
    
    override func loadView() {
        self.view = .init()
        
        let contentView: UIView = { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = UIColor.yellow
            view.layer.cornerRadius = 8.0
            return view
        }(UIView())
        
        self.view.addSubview(contentView)
        
        let safeArea = self.view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
//            contentView.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
//            contentView.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor),
            contentView.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 50),
            contentView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 50),
            contentView.heightAnchor.constraint(equalToConstant: 100),
            contentView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
        self.contentView = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

PlaygroundPage.current.liveView = ViewController()
