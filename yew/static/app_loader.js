// We have to have a two-stage loader because WebPack says we do
const app = import("./app")
app.then(() => {
    console.log("Finished resolving application bundle")
}, (e) => {
    console.log("Unable to resolve application bundle: ")
    console.log(e)
})