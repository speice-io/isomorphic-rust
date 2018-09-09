const app = import("./rust_webpack")
app.then(module => {
    console.log("Finished resolving application bundle")
    module.run()
}, (e) => {
    console.log("Unable to resolve application bundle: ")
    console.log(e)
})