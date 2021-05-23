//
//  ShareActivity.swift
//  Sharehomework
//
//  Created by Марк Шнейдерман on 23.05.2021.
//

import UIKit

// MARK: - UIActivity

/// По нажатию на activity выводит алерт и говорит спасибо, фотку взял из Сбер Спасибо

class ShareActivity : UIActivity {
    override class var activityCategory: Category { return .share }
    
    override var activityTitle: String? { return "Спасибо" }
    override var activityImage: UIImage? { return UIImage(named: "spasibo")}
    
    override var activityViewController: UIViewController? {
        let alert = UIAlertController(title: "Спасибо", message: "Нам очень приятно что вам нравится наш продукт !", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default) {
            [unowned self] action in
            alert.dismiss(animated: true)
            self.activityDidFinish(true)
        })
        return alert
    }
    
    override func canPerform(withActivityItems activityItems: [Any]) -> Bool {
        return true
    }

}
