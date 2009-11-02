import sqlite3/Sqlite3

main: func {
  db := Sqlite3 new("asd.db")
  stmt := db prepare("create table stuff(asd,zxc);")
  stmt step()
  stmt toString() println()
  stmt finalize()
  db close()
}

