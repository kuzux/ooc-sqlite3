use sqlite3
import sqlite3/[Sqlite3, ResultCodes]
import structs/HashMap

main: func {
  db := Sqlite3 new("asd.db")
  stmt := db prepare("select * from stuff")
  stmt toString() println()
  res := stmt step()
  while(res==Sqlite3Code row){
    h := stmt toHashMap()
    h get("asd") toInt() toString() println()
    h get("zxc") toInt() toString() println()

    res = stmt step()
  }
  stmt finalize()
  db close()
}

