import UIKit
import WebKit
import SnapKit

class MainViewController: UIViewController {
    
    lazy var stackView = UIStackView()
    lazy var backButton = UIButton()
    lazy var nextButton = UIButton()
    lazy var searchField = UITextField()
    lazy var webKitView = WKWebView()
    
    override func loadView() {
        super.loadView()
        setUpWebKit()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureView()
       
       
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//    }
    
    func setUpWebKit() {
        
        let url = Constants.url
        guard let url = url else {
            return
        }
        webKitView.load(URLRequest(url: url))
        webKitView.allowsBackForwardNavigationGestures = true
        webKitView.allowsLinkPreview = true
        
    }
    
    func configureView() {
        configureStackView()
        configureBackButton()
        configureWebKitView()
        configureNextButton()
        configureSearchField()
    }
    
    func configureStackView() {
        view.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.alignment = .center
        
        stackView.snp.makeConstraints({make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(-20)
            make.right.equalTo(view).inset(20)
            make.left.equalTo(view).offset(20)
            make.height.equalTo(50)
//            make.width.equalTo(300)
            
        })
    }
    
    func configureBackButton() {
        stackView.addSubview(backButton)
        backButton.setTitle("Back", for: .normal)
        backButton.setTitleColor(.black, for: .normal)
        backButton.isEnabled = false
        
        backButton.snp.makeConstraints({make in
            make.left.top.equalTo(stackView)
            make.width.equalTo(40)
            make.height.equalTo(stackView.snp.height)
        })
    }
    
    func configureSearchField() {
        stackView.addSubview(searchField)
        searchField.placeholder = "Type here to search..."
        searchField.isUserInteractionEnabled = true
        searchField.layer.borderColor = UIColor.lightGray.cgColor
        searchField.layer.borderWidth = 0.5
        
        searchField.snp.makeConstraints({make in
            make.left.equalTo(backButton.snp.right).offset(10)
            make.center.equalTo(stackView.snp.center)
            make.top.equalTo(stackView)
            make.height.equalTo(stackView.snp.height)
            
        })
    }
    
    func configureNextButton() {
        stackView.addSubview(nextButton)
        nextButton.setTitle("Next", for: .normal)
        nextButton.setTitleColor(.black, for: .normal)
        nextButton.isEnabled = false
        
        nextButton.snp.makeConstraints({make in
            make.right.top.equalTo(stackView)
            make.height.equalTo(stackView.snp.height)
        })
    }
    
    func configureWebKitView() {

        view.addSubview(webKitView)
        webKitView.snp.makeConstraints({ make in
            make.top.equalTo(stackView.snp.bottom).offset(5)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).inset(20)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        })
    }
    
}



