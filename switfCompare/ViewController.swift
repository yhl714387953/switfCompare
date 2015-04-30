//
//  ViewController.swift
//  switfCompare
//
//  Created by yuhailong on 14-12-11.
//  Copyright (c) 2014年 polystor. All rights reserved.
//

import UIKit

let kCommonAPI = "http://xxxxxxx"//宏定义
enum MyEnum: NSInteger{case EAST = 100 ,WEST ,SOUTH ,NORTH}//枚举
enum Rank:Int{
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eignt, Nine, Ten
    case Jack, Queen, King
//    func simpleDescription() ->NSString{
//        switch self{
//        case.Ace:
//            return "ace"
//        case.Jack:
//            return "jack"
//        default:
//            return "default"
//        }
//    }
}



class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, 郑经理Delegate, HLViewDelegate{
    
//    MARK: PROPERTY
    var imageView : UIImageView!
    var myEnum : MyEnum?
    var myTF : UITextField!
    var assetslibrary: ALAssetsLibrary!
    
//    MARK: METHOD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        println(self.view.frame.size.width)
        println(self.view.frame.size.height)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardAction:"), name: UIKeyboardWillChangeFrameNotification, object: nil)
        
        
        
        self.printSomething()
        self.configureUI()
        self.sortArray()
        self.testEnum()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func testEnum(){
        let a_enum = Rank.Ace
        
    }
    
    func keyboardAction(notification: NSNotification){
        
        
        
        println(notification)
        
        var dic : NSDictionary = notification.userInfo!
        var keyboardFrame = (dic.objectForKey(UIKeyboardFrameEndUserInfoKey) as NSValue).CGRectValue()
        
        println(keyboardFrame)
        var frame = self.myTF.frame
        frame.origin.y = keyboardFrame.origin.y - frame.size.height
        self.myTF.frame = frame
        
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        self.myTF.resignFirstResponder()
    }
    
    func printSomething(){
        println(self.view.frame.size.width)
        println(self.view.frame.size.height)
        
        self.myEnum = .EAST//枚举使用
        println(MyEnum.WEST.rawValue)//打印枚举的值，这样就不用OC那个强转整型了
        
        println(kCommonAPI)//宏
        
        let 嘴爷 = "abc"
        var b = "ABC"
        println(嘴爷, b.lowercaseString)
    }
    
    func sortArray() {
        var array1 = ["a", "c", "b", "d"] as NSArray //(arrayLiteral:"a", "c", "b", "d")
        println(array1)
        var array2 = array1.sortedArrayUsingSelector(Selector("compare:"))
        println(array2)
        
    }
    
