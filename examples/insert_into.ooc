use sqlite3
import sqlite3/Sqlite3

main: func {
  db := Sqlite3 new("asd.db")
  stmt := db prepare("insert into stuff values(?, ?);")
  stmt bindInt(1, 42)
  stmt bindInt(2, 31)
  stmt step()
  stmt toString() println()
  stmt finalize()
  db close()
}

