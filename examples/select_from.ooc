use sqlite3
import sqlite3/[Sqlite3, ResultCodes]
import structs/HashMap

main: func {
  db := Sqlite3 new("asd.db")
  db exec("select * from stuff", func(vals: HashMap<SqliteValue>){
    vals get("asd") toInt() toString() println()
    vals get("zxc") toInt() toString() println()
  })
  db close()
}

