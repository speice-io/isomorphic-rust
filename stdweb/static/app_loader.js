const app = import("./stdweb_electron")
app.then(module => {
    console.log("Finished resolving application bundle")
    console.log(module)
    module.run()
}, (e) => {
    console.log("Unable to resolve application bundle: ")
    console.log(e)
})