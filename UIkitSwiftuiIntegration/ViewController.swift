//
//  ViewController.swift
//  UIkitSwiftuiIntegration
//
//  Created by Urvashi Gupta on 21/11/23.
//

import UIKit
import SwiftUI
import Combine


protocol ViewControllerDelegate{
    func updateEmailBtnTapped(email: String)
}
class ViewController: UIViewController {
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var stepup: UIButton!
     var loginModel = LoginModel()
    var child : UIHostingController<ContentView>!
    @IBOutlet weak var updateEmailTextbox: UITextField!
    var stepCount = StepCountModel()
    @IBOutlet weak var updateEmailBtn: UIButton!
    let headerlabel = UILabel()
    var delegate : ViewControllerDelegate?
    @IBOutlet weak var tableView: UITableView!
    private var cancellable = Set<AnyCancellable>()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .blue
        child = UIHostingController(rootView: ContentView(stepCount: stepCount))
        child.view.frame = CGRect(x: 0, y: 200, width: view.frame.width/5, height: view.frame.height/4)
        self.view.addSubview(child.view)
        child.didMove(toParent: self)
        loginModel.$email.sink { email in
            self.emailLabel.text = email == "" ? "Hii" : email
        }.store(in: &cancellable)

        // Do any additional setup after loading the view.
    }
    func update(){
        child.rootView = ContentView(stepCount: stepCount)
        child.view.frame = CGRect(x: 100, y: 150, width: view.frame.width, height: view.frame.height/2)
                self.view.addSubview(child.view)
                child.didMove(toParent: self)
    }
    @IBAction func updateEmailTapped(_ sender: UIButton) {
        
        delegate?.updateEmailBtnTapped(email: updateEmailTextbox.text ?? "")
    }
    
    @IBAction func GotoLoginPageButtonTapped(_ sender: UIButton) {
        self.navigationController?.pushViewController(UIHostingController(rootView: LoginScreen(loginModel: loginModel)), animated: true)
    }

    @IBAction func stepUpTapped(_ sender: UIButton) {
        stepCount.stepCount+=1
    }
    
}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.contentConfiguration = UIHostingConfiguration(content: {
            HStack(alignment: .center){
                Text("\(indexPath.row): ")
                ContentView(stepCount: stepCount)
                   
                Spacer()
                Image(systemName: "heart.fill")
                    .foregroundStyle(.red)
            }
            .swipeActions(edge: .leading) {
                Image(systemName: "trash")
            }
        })
        return cell
    }

    
}
struct ViewControllerWrapper: UIViewControllerRepresentable {
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    var loginModel : LoginModel
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        uiViewController.emailLabel.text = loginModel.email
    }
    
    class Coordinator:NSObject,ViewControllerDelegate{
        var parent: ViewControllerWrapper
        
        init(parent: ViewControllerWrapper) {
            self.parent = parent
        }
        func updateEmailBtnTapped(email:String) {
            parent.loginModel.email = email
        }
        
        
    }
    typealias UIViewControllerType = ViewController
   
    func makeUIViewController(context: UIViewControllerRepresentableContext<ViewControllerWrapper>) -> ViewController {

        guard let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "ViewController") as? ViewController else {
                    fatalError("ViewController not implemented in storyboard")
                }

        viewController.delegate = context.coordinator
        return viewController
    }
}

