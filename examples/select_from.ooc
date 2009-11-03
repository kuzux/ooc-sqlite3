use sqlite3
import Sqlite3

main: func {
  db := Sqlite3 new("asd.db")
  stmt := db prepare("select * from stuff limit 1;")
  stmt toString() println()
  stmt step()
  
  stmt columnName(0) println()
  stmt intColumn(0) toString() println()  
  stmt columnName(1) println()
  stmt intColumn(1) toString() println()

  stmt finalize()
  db close()
}

