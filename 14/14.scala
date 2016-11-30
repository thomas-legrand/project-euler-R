import scala.collection.mutable
import scala.collection.mutable.HashMap


object euler14 {

  final val maxLength = 10000
  final val factor = 10000
  val map = new HashMap[Int, Int]()
  val mapLength = new HashMap[Int, Int]()

  def init(): Unit = {
    val l = 1 to (factor * maxLength - 1) by 2
    l.foreach(i => map.put(i, 3 * i + 1))

    val m = 2 to (factor * maxLength) by 2
    m.foreach(i => map.put(i, i / 2))

    mapLength.put(1, 1)
  }

  def next(a: Int): Int = {
    if (a % 2 == 0) {
      return a / 2
    } else {
      return 3 * a + 1
    }
  }

  def findLength(a: Int): Int = {
    if (mapLength.get(a).isEmpty) {
      if (map.get(a).isEmpty) {}
      val l = findLength(map.getOrElse(a, -1)) + 1
      mapLength.put(a, l)
      return l
    } else {
      return mapLength.get(a).get
    }
  }

  def main(args:Array[String]) {
    init()
    val x = 1 to maxLength
    x.foreach(i => findLength(i))
    val maxl = mapLength.values.max
    println(maxl)
  }
}




