import Foundation

// 建立協議
protocol MyDelegate {
    
    // 方法，以results傳送讀取的資料
    func ReceiveResults(results: Any)
    
}
