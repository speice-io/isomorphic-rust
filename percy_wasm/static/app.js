import { main } from "./electron_percy_wasm"

let rootNode = document.getElementById('root')
rootNode.parentElement.replaceChild(main(), rootNode)
rootNode = document.getElementById('root')