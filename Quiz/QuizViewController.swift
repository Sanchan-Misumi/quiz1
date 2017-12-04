//
//  QuizViewController.swift
//  Quiz
//
//  Created by Maho Misumi on 2017/11/30.
//  Copyright © 2017年 Maho Misumi. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
//    問題文を格納する配列
    var quizArray = [Any]()
//    正解数
    var correctAnswer: Int = 0
//    クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
//    選択肢のボタン
    @IBOutlet var choiceButton1:UIButton!
    @IBOutlet var choiceButton2:UIButton!
     @IBOutlet var choiceButton3:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
          // Do any additional setup after loading the view.
         var tmpArray = [Any]()
        tmpArray.append(["ベトナム人が食べる麺の名前は？","フォー","ラーメン","うどん",1])
         tmpArray.append(["イラン人が毎朝食べるのは？","パスタ","ナン","ご飯",2])
         tmpArray.append(["タイ人が好きな柑橘系の葉の香辛料は何の葉っぱ？","ぶどう","みかん","りんご",2])
         tmpArray.append(["シンガポールにいる中国人は何と呼ばれる？","ナンちゃん","うどんちゃん","華橋",3])
         tmpArray.append(["ヨーロッパで食べる野菜で作った赤いジャムの原料は？","りんご","いちご","ルバーブ",3])
         tmpArray.append(["ハリーポッターの登場人物の中で、死ぬ直前に悪役ではなかったことが分かった先生の名前は？","ルーピン","マクゴナガル","スネイプ",3])
        
        //問題を収納してtmpArrayに格納する
        while(tmpArray.count > 0) {
            let index = Int(arc4random()) % tmpArray.count
            quizArray.append(tmpArray[index])
            tmpArray.remove(at: index)
        }
        choiceQuiz()
    }
    func choiceQuiz(){
//        一時的にクイズを取り出す配列
        let tmpArray = quizArray[0] as! [Any]
//        問題文のテキストを表示
        quizTextView.text = tmpArray[0] as! String
//        選択肢のボタンにそれぞれの選択肢のテキストを表示
        choiceButton1.setTitle(tmpArray[1] as? String, for: .normal)
        choiceButton2.setTitle(tmpArray[2] as? String, for: .normal)
        choiceButton3.setTitle(tmpArray[3] as? String, for: .normal)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func choiceAnswer(sender: UIButton){
        let  tmpArray = quizArray[0] as! [Any]
        if tmpArray[4] as! Int == sender.tag{
            //正解数を増やす
            correctAnswer = correctAnswer + 1
        }
        //解いた問題をquizArrayから取り除く
        quizArray.remove(at: 0)
//        解いた問題数の合計があらかじめ設定していた問題数に達したら結果画面へ
        if quizArray.count == 0 {
            performSegueToresult()
        } else {
            choiceQuiz()
        }
    }
    
    func  performSegueToresult(){
        performSegue(withIdentifier: "toresultView", sender: nil)
    }
    //セグエを準備するときに読まれるメソッド
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "toresultView"{
            let resultViewController = segue.destination as! resultViewController
            resultViewController.correctAnswer = self.correctAnswer
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
