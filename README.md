# TodoList
IOS Application by codable


**학습한 내용**

+ Data R/W
  - Codable: Provides convenience when reading and writing JSON data format. Supported in Swift 4 or later.
  - Parsing: It is what turns a file into an object that Swift can understand.
  - Codable is a format that combined Decodable and Encodable.

+ FileManager
  - .documentDirectory: According to the Apple document, it is recommended that all content created by the user be saved in the Documents directory. Since we want to store the file, it will have to be stored in documentDirectory. If so, knowing where the documentDirectory is would be your first priority. Therefore, the code below is the code to get the Document Directory URL.
~~~
public class Storage {
    
    private init() { }
    
    // TODO: directory 설명
    // TODO: FileManager 설명
    
    enum Directory {
        case documents
        case caches
        
        var url: URL {
            let path: FileManager.SearchPathDirectory
            switch self {
            case .documents:
                path = .documentDirectory
            default:
                path = .cachesDirectory
            }
            return FileManager.default.urls(for: path, in: .userDomainMask).first!
        }
    }
}
~~~
  - The urls method is a method that returns an array of URLs for the specified common directory in the requested domain. The first parameter for is the search path directory. The second parameter in indicates Domain.
  - FileManager.default: It make Singleton instance of FileManager

+ Keyboard - Notification
  - I am observing a Notification with a specific name in NotificationCenter. Here we are observing the visibility and hiding of the keyboard. When a change occurs, the @objc method called 'adjustInputView' is called.
~~~
class TodoListViewController: UIViewController {
    let todoListViewModel = TodoViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(adjustInputView), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(adjustInputView), name: UIResponder.keyboardWillHideNotification, object: nil)
        todoListViewModel.loadTasks()
    }
}

extension TodoListViewController {
    @objc private func adjustInputView(noti: Notification) {
        guard let userInfo = noti.userInfo else { return }
        // [x] TODO: 키보드 높이에 따른 인풋뷰 위치 변경
        guard let keyboardFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        
        if noti.name == UIResponder.keyboardWillShowNotification {
            let adjustmentHeight = keyboardFrame.height - view.safeAreaInsets.bottom
            inputViewBottom.constant = adjustmentHeight
        } else {
            inputViewBottom.constant = 0
        }
        print("---> Keyboard End Frame: \(keyboardFrame)")
    }
}
~~~


+ UIResponder
  - Indicates the UI response to the request.
  - Tap Gesture Recognizer: Used to control keyboard hiding by tap. We will resign the current priority response. If We click the view, the keyboard is resigned
~~~
@IBAction func tapBG(_ sender: Any) {
        inputTextField.resignFirstResponder()
}
~~~

+ Tab Bar Controller
  - The ViewControllers are connected by a relationship segue.
  - One bar is connected to one ViewController

+ MVVM Design Patten (Model - Todo, ViewModel - TodoViewModel, View - TodoViewController)
  - It is a design pattern that improves MVC with too many roles in ViewController.
  - In Model, use codable to read and write JSON data format and Equatable to operator overloading
  - In ViewModel, use enum Section citing CaseIterable protocol to dividing Section

+ User Interface Update
  - UI is updated by DispatchQueue.main.async


**결과물**

> 감코블로그: https://yeongwoo-cho.tistory.com/category/IOS%20application/To%20Do%20List%20%28project%29


**저작권**
> fastcampus: https://www.fastcampus.co.kr/

> 이준원: https://github.com/cafielo

