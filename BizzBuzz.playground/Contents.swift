for i in 1...100 {
    var log = ""
    var content = (i % 3, i % 5)
    switch content {
    case (0, _):
        log += "Bizz"
        if content.1 == 0 {
            log += "\t"
            fallthrough
        }
    case (_, 0):
        log += "Buzz"
    default:
        log = String(i)
    }
    
    print(log)
}