    func configureUI(){
        self.myTF = UITextField(frame: CGRectMake(25, self.view.frame.size.height - 50, 300, 40))
        self.myTF.borderStyle = UITextBorderStyle.RoundedRect
        self.myTF.placeholder = "请输入蠢蠢"
        self.myTF.keyboardType = UIKeyboardType.DecimalPad
        self.view.addSubview(self.myTF)

        let button: UIButton = UIButton()
        button.frame = CGRectMake(100, 200, 50, 50)
        button.backgroundColor = UIColor.grayColor()
        button.setImage(UIImage(named: "logo100_100@2x"), forState: UIControlState.Normal)
        button.addTarget(self, action: "clicked:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
        
        let button1: UIButton = UIButton()
        button1.frame = CGRectMake(200, 200, 50, 50)
        button1.backgroundColor = UIColor.grayColor()
        button1.setImage(UIImage(named: "logo100_100@2x"), forState: UIControlState.Normal)
        button1.addTarget(self, action: "clicked1:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button1)
        
        
        let textLabel = UILabel(frame: CGRectMake(30, 100, 200, 30))
        textLabel.text = "swift createLabel"
        var whiteColor = UIColor(red: 30 / 255.0, green: 60 / 255.0, blue: 90 / 255.0, alpha: 1)
        textLabel.backgroundColor = whiteColor;
        textLabel.textAlignment = NSTextAlignment.Right;
        textLabel.font = UIFont(name: "", size: 16)
        textLabel.textColor = UIColor.orangeColor()
        textLabel.layer.borderColor = UIColor.redColor().CGColor
        textLabel.layer.borderWidth = 1
        textLabel.layer.cornerRadius = 8
        textLabel.layer.masksToBounds = true
        self.view.addSubview(textLabel)
        
        //        自定义控件
        let chunView = Chunchun()
        chunView.frame = CGRectMake(20, 300, 100, 20)
        self.view.addSubview(chunView)
        
        //        用xib定义的控件
        var cell = (NSBundle.mainBundle().loadNibNamed("ChunCell", owner: self, options: nil) as NSArray).lastObject as ChunCell;
        cell.delegate = self;
        cell.frame = CGRectMake(150, 300, 200, 50)
        self.view.addSubview(cell)
        
        //        调用OC的类
        let hview = HLView(frame: CGRectMake(200, 500, 50, 50));
        hview.backgroundColor = UIColor.orangeColor()
        hview.getRangeByName("name", andCount: 1)
        hview.delegate = self;
        self.view.addSubview(hview)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
//    MARK: HLViewDelegate
    func hlViewClicked(view: HLView!) {
        
    }
    
//    MARK: 郑经理Delegate
    func chunCellButtonClicked(cell: ChunCell, buttonIndex: NSInteger) {
        println(buttonIndex)
        println("点到蠢蠢了")
    }
    
    
//    MARK: BUTTON_CLICKED
    func clicked(sender: UIButton){
        
        let vc = UIImagePickerController()
        vc.delegate = self;
        self.presentViewController(vc, animated: true, completion: nil)
        
    }
    
    func clicked1(sender: UIButton){
        println("aaaa\n");
        println(sender.frame.size.height);
        
        let dic: NSMutableDictionary = NSMutableDictionary(objectsAndKeys: "obj_a","key_a", "obj_b","key_b", "obj_c","key_c")
        dic.setObject("obj_d", forKey: "key_d")
        dic.removeObjectForKey("key_a")
        println(dic)
        println(dic.allKeys)
        println("蠢蠢呐，what a bad boy!")
    }


//  MARK: UIImagePickerControllerDelegate
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        
        println(info)
        
        self.imageView = UIImageView(frame: CGRectMake(100, 400, 100, 100))
        var image = (info as NSDictionary).objectForKey("UIImagePickerControllerOriginalImage") as UIImage
        self.imageView!.image = image
        self.view.addSubview(self.imageView!)
        
        var imageURL = (info as NSDictionary).objectForKey("UIImagePickerControllerReferenceURL") as NSURL
        var assetslibrary = ALAssetsLibrary()

//        UIImageWriteToSavedPhotosAlbum(image, self, Selector("imageSavetoPhotosAlbum:"), nil)
        assetslibrary.assetForURL(imageURL, resultBlock: { (var myAsset: ALAsset?) -> Void in
//            self.assetslibrary = ALAssetsLibrary()
            assetslibrary.addAssetsGroupAlbumWithName("hello", resultBlock: nil, failureBlock: nil)
            
//           保存到指定相册 (扩展方法)那个block里的内容不能给nil，会崩掉的，没有相册就自己创建一个了
            assetslibrary.saveImage(image, toAlbum: "zuiye", withCompletionBlock: { (var error) -> Void in
                
            })
            
//           保存到指定相册 (扩展方法)那个block里的内容不能给nil，会崩掉的，没有相册就自己创建一个了
            assetslibrary.addAssetURL(imageURL, toAlbum: "maye", withCompletionBlock: { (var error) -> Void in
                
            })
            
            var representation = myAsset?.defaultRepresentation()
            var name = representation?.filename()
            var imageName = name!
            println(imageName)
            
            var dimensions = representation?.dimensions() as CGSize!
            println("width: " + "\(dimensions.width)" + "   height: " + "\(dimensions.height)")
            
            var metadata = representation?.metadata()
            println(metadata)
            
            var metDic = NSMutableDictionary(dictionary: metadata!)
//            var GPSDic = metDic.objectForKey("kCGImagePropertyGPSDictionary")?.mutableCopy()
            println(metDic)
            
        }, failureBlock: nil)
        
        picker.dismissViewControllerAnimated(true, completion: nil)
        
//        var library = ALAssetsLibrary();
//        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
//        library.writeImageToSavedPhotosAlbum(image.CGImage, orientation: image.imageOrientation) { (var url: NSURL?, var error: NSError?) -> Void in
//            print(error?.description)
//        }
        
    }
    
//    MARK: COMMON_METHOD
    //验证字符串的合法性
    func checkNumberByCheckedString(checkedString : NSString) ->Bool {
        var isAllNumber: Bool = true
        //    验证纯数字
        for var i = 0; i < checkedString.length; i++ {
            var checkStr = checkedString.characterAtIndex(i)
            if(checkStr < 48 || checkStr > 57){
                isAllNumber = false
                break
            }
        }
        
        //    如果不满足是纯数字且长度大于9，则不通过验证
        if (!(!isAllNumber && checkedString.length > 9)){return false}
        
        //    验证是否包含空格
        if (checkedString.rangeOfString(" ").length > 0){return false}
        
        //    验证长度
        if (checkedString.length < 6 || checkedString.length > 16){return false}
        
        return true
    }

    
}

