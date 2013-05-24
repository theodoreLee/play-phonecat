package controllers

import play.api._
import play.api.mvc._

object Application extends Controller {
  
  def index = Action {
    Ok(views.html.index("Your new application is ready."))
  }

  def test(target:String) = Action {
    play.api.Play.current.mode match {
      case Mode.Prod => NotFound
      case _ => Ok(views.html.test(target))
    }
  }
}