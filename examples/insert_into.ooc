use sqlite3
import Sqlite3

main: func {
  db := Sqlite3 new("asd.db")
  stmt := db prepare("insert into stuff values(42, 31);")
  stmt step()
  stmt toString() println()
  stmt finalize()
  db close()
}

