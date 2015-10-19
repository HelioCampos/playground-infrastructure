package default

import scala.concurrent.duration._

import io.gatling.core.Predef._
import io.gatling.http.Predef._
import io.gatling.jdbc.Predef._

class SampleApplicationLoadTest extends Simulation {
	val httpProtocol = http
		.baseURL("http://localhost:8080")
		.inferHtmlResources()

	val scn = scenario("SampleApplicationLoadTest")
		.exec(http("requests")
			.get("/")
			.check(bodyString.is("Hello World!")))

	setUp(scn.inject(atOnceUsers(100))).protocols(httpProtocol)

}