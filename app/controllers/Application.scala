package controllers

import play.api._
import play.api.mvc._

object Application extends Controller {
  
  def index = Action {
    Ok(views.html.index("Your new application is ready."))
  }


  def json(fileName:String) = Action {
    Redirect(routes.Assets.at(s"json/$fileName"))
  }

  def retrieveImage(fileName:String) = Action {
    Redirect(routes.Assets.at(s"images/phones/$fileName"))
  }

  def test(target:String, mode:String) = Action {
    val playMode = play.api.Play.current.mode
    (playMode, mode) match {
      case (Mode.Prod, _) => NotFound
      case (_,"scenario") => Ok(views.html.testScenarios())
      case _ => Ok(views.html.test(target))
    }
  }
}
