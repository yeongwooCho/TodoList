//
//  TodoListViewController.swift
//  TodoList
//
//  Created by 조영우 on 2021/03/02.
//

import UIKit

class TodoListViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var inputViewButton: NSLayoutConstraint!
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var isTodayButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    
    // TODO: TodoViewModel 만들기
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // TODO: 키보드 디텍션
        
        // TODO: 데이터 불러오기
    }

    @IBAction func isTodayButtonTapped(_sender: Any) {
        // TODO: 투데이 버튼 토글 작업
    }
    
    @IBAction func addTaskButtonTapped(_sender: Any) {
        // TODO: Task 추가
        // add task to view model
        // and tableview reload or update
    }
    
    // TODO: background tap했을때 키보드 내려오게 하기
}

extension TodoListViewController {
    @objc private func adjustInputView(noti: Notification) {
        guard let userInfo = noti.userInfo else { return }
        // TODO: 키보드 높이에 따른 인풋뷰 위치 변경
    }
}

extension TodoListViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // TODO: 섹션 몇개?
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // TODO: 섹션별 아이템 몇개?
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // TODO: custom cell
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TodoListCell", for: indexPath) as? TodoListCell else {
            return UICollectionViewCell()
        }
        return cell
        
        // TODO: todo를 이용해서 updateUI
        // TODO: doneButtonHandler 작성
        // TODO: deleteButtonHandler 작성
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TodoListHeaderView", for: indexPath) as? TodoListHeaderView else {
                return UICollectionReusableView()
            }
            
            guard let section = TodoViewModel.Section(rawValue: indexPath.section) else {
                return UICollectionReusableView()
            }
            
            header.sectionTitleLabel.text = section.title
            return header
        default:
            return UICollectionReusableView()
        }
    }
}

extension TodoListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // TODO: 사이즈 계산하기
        let width: CGFloat = collectionView.bounds.width
        let height: CGFloat = 50
        return CGSize(width: width, height: height)
    }
}


class TodoListCell: UICollectionViewCell {
    @IBOutlet weak var checkButton: UIButton!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var strikeThroughView: UIView!
    
    @IBOutlet weak var strikeThroughWidth: NSLayoutConstraint!
    
    var doneButtonTapHandler: ((Bool) -> Void)?
    var deleteButtonTapHandler: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        reset()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        reset()
    }
    
    func updateUI(todo: Todo) {
        // TODO: cell update
    }
    
    private func showStrikeThrough(_ show: Bool) {
        if show {
            strikeThroughWidth.constant = descriptionLabel.bounds.width
        } else {
            strikeThroughWidth.constant = 0
        }
    }
    
    func reset() {
        // TODO: reset logic 구현
    }
    
    @IBAction func checkButtonTapped(_sender: Any) {
        // TODO: checkButton 처리
    }
    
    @IBAction func deleteButtonTapped(_sender: Any) {
        // TODO: deleteButton 처리
        deleteButtonTapHandler?()
    }
}


class TodoListHeaderView: UICollectionReusableView {
    @IBOutlet weak var sectionTitleLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
}
