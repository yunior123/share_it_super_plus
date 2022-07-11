import Flutter
import UIKit

public class SwiftShareItSuperPlusPlugin: NSObject, FlutterPlugin{
    
    
    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "share_it_super_plus", binaryMessenger: registrar.messenger())
        let instance = SwiftShareItSuperPlusPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }
    
    
    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "share_file" {
            let arguments = call.arguments
            
            print(arguments)
            if arguments is Dictionary<String,Any> {
                let args: Dictionary<String,Any> = arguments as! Dictionary<String,Any>
                if args.isEmpty {
                    return
                }
                let path = args["path"]! as! String
                let mimeType = args["mimeType"]! as! String
                let subject = args["subject"]! as! String
                let text = args["text"]! as! String
                
                if path.count == 0 {
                    result(FlutterError(code: "error", message: "Non-empty path expected", details: nil))
                    return
                }
                
                let presentationHandler = ShareItSuperPlusUIActivityViewController()
                
                presentationHandler.presentShareSheet(file: path, mimeType: mimeType, subject: subject, text: text, result: result)
                
                result("ok")
            }else{
                result(FlutterError(code: "ERROR", message: "Wrong args", details: nil)
                )
            }
        } else {
            result(FlutterMethodNotImplemented)
        }
    }
}



class ShareItSuperPlusUIActivityViewController: UIViewController {
    
    public func presentShareSheet( file path: String?,
                                   mimeType: String?,
                                   subject: String?,
                                   text: String?,
                                   result: @escaping FlutterResult
                                   
    ){
        let fileManager = FileManager.default
        
        let rect = CGRect(x: 200, y: 200, width: 10, height: 10)
        
        var viewController = UIApplication.shared.keyWindow!.rootViewController!
        
        if let navigationController = viewController as? UINavigationController {
            viewController = navigationController.topViewController!
        } else if let tabBarController = viewController as? UITabBarController {
            viewController = tabBarController.selectedViewController!
        }
        
        if fileManager.fileExists(atPath: path!){
            let document = NSData(contentsOfFile: path!)
            let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: [document!], applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            activityViewController.popoverPresentationController?.sourceRect = rect
            
            viewController.present(activityViewController, animated: true, completion: nil)
            

//            present(activityViewController, animated: true, completion: nil)
            
            
        }
        else {
            result(FlutterError(code: "ERROR", message: "Document not found", details: nil)
            )
        }
        
    }
}

