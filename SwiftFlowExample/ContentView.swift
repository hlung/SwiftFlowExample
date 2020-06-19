import SwiftUI
import SwiftFlow

struct ContentView: View {
  var body: some View {

    let graph = Graph()

    // setup configs
    var blueConfig = NodeConfig()
    blueConfig.backgroundColor = UIColor(red: 0.81, green: 0.96, blue: 1.00, alpha: 1.00)
    var redConfig = NodeConfig()
    redConfig.backgroundColor = UIColor(red: 1.00, green: 0.80, blue: 0.82, alpha: 1.00)

    graph.nodeConfig = blueConfig

    // add flows to graph
    graph.addFlow([
      Node("Start", shape: .pill),
      Arrow(.down),
      Node("Work\nsuccess?", shape: .diamond, id: "success"), // declare id for later reference
      Arrow(.down, title: "Yes"),
      Node("Go Party!", shape: .rect, id: "party"),
      Arrow(.down),
      Node("End", shape: .pill, id: "end")
    ])

    graph.addFlow([
      NodeShortcut(id: "success"), // refers back to the Node above
      Arrow(.right, title: "No"), // branch out to the right side
      Node("Cry", shape: .rect, config: redConfig), // different color using config
      Arrow(.down),
      Node("Go home", shape: .rect, id: "home"),
      ArrowLoopBack(from: .bottom, to: .right),
      NodeShortcut(id: "end")
    ])

    let graphView = GraphView()
    graphView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

    // draw the graph!
    try! graphView.draw(graph)

    return UIViewWrapper(contentView: graphView)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
