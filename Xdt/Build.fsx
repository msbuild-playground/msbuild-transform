#r "Microsoft.Web.Xdt.2.1.1/lib/net40/Microsoft.Web.XmlTransform.dll"

open Microsoft.Web.XmlTransform

let source = "App.config"
let transform = "Release.config"

let start() =
    use sourceConfig = new XmlTransformableDocument()
    sourceConfig.Load(source)
    do
        use transform = new XmlTransformation(transform)
        transform.Apply(sourceConfig) |> ignore
    sourceConfig.Save("_App.Release.config")

start()