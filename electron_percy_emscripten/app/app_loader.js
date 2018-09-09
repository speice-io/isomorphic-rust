import { main } from "./app"

console.log(main(24))

console.log("app_loader entrance")
let rootNode = document.getElementById('root')
//rootNode.parentElement.replaceChild(main(), rootNode)
rootNode = document.getElementById('root')