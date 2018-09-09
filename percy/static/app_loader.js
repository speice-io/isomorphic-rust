const app = import("./percy")
app.then(module => {
    console.log("Finished resolving application bundle")
    let rootNode = document.getElementById('root')
    rootNode.parentElement.replaceChild(module.main(), rootNode)
    rootNode = document.getElementById('root')
}, (e) => {
    console.log("Unable to resolve application bundle: ")
    console.log(e)
})