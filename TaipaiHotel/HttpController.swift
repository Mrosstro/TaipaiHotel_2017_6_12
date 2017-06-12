import Foundation

class HttpController {
    
    // 建立委派物件
    var delegate:MyDelegate? = nil

    func onSearch(urls: String){
        
        let url:URL = URL(string: urls)!
        let session = URLSession.shared
        
        //讀取網頁資料
        let task = session.dataTask(with: url, completionHandler:{
            data,response,Error in
            
            let httpResponse = response as? HTTPURLResponse
            
            if httpResponse?.statusCode == 200 {
                let json = try! JSONSerialization.jsonObject(with: data!, options: []) as! [Any]
                
                self.delegate?.ReceiveResults(results: json)
            }
        })
        
        task.resume()
    }

}
