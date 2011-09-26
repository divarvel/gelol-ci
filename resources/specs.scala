object UtilitySpecs extends Specification("Utility Specs") {
    "RichMap.zipByKeys" should {
        "filter correctly the two maps" in {
            val m1 = Map( "a" -> 2, "b" -> 3 )
            val m2 = Map( "b" -> 2, "c" -> 4 )
            val m3 = Map( "c" -> 2, "d" -> 4 )

            val rm1 = new RichMap(m1)
            val rm2 = new RichMap(m2)

            rm1.zipByKeys(m2).keySet must_== Set("b")
            rm1.zipByKeys(m3).keySet must_== Set()
        }
        "group correctly values" in {
            val m1 = Map( "a" -> 2, "b" -> 3 )
            val m2 = Map( "b" -> "b", "c" -> "c", "a" -> "a" )
            val rm1 = new RichMap(m1)

            rm1.zipByKeys(m2) must_== Map(
                "a" -> (2, "a"),
                "b" -> (3, "b")
            )
        }
    }
}
