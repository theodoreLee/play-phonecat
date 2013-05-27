import sbt._
import Keys._
import play.Project._

object ApplicationBuild extends Build {
  val appName = "phonecat"
  val appVersion = "1.0-SNAPSHOT"

  val appDependencies = Seq()

  val main = play.Project(appName, appVersion, appDependencies)
    .settings(
      coffeescriptOptions := Seq("bare"),
      lessEntryPoints <<= (sourceDirectory in Compile)(base => (
        (base / "assets" / "stylesheets" / "bootstrap" / "bootstrap.less") +++
          (base / "assets" / "stylesheets" / "main.less")
      ))
    )
}
